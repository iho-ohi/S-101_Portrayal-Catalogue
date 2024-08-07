
-- Weed/Kelp main entry point.
function WeedKelp(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		viewingGroup = 34020
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('ViewingGroup:34020;DrawingPriority:9;DisplayPlane:OverRadar')
		else
			featurePortrayal:AddInstructions('ViewingGroup:34020;DrawingPriority:9;DisplayPlane:UnderRadar')
		end
		featurePortrayal:AddInstructions('PointInstruction:WEDKLP03')
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		viewingGroup = 34020
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('ViewingGroup:34020;DrawingPriority:9;DisplayPlane:OverRadar')
		else
			featurePortrayal:AddInstructions('ViewingGroup:34020;DrawingPriority:9;DisplayPlane:UnderRadar')
		end
		featurePortrayal:AddInstructions('PointInstruction:WEDKLP03')
		featurePortrayal:SimpleLineStyle('dash',0.32,'CHGRF')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
