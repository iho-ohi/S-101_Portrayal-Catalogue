
-- Tideway main entry point.
function Tideway(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Curve then
		viewingGroup = 32070
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('ViewingGroup:32070;DrawingPriority:9;DisplayPlane:OverRadar')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32070;DrawingPriority:9;DisplayPlane:UnderRadar')
		end
		featurePortrayal:SimpleLineStyle('solid',0.32,'CHGRF')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		viewingGroup = 32070
		featurePortrayal:AddInstructions('ViewingGroup:32070;DrawingPriority:21;DisplayPlane:UnderRadar')
		featurePortrayal:SimpleLineStyle('dash',0.32,'CHGRF')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
		if feature.featureName[1] and feature.featureName[1].name then
			featurePortrayal:AddInstructions('LocalOffset:0,0;TextAlignHorizontal:Center;TextAlignVertical:Center;FontSize:10;FontColor:CHBLK')
			featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters)), 25, 24, 32070, 21)
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
