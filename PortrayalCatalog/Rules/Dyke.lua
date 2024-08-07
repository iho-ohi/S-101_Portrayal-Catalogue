
-- Dyke main entry point.
function Dyke(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Curve then
		if feature.radarConspicuous then
			viewingGroup = 22210
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:22210;DrawingPriority:12;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:22210;DrawingPriority:12;DisplayPlane:UnderRadar')
			end
			featurePortrayal:SimpleLineStyle('solid',0.64,'CHBLK')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		else
			viewingGroup = 22010
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:22010;DrawingPriority:12;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:22010;DrawingPriority:12;DisplayPlane:UnderRadar')
			end
			featurePortrayal:SimpleLineStyle('solid',0.96,'LANDF')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		viewingGroup = 22010
		featurePortrayal:AddInstructions('ViewingGroup:22010;DrawingPriority:9;DisplayPlane:UnderRadar')
		featurePortrayal:AddInstructions('ColorFill:CHBRN')
		featurePortrayal:SimpleLineStyle('solid',0.32,'LANDF')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
