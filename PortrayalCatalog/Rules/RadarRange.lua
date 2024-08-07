
-- Radar range main entry point.
function RadarRange(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		viewingGroup = 25040
		featurePortrayal:AddInstructions('ViewingGroup:25040;DrawingPriority:9;DisplayPlane:UnderRadar')
		featurePortrayal:SimpleLineStyle('dash',0.32,'TRFCF')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
