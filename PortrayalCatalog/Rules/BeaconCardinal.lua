-- Converter Version: 0.99
-- Feature Catalogue Version: 1.1.0 (2023/2/2)

-- Beacon Cardinal main entry point.
function BeaconCardinal(feature, featurePortrayal, contextParameters)
	local viewingGroup

	featurePortrayal:AddInstructions('AlertReference:NavHazard,115,115;Hover:true')

	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SimplifiedSymbols then
		if feature.beaconShape == 3 and feature.colour[1] == 2 and feature.colour[2] == 6 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNTOW22')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters)), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 3 and feature.colour[1] == 2 and feature.colour[2] == 6 and feature.colour[3] == 2 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNTOW23')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters)), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 3 and feature.colour[1] == 6 and feature.colour[2] == 2 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNTOW24')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters)), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 3 and feature.colour[1] == 6 and feature.colour[2] == 2 and feature.colour[3] == 6 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNTOW25')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters)), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 5 and feature.colour[1] == 2 and feature.colour[2] == 6 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNGEN22')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters)), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 5 and feature.colour[1] == 2 and feature.colour[2] == 6 and feature.colour[3] == 2 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNGEN23')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters)), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 5 and feature.colour[1] == 6 and feature.colour[2] == 2 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNGEN24')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters)), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 5 and feature.colour[1] == 6 and feature.colour[2] == 2 and feature.colour[3] == 6 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNGEN25')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters)), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 7 and feature.colour[1] == 2 and feature.colour[2] == 6 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNGEN22')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters)), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 7 and feature.colour[1] == 2 and feature.colour[2] == 6 and feature.colour[3] == 2 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNGEN23')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters)), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 7 and feature.colour[1] == 6 and feature.colour[2] == 2 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNGEN24')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters)), 21, 24, 27020, 24)
			end
		elseif feature.beaconShape == 7 and feature.colour[1] == 6 and feature.colour[2] == 2 and feature.colour[3] == 6 then
			viewingGroup = 27020
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27020;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BCNGEN25')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters)), 21, 24, 27020, 24)
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
