-- Converter Version: 1.0
-- Feature Catalogue Version: 1.1.0 (2023/2/2)

-- Buoy Cardinal main entry point.
function BuoyCardinal(feature, featurePortrayal, contextParameters)
	local viewingGroup

	featurePortrayal:AddInstructions('AlertReference:NavHazard,115,115;Hover:true')

	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SimplifiedSymbols then
		if feature.buoyShape == 4 and feature.colour[1] == 2 and feature.colour[2] == 6 then
			viewingGroup = 27010
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BOYPIL22')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'by %s'), 21, 24, 27010, 24)
			end
		elseif feature.buoyShape == 4 and feature.colour[1] == 2 and feature.colour[2] == 6 and feature.colour[3] == 2 then
			viewingGroup = 27010
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BOYPIL23')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'by %s'), 21, 24, 27010, 24)
			end
		elseif feature.buoyShape == 4 and feature.colour[1] == 6 and feature.colour[2] == 2 then
			viewingGroup = 27010
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BOYPIL24')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'by %s'), 21, 24, 27010, 24)
			end
		elseif feature.buoyShape == 4 and feature.colour[1] == 6 and feature.colour[2] == 2 and feature.colour[3] == 6 then
			viewingGroup = 27010
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BOYPIL25')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'by %s'), 21, 24, 27010, 24)
			end
		elseif feature.buoyShape == 5 and feature.colour[1] == 2 and feature.colour[2] == 6 then
			viewingGroup = 27010
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BOYSPR22')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'by %s'), 21, 24, 27010, 24)
			end
		elseif feature.buoyShape == 5 and feature.colour[1] == 2 and feature.colour[2] == 6 and feature.colour[3] == 2 then
			viewingGroup = 27010
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BOYSPR23')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'by %s'), 21, 24, 27010, 24)
			end
		elseif feature.buoyShape == 5 and feature.colour[1] == 6 and feature.colour[2] == 2 then
			viewingGroup = 27010
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BOYSPR24')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'by %s'), 21, 24, 27010, 24)
			end
		elseif feature.buoyShape == 5 and feature.colour[1] == 6 and feature.colour[2] == 2 and feature.colour[3] == 6 then
			viewingGroup = 27010
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BOYSPR25')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'by %s'), 21, 24, 27010, 24)
			end
		elseif feature.buoyShape == 1 then
			viewingGroup = 27010
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BOYCON01')
			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,3.51;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'by %s'), 21, 24, 27010, 24)
			end
		elseif feature.buoyShape == 2 then
			viewingGroup = 27010
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27010;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BOYCAN01')
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
