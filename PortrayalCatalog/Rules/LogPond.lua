
-- Log pond main entry point.
function LogPond(feature, featurePortrayal, contextParameters)
	local viewingGroup

	featurePortrayal:AddInstructions('AlertReference:NavHazard')

	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		viewingGroup = 34050
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:12;DisplayPlane:OverRadar')
		else
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:12;DisplayPlane:UnderRadar')
		end
		featurePortrayal:AddInstructions('PointInstruction:FLTHAZ02')
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		viewingGroup = 12410
		featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:15;DisplayPlane:UnderRadar')
		featurePortrayal:AddInstructions('PointInstruction:FLTHAZ02')
		featurePortrayal:SimpleLineStyle('dash',0.32,'CHBLK')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
