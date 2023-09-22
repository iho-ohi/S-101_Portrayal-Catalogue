-- Converter Version: 0.99
-- Feature Catalogue Version: 1.1.0 (2023/2/2)

-- Beacon Lateral main entry point.
function BeaconLateral(feature, featurePortrayal, contextParameters)
	local viewingGroup
	

	featurePortrayal:AddInstructions('AlertReference:NavHazard,115,115;Hover:true')


	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SimplifiedSymbols then
	--Debug.Break()
		if feature.beaconShape == 3 and feature.colour[1] == 3 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNTOW10')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'bn %s'), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 3 and feature.colour[1] == 4 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNTOW11')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'bn %s'), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 3 and feature.colour[1] == 3 and feature.colour[2] == 4 and feature.colour[3] == 3 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNTOW30')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'bn %s'), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 3 and feature.colour[1] == 4 and feature.colour[2] == 3 and feature.colour[3] == 4 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNTOW31')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'bn %s'), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 5 and feature.colour[1] == 3 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNGEN10')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'bn %s'), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 5 and feature.colour[1] == 4 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNGEN11')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'bn %s'), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 5 and feature.colour[1] == 3 and feature.colour[2] == 4 and feature.colour[3] == 3 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNGEN30')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'bn %s'), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 5 and feature.colour[1] == 4 and feature.colour[2] == 3 and feature.colour[3] == 4 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNGEN31')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'bn %s'), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 7 and feature.colour[1] == 3 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNGEN10')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'bn %s'), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 7 and feature.colour[1] == 4 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNGEN11')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'bn %s'), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 7 and feature.colour[1] == 3 and feature.colour[2] == 4 and feature.colour[3] == 3 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNGEN30')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'bn %s'), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 7 and feature.colour[1] == 4 and feature.colour[2] == 3 and feature.colour[3] == 4 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNGEN31')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'bn %s'), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 2 and feature.categoryOfLateralMark == 1 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:PRICKE03')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'bn %s'), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 2 and feature.categoryOfLateralMark == 2 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:PRICKE04')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'bn %s'), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 6 and feature.visualProminence == 1 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:CAIRNS11')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'bn %s'), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 1 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNSTK02')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'bn %s'), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 3 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNTOW01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,7.02;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'bn %s'), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 4 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNLTC01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,7.02;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'bn %s'), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 5 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNGEN01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,7.02;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'bn %s'), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 6 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:CAIRNS01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'bn %s'), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 7 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNGEN01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,7.02;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'bn %s'), 21, 24, 27020, 24)
			end
		else
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNGEN03')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'bn %s'), 21, 24, 27020, 24)
			end
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
