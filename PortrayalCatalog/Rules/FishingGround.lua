
-- Fishing ground main entry point.
function FishingGround(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		viewingGroup = 26210
		featurePortrayal:AddInstructions('ViewingGroup:26210;DrawingPriority:9;DisplayPlane:UnderRadar')
		featurePortrayal:AddInstructions('PointInstruction:FSHGRD01')
		featurePortrayal:SimpleLineStyle('dash',0.64,'CHGRF')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
