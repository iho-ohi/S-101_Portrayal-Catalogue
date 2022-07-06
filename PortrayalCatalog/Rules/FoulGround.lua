-- FoulGround portrayal rules file.
-- UNOFFICIAL:  Rules extracted from S-52 lookup table for OBSTRN where CATOBS = 7.
-- #72

-- Main entry point for feature type.
function FoulGround(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Point then
		if feature.valueOfSounding then
			viewingGroup = 34051
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:34051;DrawingPriority:12;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:34051;DrawingPriority:12;DisplayPlane:UnderRADAR')
			end
		else
			viewingGroup = 34050
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:12;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:12;DisplayPlane:UnderRADAR')
			end
		end
		featurePortrayal:AddInstructions('PointInstruction:FOULGD02')
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		error('Not Implemented: No curve symbology defined in S-52 for FoulGround')
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PlainBoundaries then
		if feature.valueOfSounding then
			viewingGroup = 34051
			featurePortrayal:AddInstructions('ViewingGroup:34051;DrawingPriority:12;DisplayPlane:UnderRADAR')
		else
			viewingGroup = 34050
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:12;DisplayPlane:UnderRADAR')
		end
		featurePortrayal:AddInstructions('PointInstruction:FOULGD02')
		featurePortrayal:SimpleLineStyle('dash',0.32,'CHGRD')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.valueOfSounding then
			viewingGroup = 34051
			featurePortrayal:AddInstructions('ViewingGroup:34051;DrawingPriority:12;DisplayPlane:UnderRADAR')
		else
			viewingGroup = 34050
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:12;DisplayPlane:UnderRADAR')
		end
		featurePortrayal:AddInstructions('PointInstruction:FOULGD02')
		featurePortrayal:AddInstructions('LineInstruction:NAVARE51')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
