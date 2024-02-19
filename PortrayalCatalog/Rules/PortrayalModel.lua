--[[
This file contains the global functions that define the Lua Portrayal Model classes.
These functions are intended to be called by the portrayal rules.
--]]
-- #61

require 'PortrayalAPI'

local CreateContextParameters, CreateFeaturePortrayalItemArray, CreateFeaturePortrayal, CreateDrawingInstructions
local GetMergedDisplayParameters

PortrayalModel =
{
	Type = 'PortrayalModel'
}

function PortrayalModel.CreatePortrayalContext()
	local portrayalContext =
	{
		Type = 'PortrayalContext',
		ContextParameters = CreateContextParameters(),
		FeaturePortrayalItems = CreateFeaturePortrayalItemArray()
	}

	Debug.StopPerformance('Lua Code - Total')
	local featureIDs = HostGetFeatureIDs()
	Debug.StartPerformance('Lua Code - Total')

	for _, featureID in ipairs(featureIDs) do
		Debug.StopPerformance('Lua Code - Total')
		local featureCode = HostFeatureGetCode(featureID)
		Debug.StartPerformance('Lua Code - Total')
		local feature = CreateFeature(featureID, featureCode)

		portrayalContext.FeaturePortrayalItems:AddFeature(feature)
	end

	function portrayalContext:GetFeatures(featureType)
		local features = {}

		for _, featurePortrayalItem in ipairs(self.FeaturePortrayalItems) do
			local feature = featurePortrayalItem.Feature

			if featureType == nil or feature.Code == featureType then
				features[#features + 1] = feature
			end
		end

		return features
	end

	return portrayalContext
end

function ObservedContextParametersAsString(featurePortrayalItem)
	Debug.StartPerformance('Lua Code - ObservedContextParametersAsString')

	local inUse = featurePortrayalItem.InUseContextParameters

	local observedValues = {}

	for observed, _ in pairs(featurePortrayalItem.ObservedContextParameters) do
		if observed ~= "_observed" then
			local value = inUse[observed]

			if type(value) == 'boolean' then
				value = value and 'true' or 'false'
			elseif type(value) == 'table' and value.Type == 'ScaledDecimal' then
				value = value:ToNumber()
			end

			observedValues[#observedValues + 1] = observed .. ':' .. value;
		end
	end

	observedValues = table.concat(observedValues, ';')

	Debug.StopPerformance('Lua Code - ObservedContextParametersAsString')

	return observedValues
end

function CreateContextParameters()
	local contextParameters = { _observed = {} }
	
	local ppMetaTable =
	{
		__index = function (t, k)
			if k == '_asTable' then
				local cp = {}

				for k, v in pairs(contextParameters) do
					cp[k] = v
				end

				return cp
			elseif k == '_underlyingTable' then
				return contextParameters
			else
				local r = contextParameters[k]
			
				if r == nil then
					error('Invalid mariner setting "' .. tostring(k) .. '"', 2)
				end
			
				contextParameters._observed[k] = true

				--Debug.Trace('Portrayal paramter "' .. k .. '" observed.')

				return r;
			end
		end,
		
		__newindex = function (t, k, v)
			if contextParameters[k] == nil then
				error('Attempt to set invalid portrayal paramter "' .. tostring(k) .. '"', 2)
			end
			
			contextParameters[k] = v

			if type(v) == 'boolean' then
				-- Cannot concatenate booleans
				if v then
					Debug.Trace('Setting portrayal paramter: ' .. k .. ' = true')
				else
					Debug.Trace('Setting portrayal paramter: ' .. k .. ' = false')
				end
			elseif type(v) ~= 'table' then
				Debug.Trace('Setting portrayal paramter: ' .. k .. ' = ' .. v .. '')
			elseif v.Type == 'ScaledDecimal' then
				Debug.Trace('Setting portrayal paramter: ' .. k .. ' = ' .. v:ToNumber() .. '')
			end
		end
	}
	
	local ppProxy = { Type = 'ContextParametersProxy' }
	
	setmetatable(ppProxy, ppMetaTable)
	
	return ppProxy
end

function CreateFeaturePortrayalItemArray()
	local featurePortrayalItemArray = { Type = 'array:FeaturePortrayalItem' }

	function featurePortrayalItemArray:AddFeature(feature)
		CheckType(feature, 'Feature')

		local featurePortrayalItem = { Type = 'FeaturePortrayalItem', Feature = feature, ObservedContextParameters = {} }

		feature.LuaFeaturePortrayalItem = featurePortrayalItem

		function featurePortrayalItem:NewFeaturePortrayal()
			self.LuaFeaturePortrayal = CreateFeaturePortrayal(self.Feature)
			feature.featurePortrayal = self.LuaFeaturePortrayal

			return self.LuaFeaturePortrayal
		end

		self[#self + 1] = featurePortrayalItem
		self[feature.ID] = featurePortrayalItem
	end

	return featurePortrayalItemArray
end

function InstructionSpatialReference(spatialAssociation)
	return spatialAssociation.SpatialID .. ',' .. spatialAssociation.Orientation.Name
end

function CreateFeaturePortrayal(feature)
	CheckType(feature, 'Feature')

	local featurePortrayal =
	{
		Type = 'FeaturePortrayal',
		Feature = feature,
		FeatureReference = feature.ID,
		DrawingInstructions = CreateDrawingInstructions(),
		GetFeatureNameCalled = false,
	}

	function featurePortrayal:AddInstructions(instructions)
		CheckSelf(self, featurePortrayal.Type)
		CheckType(instructions, 'string')

		self.DrawingInstructions:Add(instructions)
	end

	function featurePortrayal:AddTextInstruction(text, textViewingGroup, textPriority, viewingGroup, priority, isLightDescription)
		CheckSelf(self, featurePortrayal.Type)
		CheckType(text, 'string')
		CheckType(textViewingGroup, 'number')
		CheckType(textPriority, 'number')
		CheckType(viewingGroup, 'number')
		CheckTypeOrNil(priority, 'number')
		
		local placementFeature = self.Feature
		
		local textAssociation = self.Feature:GetFeatureAssociations('TextAssociation')
		if textAssociation and #textAssociation > 0 then
			-- 0: place feature name override
			-- 1: place feature name
			-- 2: place light description
			local placementType = textAssociation[1].textType or 0
			local isLightPlacement = placementType == 2
			if (isLightDescription and isLightPlacement) or (not isLightDescription and not isLightPlacement) then
			
				-- Make the TextPlacement feature the target of our drawing instructions
				placementFeature = textAssociation[1]
				placementFeature.featurePortrayal = placementFeature.LuaFeaturePortrayalItem:NewFeaturePortrayal()
				
				-- Add scaleMinimum if present
				local scaleMinimum = feature['!scaleMinimum']
				if scaleMinimum and not portrayalContext.ContextParameters.IgnoreScamin then
					placementFeature.featurePortrayal:AddInstructions('ScaleMinimum:' .. scaleMinimum)
				end

				-- Add the instructions to offset the text relative to the location of the TextPlacement feature
				local length = placementFeature.textOffsetDistance or 0
				if length ~= 0 then
					local direction = placementFeature.textOffsetBearing or 0
					placementFeature.featurePortrayal:AddInstructions('AugmentedRay:GeographicCRS,' .. direction .. ',PortrayalCRS,' .. length)
				end
				
				-- Center the text on the point
				placementFeature.featurePortrayal:AddInstructions('TextAlignHorizontal:Center;TextAlignVertical:Center')

				-- Copy current text style to target feature (TextAlignHorizontal and TextAlignVertical are intentionally not copied)
				local fontStyle = {
					['DisplayPlane:'] = 'DisplayPlane:UnderRADAR',
					['FontColor:'] = 'FontColor:CHBLK',	-- transparency = 0
					['FontBackgroundColor:'] = nil,		-- token="", transparency=1
					['FontSize:'] = nil,				-- 10
					['FontProportion:'] = nil,			-- "Proportional"
					['FontWeight:'] = nil,				-- "Medium"
					['FontSlant:'] = nil,				-- "Upright"
					['FontSerifs:'] = nil,				-- false
					['FontUnderline:'] = nil,			-- false
					['FontStrikethrough:'] = nil,		-- false
					['FontUpperline:'] = nil,			-- false
					['FontReference:'] = nil,			-- ""
					['TextVerticalOffset:'] = nil		-- 0
				}
				for _, v in ipairs(self.DrawingInstructions) do
					for instruction in string.gmatch(v, "([^;]+)") do
						for k, _ in pairs(fontStyle) do
							if string.find(instruction, k, 1, true) ~= nil then
								k = v
							end
						end
					end
				end
				
				-- Add the style to the TextPlacement feature
				for k, v in pairs(fontStyle) do
					if v ~= nil then
						placementFeature.featurePortrayal:AddInstructions(v)
					end
				end
				-- Done copying text style
			end
		end
		
		-- Add the instructions to draw the text
		placementFeature.featurePortrayal:AddInstructions('ViewingGroup:' .. textViewingGroup .. ',' .. viewingGroup .. ';DrawingPriority:' .. textPriority .. ';TextInstruction:' .. text)
		if placementFeature == self.Feature then
			-- Reset the state in case the caller generates further non-text drawing instructions
			self:AddInstructions('ViewingGroup:' .. viewingGroup)
			if priority then
				self:AddInstructions('DrawingPriority:' .. priority)
			end
		else
			HostPortrayalEmit(placementFeature.featurePortrayal.FeatureReference, table.concat(placementFeature.featurePortrayal.DrawingInstructions, ';'), ObservedContextParametersAsString(placementFeature.LuaFeaturePortrayalItem))
		end
	end

	function featurePortrayal:AddSpatialReference(spatialAssociation)
		CheckSelf(self, featurePortrayal.Type)
		CheckType(spatialAssociation, 'SpatialAssociation')

		if spatialAssociation.Orientation.Name == 'Forward' then
			self.DrawingInstructions:Add('SpatialReference:' .. EncodeDEFString(spatialAssociation.SpatialID))
		else
			self.DrawingInstructions:Add('SpatialReference:' .. EncodeDEFString(spatialAssociation.SpatialID) .. ',false')
		end
	end

	--
	-- S-52 PresLib Ed 4.0.3 Part I_Clean.pdf, page 42
	-- LC � Showline (simple linestyle).
	--
	function featurePortrayal:SimpleLineStyle(lineType, width, colour)
		CheckSelf(self, featurePortrayal.Type)
		CheckType(lineType, 'string')
		CheckType(width, 'number')		-- S-52 PresLib Ed 4.0.3 Part I_Clean.pdf, page 42 i.e. width 2 == .64 mm
		CheckType(colour, 'string')

		if lineType == 'solid' then
			self.DrawingInstructions:Add('LineStyle:_simple_,,' .. width .. ',' .. colour)
		elseif lineType == 'dash' then
			self.DrawingInstructions:Add('Dash:0,3.6;' .. 'LineStyle:_simple_,5.4,' .. width .. ',' .. colour)
		elseif lineType == 'dot' then
			self.DrawingInstructions:Add('Dash:0,0.6;' .. 'LineStyle:_simple_,1.8,' .. width .. ',' .. colour)
		else
			error('Invalid lineType ' .. lineType)
		end

		self.DrawingInstructions:Add()
	end

	--
	-- Evaluates TextPlacement and featureName; returns the first name which matches the selected national language. If no match is found,
	-- returns the first entry marked as the default (nameUsage == 1). If no default is present, returns the first English name. Otherwise
	-- returns nil.
	function featurePortrayal:GetFeatureName(feature, contextParameters)
		CheckSelf(self, featurePortrayal.Type)
		CheckType(feature, 'Feature')
		CheckType(contextParameters, 'array:ContextParameter')

		self.GetFeatureNameCalled = true
		
		-- TextPlacement can override feature name
		local textAssociation = feature:GetFeatureAssociations('TextAssociation')
		if textAssociation and #textAssociation > 0 and textAssociation[1].text then
			return textAssociation[1].text
		end
		
		if not feature['!featureName'] or #feature.featureName == 0 or not feature.featureName[1].name then
			return nil
		end
		
		local englishSelected = not contextParameters.NationalLanguage or contextParameters.NationalLanguage == 'eng' or contextParameters.NationalLanguage == ''
		local defaultName			-- an entry with nameUsage == 1
		local englishName			-- the first English name
		local nationalName			-- the first entry which matched the selected national language
		for cnt, featureName in ipairs(feature.featureName) do
		
			-- ensure a name is present
			if featureName.name and featureName.name ~= '' then

				-- don't process if only intended for pick report
				if not featureName.nameUsage or featureName.nameUsage ~= 3 then
				
					local isEnglishName = not featureName.language or featureName.language == 'eng'
					local languageMatches = (featureName.language and featureName.language == contextParameters.NationalLanguage) or (englishSelected and isEnglishName)

					-- check for default values which are used if we can't otherwise find a match...
					if featureName.nameUsage then
						if featureName.nameUsage == 1 then
							-- only one entry is permitted to have nameUsage set to one
							defaultName = featureName.name
						elseif featureName.nameUsage == 2 then
							-- use the entry intended for chart display which matched the selected lanaguage
							if languageMatches then
								return featureName.name
							end
						end
					end

					if not englishName and isEnglishName then
						englishName = featureName.name
					end

					if not nationalName and languageMatches then
						nationalName = featureName.name
					end
					
				end
			end
			
		end
		
		return nationalName or defaultName or englishName
	end
	
	return featurePortrayal
end

function CreateDrawingInstructions()
	local drawingInstructions = { Type = 'array:DrawingInstruction' }

	function drawingInstructions:Add(instruction)
		self[#self + 1] = instruction
	end

	return drawingInstructions;
end

-- Updated per #61 - temporarily remove NationalLanguage context parameter
function GetInformationText(information, contextParameters)
	local defaultText

	for _, text in ipairs(information.information) do
		if text.text and text.text ~= '' and (text.language == nil or text.language == 'eng' or text.language == '') then
			return text.text
		end
	
		defaultText = defaultText or text.text
	end

	return defaultText
end

function GetFeatureName(feature, contextParameters)
	return feature.featurePortrayal:GetFeatureName(feature, contextParameters)
end

--
-- The caller should not assume any drawing instructions are emitted; the state
-- of the text style commands may or may not be altered after this call.
--
-- textStyleInstructions example: 'LocalOffset:0,0;FontColor:CHBLK'
function PortrayFeatureName(feature, featurePortrayal, contextParameters, textViewingGroup, textPriority, viewingGroup, priority, textStyleInstructions)
	local name = featurePortrayal:GetFeatureName(feature, contextParameters)
	if name then
		local textStyle = textStyleInstructions or 'FontColor:CHBLK'
		featurePortrayal:AddInstructions(textStyle)
		featurePortrayal:AddTextInstruction(EncodeString(name, '%s'), textViewingGroup, textPriority, viewingGroup, priority)
	end
end