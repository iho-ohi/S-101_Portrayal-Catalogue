
-- Built-up area main entry point.
function BuiltUpArea(feature, featurePortrayal, contextParameters)
	local viewingGroup = 22240			-- Standard
	local InTheWater = false

	-- DEBUB 
	--Debug.Break()

	if feature.inTheWater == true then
		viewingGroup = 12410			--set to Base
		InTheWater = true
		featurePortrayal:AddInstructions('AlertReference:SafetyContour')	-- as per ShorelineConstruction
	end

	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		--viewingGroup = 22240
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('ViewingGroup:' .. viewingGroup .. ';DrawingPriority:9;DisplayPlane:OverRADAR')
		else
			featurePortrayal:AddInstructions('ViewingGroup:' .. viewingGroup .. ';DrawingPriority:9;DisplayPlane:UnderRADAR')
		end
		featurePortrayal:AddInstructions('PointInstruction:BUAARE02')
		if feature.featureName[1] and feature.featureName[1].name then
			featurePortrayal:AddInstructions('LocalOffset:3.51,0;TextAlignVertical:Center;FontSize:10;FontColor:CHBLK')
			featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters)), 26, 24, 22240, 9)
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		--viewingGroup = 22240
		featurePortrayal:AddInstructions('ViewingGroup:' .. viewingGroup .. ';DrawingPriority:9;DisplayPlane:UnderRADAR')
		
		if InTheWater == false then
			featurePortrayal:AddInstructions('ColorFill:CHBRN')
			featurePortrayal:SimpleLineStyle('solid',0.32,'LANDF')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
			
		else
			featurePortrayal:AddInstructions('ColorFill:CHGRF,0.5')
			local spatialQuality = feature:GetSpatialAssociation():GetInformationAssociation(unpack(sqParams))
			local qualityOfPosition = spatialQuality and spatialQuality.qualityOfHorizontalMeasurement

			Debug.Break() -- debug
			local spatialA = feature:GetSpatialAssociation()

			featurePortrayal:AddInstructions('LineInstruction:LOWACC21')

			--if qualityOfPosition and qualityOfPosition ~=1 and qualityOfPosition ~= 10 and qualityOfPosition ~= 11 then
			--	featurePortrayal:AddInstructions('LineInstruction:LOWACC21')
			--end
		end
		if feature.featureName[1] and feature.featureName[1].name then
			featurePortrayal:AddInstructions('LocalOffset:0,0;TextAlignHorizontal:Center;TextAlignVertical:Center;FontSize:10;FontColor:CHBLK')
			featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters)), 26, 24, 22240, 9)
		end

	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
