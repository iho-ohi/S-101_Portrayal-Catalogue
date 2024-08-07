
-- Archipelagic sea lane axis main entry point.
function ArchipelagicSeaLaneAxis(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Curve then
		viewingGroup = 26260
		featurePortrayal:AddInstructions('ViewingGroup:26260;DrawingPriority:15;DisplayPlane:UnderRadar')
		featurePortrayal:SimpleLineStyle('dash',0.64,'CHMGF')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
