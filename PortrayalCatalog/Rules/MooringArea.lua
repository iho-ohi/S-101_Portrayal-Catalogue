-- Referenced portrayal rules.
require 'RESTRN01'

	--
	-- #309
	-- #344 bug fix against #309
	--

function MooringArea(feature, featurePortrayal, contextParameters)

	local viewingGroup = 12410  -- categoryOfMooringArea = 1, 2, or Unknown
	local drawingPriority = 18
	local roStr1 = 'ViewingGroup:' .. viewingGroup ..';DrawingPriority:' .. drawingPriority ..';DisplayPlane:OverRADAR'
	local roStr2 = 'ViewingGroup:' .. viewingGroup ..';DrawingPriority:' .. drawingPriority ..';DisplayPlane:UnderRADAR'
	local hasName = false

	featurePortrayal:AddInstructions('AlertReference:ProhAre,53023,53023')

	local CAMA = feature.categoryOfMooringArea;

	-- adjust viewing group for mooring area for tankers, based on S-52
	if CAMA == 3 then
		viewingGroup = 32440
		drawingPriority = 18
		roStr1 = 'ViewingGroup:' .. viewingGroup ..';DrawingPriority:' .. drawingPriority ..';DisplayPlane:OverRADAR'
		roStr2 = 'ViewingGroup:' .. viewingGroup ..';DrawingPriority:' .. drawingPriority ..';DisplayPlane:UnderRADAR'
	end

	--
	-- #309, "Visitors" or "Tankers" string placement to add to text below symbol
	--
	local function AddVisitorTankerName()
		local xyPos
		local cstr = '' 

		--
		-- 2 : mooring area for visitors, 3 : mooring area for tankers
		--
		if CAMA == 2 then
			cstr = "Visitors"
		elseif CAMA == 3 then
			cstr = "Tankers"
		end
		
		if (CAMA == 2 or CAMA == 3) then
			if (hasName) then
				xyPos = '-3.51,-11.02'	-- place below name
			else
		 		xyPos = '-3.51,-5.02'	-- place tighter against symbol
			end
			 featurePortrayal:AddInstructions('LocalOffset:' .. xyPos .. ';FontSize:10;FontSlant:Italics;FontColor:CHMGD')
			 featurePortrayal:AddTextInstruction(cstr, 26, 24, viewingGroup, 18)
		end
	end	


	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions(roStr1)
		else
			featurePortrayal:AddInstructions(roStr2)
		end

		featurePortrayal:AddInstructions('PointInstruction:BOYMOR02')

		if feature.featureName[1] and feature.featureName[1].name then
			hasName = true
			featurePortrayal:AddInstructions('LocalOffset:-3.51,-7.02;FontSize:10;FontColor:CHBLK')
	    	featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters)), 26, 24, viewingGroup, 18)
		end

		AddVisitorTankerName()

	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PlainBoundaries then
		featurePortrayal:AddInstructions('ViewingGroup:' .. viewingGroup ..';DrawingPriority:9;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('PointInstruction:BOYMOR51')
		featurePortrayal:SimpleLineStyle('dash',0.64,'CHGRF')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')

		if feature.featureName[1] and feature.featureName[1].name then
			hasName = true
			featurePortrayal:AddInstructions('LocalOffset:-3.51,-9.02;FontSize:10;FontColor:CHBLK')
	    	featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters)), 26, 24, viewingGroup, 9)
		end

		AddVisitorTankerName()

		RESTRN01(feature, featurePortrayal, contextParameters, viewingGroup)
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		featurePortrayal:AddInstructions('ViewingGroup:' .. viewingGroup ..';DrawingPriority:9;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('PointInstruction:BOYMOR51')
		featurePortrayal:AddInstructions('LineInstruction:NAVARE52')

		if feature.featureName[1] and feature.featureName[1].name then
			hasName = true
			featurePortrayal:AddInstructions('LocalOffset:-3.51,-9.02;FontSize:10;FontColor:CHBLK')
	    	featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters)), 26, 24, viewingGroup, 9)
		end

		AddVisitorTankerName()

		RESTRN01(feature, featurePortrayal, contextParameters, viewingGroup)
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
	
	return viewingGroup
end
