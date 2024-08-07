
-- Dam main entry point.
function Dam(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Curve then
		if feature.categoryOfDam == 3 then
			viewingGroup = 12410
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:18;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:18;DisplayPlane:UnderRadar')
			end
			featurePortrayal:SimpleLineStyle('solid',0.64,'CSTLN')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		else
			viewingGroup = 22010
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:22010;DrawingPriority:18;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:22010;DrawingPriority:18;DisplayPlane:UnderRadar')
			end
			featurePortrayal:SimpleLineStyle('solid',1.28,'LANDF')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PlainBoundaries then
		if feature.categoryOfDam == 3 then
			viewingGroup = 12410
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:18;DisplayPlane:UnderRadar')
			featurePortrayal:AddInstructions('ColorFill:CHBRN')
			featurePortrayal:SimpleLineStyle('solid',0.64,'CSTLN')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		else
			viewingGroup = 22010
			featurePortrayal:AddInstructions('ViewingGroup:22010;DrawingPriority:9;DisplayPlane:UnderRadar')
			featurePortrayal:AddInstructions('ColorFill:CHBRN')
			featurePortrayal:SimpleLineStyle('solid',0.32,'LANDF')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.categoryOfDam == 3 then
			viewingGroup = 12410
			featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:18;DisplayPlane:UnderRadar')
			featurePortrayal:AddInstructions('ColorFill:CHBRN')
			featurePortrayal:SimpleLineStyle('solid',0.64,'CSTLN')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		else
			viewingGroup = 22010
			featurePortrayal:AddInstructions('ViewingGroup:22010;DrawingPriority:9;DisplayPlane:UnderRadar')
			featurePortrayal:AddInstructions('ColorFill:CHBRN')
			featurePortrayal:SimpleLineStyle('solid',0.32,'LANDF')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
