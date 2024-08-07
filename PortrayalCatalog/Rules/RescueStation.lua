-- #194
-- #235

-- Rescue station main entry point.
function RescueStation(feature, featurePortrayal, contextParameters)
	local viewingGroup = 38030

	if contextParameters.RadarOverlay then
		featurePortrayal:AddInstructions('ViewingGroup:38030;DrawingPriority:21;DisplayPlane:OverRadar')
	else
		featurePortrayal:AddInstructions('ViewingGroup:38030;DrawingPriority:21;DisplayPlane:UnderRadar')
	end

	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('PointInstruction:RSCSTA02')
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		--PC #235 Implement per CoastGuardStation but using RSCSTA02
		featurePortrayal:AddInstructions('PointInstruction:RSCSTA02')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
