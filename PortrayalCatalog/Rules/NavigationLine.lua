
-- Navigation line main entry point.
function NavigationLine(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Curve then
		if feature.categoryOfNavigationLine == 1 then
			viewingGroup = 25010
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:12;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:12;DisplayPlane:UnderRadar')
			end
			featurePortrayal:SimpleLineStyle('dash',0.32,'CHGRD')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
			featurePortrayal:AddInstructions('LocalOffset:0,3.51;TextAlignHorizontal:Center;FontSize:10;FontColor:CHBLK')
			featurePortrayal:AddTextInstruction(EncodeString(feature.orientation.orientationValue, '%03.0f deg'), 11, 24, 25010, 12)
		elseif feature.categoryOfNavigationLine == 2 then
			viewingGroup = 25010
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:12;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:12;DisplayPlane:UnderRadar')
			end
			featurePortrayal:SimpleLineStyle('dash',0.32,'CHGRD')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
			featurePortrayal:AddInstructions('LocalOffset:0,3.51;TextAlignHorizontal:Center;FontSize:10;FontColor:CHBLK')
			featurePortrayal:AddTextInstruction(EncodeString(feature.orientation.orientationValue, '%03.0f deg'), 11, 24, 25010, 12)
		else
			viewingGroup = 25010
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:12;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:25010;DrawingPriority:12;DisplayPlane:UnderRadar')
			end
			featurePortrayal:SimpleLineStyle('dash',0.32,'CHGRD')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
