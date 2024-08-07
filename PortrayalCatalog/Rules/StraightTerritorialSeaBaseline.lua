
-- Straight territorial sea baseline main entry point.
function StraightTerritorialSeaBaseline(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Curve then
		viewingGroup = 36050
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('ViewingGroup:36050;DrawingPriority:9;DisplayPlane:OverRadar')
		else
			featurePortrayal:AddInstructions('ViewingGroup:36050;DrawingPriority:9;DisplayPlane:UnderRadar')
		end
		featurePortrayal:SimpleLineStyle('dash',0.32,'CHGRF')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
