-- Information area main entry point.
-- #110

function InformationArea(feature, featurePortrayal, contextParameters)
	featurePortrayal:AddInstructions('ViewingGroup:26200;DrawingPriority:12;DisplayPlane:UnderRADAR')
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('PointInstruction:INFARE01')
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		featurePortrayal:AddInstructions('LineInstruction:INFARE51')
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		featurePortrayal:AddInstructions('PointInstruction:INFARE01')
		featurePortrayal:AddInstructions('LineInstruction:INFARE51')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return 26200
end
