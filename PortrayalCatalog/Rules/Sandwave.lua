
-- Sandwave main entry point.
function Sandwave(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		viewingGroup = 24010
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('ViewingGroup:24010;DrawingPriority:12;DisplayPlane:OverRadar')
		else
			featurePortrayal:AddInstructions('ViewingGroup:24010;DrawingPriority:12;DisplayPlane:UnderRadar')
		end
		featurePortrayal:AddInstructions('PointInstruction:SNDWAV02')
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		viewingGroup = 24010
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('ViewingGroup:24010;DrawingPriority:12;DisplayPlane:OverRadar')
		else
			featurePortrayal:AddInstructions('ViewingGroup:24010;DrawingPriority:12;DisplayPlane:UnderRadar')
		end
		featurePortrayal:SimpleLineStyle('dash',0.64,'CHGRD')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
		featurePortrayal:AddInstructions('PointInstruction:SNDWAV02')
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PlainBoundaries then
		viewingGroup = 24010
		featurePortrayal:AddInstructions('ViewingGroup:24010;DrawingPriority:12;DisplayPlane:UnderRadar')
		featurePortrayal:AddInstructions('AreaFillReference:SNDWAV01')
		featurePortrayal:SimpleLineStyle('dash',0.64,'CHGRD')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		viewingGroup = 24010
		featurePortrayal:AddInstructions('ViewingGroup:24010;DrawingPriority:12;DisplayPlane:UnderRadar')
		featurePortrayal:AddInstructions('AreaFillReference:SNDWAV01')
		featurePortrayal:AddInstructions('LineInstruction:NAVARE51')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
