require 'S100Scripting'
require 'PortrayalModel'
require 'PortrayalAPI'
require 'Default'

-- Main entry point for portrayal
function PortrayalMain(featureIDs)
	Debug.StartPerformance('Lua Code - Total')

	if not portrayalContext then
		error('Host must call PortrayalInitializeContextParameters() before calling portrayal_main()')
	end

	local contextParameters = portrayalContext.ContextParameters

	local featurePortrayalItems = portrayalContext.FeaturePortrayalItems

	-- For curves and surfaces, perform line symbology on self and adjacent features so that
	-- higher priority edges suppress lower priority edges.

	function ProcessFeaturePortrayalItem(featurePortrayalItem)

		local feature = featurePortrayalItem.Feature

		Debug.StartPerformance('Lua Code - Dataset processing')
		
		local featurePortrayal = featurePortrayalItem:NewFeaturePortrayal()

		contextParameters._observed = {}
		
		local status, err = pcall(function ()
			Debug.StartPerformance('Lua Code - Rules processing')

			local dateDependent = ProcessFixedAndPeriodicDates(feature, featurePortrayal)

			local scaleMinimum = feature['!scaleMinimum']
			local scaleMaximum = feature['!scaleMaximum']

			if scaleMinimum and not contextParameters.IgnoreScamin then
				featurePortrayal:AddInstructions('ScaleMinimum:' .. scaleMinimum)
			end

			if scaleMaximum then
				featurePortrayal:AddInstructions('ScaleMaximum:' .. scaleMaximum)
			end

			require(feature.Code)
			local viewingGroup = _G[feature.Code](feature, featurePortrayal, contextParameters)

			if not viewingGroup then
				error('Viewing group not returned for feature ' .. feature.ID)
			end

			if #featurePortrayal.DrawingInstructions == 0 then
				error('No drawing instructions were emitted for feature ' .. feature.ID)
			end

			-- Ensure featureName is processed for those features whose rules don't process it directly.
			if not featurePortrayal.GetFeatureNameCalled then
				PortrayFeatureName(feature, featurePortrayal, contextParameters, 32, 24, viewingGroup, nil, 'TextAlignHorizontal:Center;TextAlignVertical:Top;LocalOffset:0,-3.51;FontColor:CHBLK')
			end

			ProcessNauticalInformation(feature, featurePortrayal, contextParameters, viewingGroup)

			if dateDependent then
				AddDateDependentSymbol(feature, featurePortrayal, contextParameters, viewingGroup)
			end

			Debug.StopPerformance('Lua Code - Rules processing')
		end)

		if not status then
			Debug.Trace('Error: ' .. err .. '.  Default symbology for ' .. feature.Code .. ' ID=' .. feature.ID .. ' returned.')

			-- Clear any drawing instructions created up to this point.
			featurePortrayal = featurePortrayalItem:NewFeaturePortrayal()

			local dateDependent = ProcessFixedAndPeriodicDates(feature, featurePortrayal)
			local viewingGroup = Default(feature, featurePortrayal, contextParameters)
			ProcessNauticalInformation(feature, featurePortrayal, contextParameters, viewingGroup)
			if dateDependent then
				AddDateDependentSymbol(feature, featurePortrayal, contextParameters, viewingGroup)
			end
		end

		Debug.StopPerformance('Lua Code - Dataset processing')

		Debug.StartPerformance('Lua Code - HostPortrayalEmit preparation')

		featurePortrayalItem.ObservedContextParameters = contextParameters._observed
		featurePortrayalItem.InUseContextParameters = contextParameters._asTable

		local observed = ObservedContextParametersAsString(featurePortrayalItem)

		local drawingInstructions = table.concat(featurePortrayal.DrawingInstructions, ';')

		Debug.StopPerformance('Lua Code - HostPortrayalEmit preparation')

		return HostPortrayalEmit(featurePortrayal.FeatureReference, drawingInstructions, observed)
	end
	
	if featureIDs then
		for _,  featureID in ipairs(featureIDs) do
			local item = featurePortrayalItems[featureID]
			-- TextPlacement gets processed when the feature it's associated with is processed
			if item.Feature.Code ~= 'TextPlacement' then
				if not ProcessFeaturePortrayalItem(item) then
					return false
				end
			end
		end
	else
		for _,  featurePortrayalItem in ipairs(featurePortrayalItems) do
			-- TextPlacement gets processed when the feature it's associated with is processed
			if featurePortrayalItem.Feature.Code ~= 'TextPlacement' then
				if not ProcessFeaturePortrayalItem(featurePortrayalItem) then
					return false
				end
			end
		end
	end

	Debug.StopPerformance('Lua Code - Total')

	return true
end

-- Unknown value

local unknownValueMetatable =
{
	__eq = function (o1, o2)
		-- Never called when o1 and o2 are the same table.
		return false
	end,

	__lt = function (o1, o2)
		return false
	end,

	__le = function (o1, o2)
		return o1 == o2
	end
}

unknownValue = { Type = 'UnknownValue' }

setmetatable(unknownValue, unknownValueMetatable)

nilMarker = {}

scaminInfinite = 2147483647

sqParams = {'SpatialAssociation', 'theQualityInformation', 'SpatialQuality'}
