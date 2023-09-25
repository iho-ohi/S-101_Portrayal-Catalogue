-- Converter Version: 1.0
-- Feature Catalogue Version: 1.1.0 (2023/2/2)

-- Buoy Safe Water main entry point.
function BuoySafeWater(feature, featurePortrayal, contextParameters)
	local viewingGroup

	featurePortrayal:AddInstructions('AlertReference:NavHazard,115,115;Hover:true')

	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SimplifiedSymbols then
		if feature.buoyShape == 3 and feature.colour[1] == 1 and feature.colour[2] == 3 then
			viewingGroup = 27010
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BOYSPH50')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'by %s'), 21, 24, 27010, 24)
			end
		elseif feature.buoyShape == 3 and feature.colour[1] == 3 and feature.colour[2] == 1 then
			viewingGroup = 27010
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BOYSPH50')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'by %s'), 21, 24, 27010, 24)
			end
		elseif feature.buoyShape == 4 and feature.colour[1] == 1 and feature.colour[2] == 3 then
			viewingGroup = 27010
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BOYPIL50')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'by %s'), 21, 24, 27010, 24)
			end
		elseif feature.buoyShape == 4 and feature.colour[1] == 3 and feature.colour[2] == 1 then
			viewingGroup = 27010
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BOYPIL50')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'by %s'), 21, 24, 27010, 24)
			end
		elseif feature.buoyShape == 5 and feature.colour[1] == 1 and feature.colour[2] == 3 then
			viewingGroup = 27010
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BOYSPR50')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'by %s'), 21, 24, 27010, 24)
			end
		elseif feature.buoyShape == 5 and feature.colour[1] == 3 and feature.colour[2] == 1 then
			viewingGroup = 27010
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BOYSPR50')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'by %s'), 21, 24, 27010, 24)
			end
		elseif feature.buoyShape == 3 then
			viewingGroup = 27010
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BOYSPH01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'by %s'), 21, 24, 27010, 24)
			end
		elseif feature.buoyShape == 4 then
			viewingGroup = 27010
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BOYPIL01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'by %s'), 21, 24, 27010, 24)
			end
		elseif feature.buoyShape == 5 then
			viewingGroup = 27010
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BOYSPR01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'by %s'), 21, 24, 27010, 24)
			end
		elseif feature.buoyShape == 6 then
			viewingGroup = 27010
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BOYBAR01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'by %s'), 21, 24, 27010, 24)
			end
		elseif feature.buoyShape == 7 then
			viewingGroup = 27010
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BOYSUP01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-7.02,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'by %s'), 21, 24, 27010, 24)
			end
		elseif feature.buoyShape == 8 then
			viewingGroup = 27010
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BOYSPR01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'by %s'), 21, 24, 27010, 24)
			end
		else
			viewingGroup = 27010
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BOYGEN03')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'by %s'), 21, 24, 27010, 24)
			end
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
