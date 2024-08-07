-- #155

-- Retroreflector main entry point.
function Retroreflector(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SimplifiedSymbols then
		viewingGroup = 27080
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('ViewingGroup:27080;DrawingPriority:18;DisplayPlane:OverRadar')
		else
			featurePortrayal:AddInstructions('ViewingGroup:27080;DrawingPriority:18;DisplayPlane:UnderRadar')
		end
		featurePortrayal:AddInstructions('PointInstruction:RETRFL02')
	elseif feature.PrimitiveType == PrimitiveType.Point then
		viewingGroup = 27080
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('ViewingGroup:27080;DrawingPriority:18;DisplayPlane:OverRadar')
		else
			featurePortrayal:AddInstructions('ViewingGroup:27080;DrawingPriority:18;DisplayPlane:UnderRadar')
		end
		featurePortrayal:AddInstructions('PointInstruction:RETRFL01')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
