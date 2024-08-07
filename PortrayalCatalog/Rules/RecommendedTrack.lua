-- Manual update for FC 1.0.1 (categoryOfRecomendedTrack -> basedOnFixedMarks) (2022/4/25)

-- Recommended track main entry point.
function RecommendedTrack(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Curve then
		if feature.basedOnFixedMarks and feature.trafficFlow == 1 then
			viewingGroup = 25020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:18;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:18;DisplayPlane:UnderRadar')
			end
			featurePortrayal:AddInstructions('LineInstruction:RECTRC12')
			featurePortrayal:AddInstructions('LocalOffset:0,3.51;TextAlignHorizontal:Center;FontSize:10;FontColor:CHBLK')
			featurePortrayal:AddTextInstruction(EncodeString(feature.orientationValue, '%03.0f deg'), 11, 24, 25020, 18)
		elseif feature.basedOnFixedMarks and feature.trafficFlow == 2 then
			viewingGroup = 25020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:18;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:18;DisplayPlane:UnderRadar')
			end
			featurePortrayal:AddInstructions('LineInstruction:RECTRC12')
			featurePortrayal:AddInstructions('LocalOffset:0,3.51;TextAlignHorizontal:Center;FontSize:10;FontColor:CHBLK')
			featurePortrayal:AddTextInstruction(EncodeString(feature.orientationValue, '%03.0f deg'), 11, 24, 25020, 18)
		elseif feature.basedOnFixedMarks and feature.trafficFlow == 3 then
			viewingGroup = 25020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:18;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:18;DisplayPlane:UnderRadar')
			end
			featurePortrayal:AddInstructions('LineInstruction:RECTRC12')
			featurePortrayal:AddInstructions('LocalOffset:0,3.51;TextAlignHorizontal:Center;FontSize:10;FontColor:CHBLK')
			featurePortrayal:AddTextInstruction(EncodeString(feature.orientationValue, '%03.0f deg'), 11, 24, 25020, 18)
		elseif feature.basedOnFixedMarks and feature.trafficFlow == 4 then
			viewingGroup = 25020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:18;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:18;DisplayPlane:UnderRadar')
			end
			featurePortrayal:AddInstructions('LineInstruction:RECTRC10')
			featurePortrayal:AddInstructions('LocalOffset:0,3.51;TextAlignHorizontal:Center;FontSize:10;FontColor:CHBLK')
			featurePortrayal:AddTextInstruction(EncodeString(feature.orientationValue, '%03.0f deg'), 11, 24, 25020, 18)
		elseif not feature.basedOnFixedMarks and feature.trafficFlow == 1 then
			viewingGroup = 25020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:18;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:18;DisplayPlane:UnderRadar')
			end
			featurePortrayal:AddInstructions('LineInstruction:RECTRC11')
			featurePortrayal:AddInstructions('LocalOffset:0,3.51;TextAlignHorizontal:Center;FontSize:10;FontColor:CHBLK')
			featurePortrayal:AddTextInstruction(EncodeString(feature.orientationValue, '%03.0f deg'), 11, 24, 25020, 18)
		elseif not feature.basedOnFixedMarks and feature.trafficFlow == 2 then
			viewingGroup = 25020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:18;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:18;DisplayPlane:UnderRadar')
			end
			featurePortrayal:AddInstructions('LineInstruction:RECTRC11')
			featurePortrayal:AddInstructions('LocalOffset:0,3.51;TextAlignHorizontal:Center;FontSize:10;FontColor:CHBLK')
			featurePortrayal:AddTextInstruction(EncodeString(feature.orientationValue, '%03.0f deg'), 11, 24, 25020, 18)
		elseif not feature.basedOnFixedMarks and feature.trafficFlow == 3 then
			viewingGroup = 25020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:18;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:18;DisplayPlane:UnderRadar')
			end
			featurePortrayal:AddInstructions('LineInstruction:RECTRC11')
			featurePortrayal:AddInstructions('LocalOffset:0,3.51;TextAlignHorizontal:Center;FontSize:10;FontColor:CHBLK')
			featurePortrayal:AddTextInstruction(EncodeString(feature.orientationValue, '%03.0f deg'), 11, 24, 25020, 18)
		elseif not feature.basedOnFixedMarks and feature.trafficFlow == 4 then
			viewingGroup = 25020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:18;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:18;DisplayPlane:UnderRadar')
			end
			featurePortrayal:AddInstructions('LineInstruction:RECTRC09')
			featurePortrayal:AddInstructions('LocalOffset:0,3.51;TextAlignHorizontal:Center;FontSize:10;FontColor:CHBLK')
			featurePortrayal:AddTextInstruction(EncodeString(feature.orientationValue, '%03.0f deg'), 11, 24, 25020, 18)
		elseif feature.trafficFlow == 1 then
			viewingGroup = 25020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:18;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:18;DisplayPlane:UnderRadar')
			end
			featurePortrayal:AddInstructions('LineInstruction:RECTRC11')
			featurePortrayal:AddInstructions('LocalOffset:0,3.51;TextAlignHorizontal:Center;FontSize:10;FontColor:CHBLK')
			featurePortrayal:AddTextInstruction(EncodeString(feature.orientationValue, '%03.0f deg'), 11, 24, 25020, 18)
		elseif feature.trafficFlow == 2 then
			viewingGroup = 25020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:18;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:18;DisplayPlane:UnderRadar')
			end
			featurePortrayal:AddInstructions('LineInstruction:RECTRC11')
			featurePortrayal:AddInstructions('LocalOffset:0,3.51;TextAlignHorizontal:Center;FontSize:10;FontColor:CHBLK')
			featurePortrayal:AddTextInstruction(EncodeString(feature.orientationValue, '%03.0f deg'), 11, 24, 25020, 18)
		elseif feature.trafficFlow == 3 then
			viewingGroup = 25020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:18;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:18;DisplayPlane:UnderRadar')
			end
			featurePortrayal:AddInstructions('LineInstruction:RECTRC11')
			featurePortrayal:AddInstructions('LocalOffset:0,3.51;TextAlignHorizontal:Center;FontSize:10;FontColor:CHBLK')
			featurePortrayal:AddTextInstruction(EncodeString(feature.orientationValue, '%03.0f deg'), 11, 24, 25020, 18)
		elseif feature.trafficFlow == 4 then
			viewingGroup = 25020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:18;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:18;DisplayPlane:UnderRadar')
			end
			featurePortrayal:AddInstructions('LineInstruction:RECTRC09')
			featurePortrayal:AddInstructions('LocalOffset:0,3.51;TextAlignHorizontal:Center;FontSize:10;FontColor:CHBLK')
			featurePortrayal:AddTextInstruction(EncodeString(feature.orientationValue, '%03.0f deg'), 11, 24, 25020, 18)
		else
			viewingGroup = 25020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:18;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:25020;DrawingPriority:18;DisplayPlane:UnderRadar')
			end
			featurePortrayal:AddInstructions('LineInstruction:RECDEF02')
			featurePortrayal:AddInstructions('LocalOffset:0,3.51;TextAlignHorizontal:Center;FontSize:10;FontColor:CHBLK')
			featurePortrayal:AddTextInstruction(EncodeString(feature.orientationValue, '%03.0f deg'), 11, 24, 25020, 18)
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
