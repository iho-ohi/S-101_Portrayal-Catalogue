-- #49
-- #89
-- #155

-- Referenced portrayal rules.
require 'WRECKS05'

-- Wreck main entry point.
function Wreck(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SimplifiedSymbols then
		if feature.categoryOfWreck and feature.categoryOfWreck == 3 and feature.valueOfSounding then
			viewingGroup = 34051
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:34051;DrawingPriority:12;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:34051;DrawingPriority:12;DisplayPlane:UnderRadar')
			end
			featurePortrayal:AddInstructions('PointInstruction:FOULGND1')
		elseif feature.categoryOfWreck and feature.categoryOfWreck == 3 then
			viewingGroup = 34050
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:12;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:12;DisplayPlane:UnderRadar')
			end
			featurePortrayal:AddInstructions('PointInstruction:FOULGND1')
		else
			viewingGroup = 34050
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:12;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:12;DisplayPlane:UnderRadar')
			end
			viewingGroup = WRECKS05(feature, featurePortrayal, contextParameters, viewingGroup)
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if feature.categoryOfWreck and feature.categoryOfWreck == 3 and feature.valueOfSounding then
			viewingGroup = 34051
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:34051;DrawingPriority:12;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:34051;DrawingPriority:12;DisplayPlane:UnderRadar')
			end
			featurePortrayal:AddInstructions('PointInstruction:FOULGND1')
		elseif feature.categoryOfWreck and feature.categoryOfWreck == 3 then
			viewingGroup = 34050
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:12;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:12;DisplayPlane:UnderRadar')
			end
			featurePortrayal:AddInstructions('PointInstruction:FOULGND1')
		else
			viewingGroup = 34050
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:12;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:12;DisplayPlane:UnderRadar')
			end
			viewingGroup = WRECKS05(feature, featurePortrayal, contextParameters, viewingGroup)
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PlainBoundaries then
		if feature.categoryOfWreck and feature.categoryOfWreck == 3 and feature.valueOfSounding then
			viewingGroup = 34051
			featurePortrayal:AddInstructions('ViewingGroup:34051;DrawingPriority:12;DisplayPlane:UnderRadar')
			featurePortrayal:SimpleLineStyle('dash',0.32,'CHBLK')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		elseif feature.categoryOfWreck and feature.categoryOfWreck == 3 then
			viewingGroup = 34050
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:12;DisplayPlane:UnderRadar')
			featurePortrayal:SimpleLineStyle('dash',0.32,'CHBLK')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		else
			viewingGroup = 34050
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:12;DisplayPlane:UnderRadar')
			viewingGroup = WRECKS05(feature, featurePortrayal, contextParameters, viewingGroup)
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.categoryOfWreck and feature.categoryOfWreck == 3 and feature.valueOfSounding then
			viewingGroup = 34051
			featurePortrayal:AddInstructions('ViewingGroup:34051;DrawingPriority:12;DisplayPlane:UnderRadar')
			featurePortrayal:AddInstructions('LineInstruction:NAVARE51')
		elseif feature.categoryOfWreck and feature.categoryOfWreck == 3 then
			viewingGroup = 34050
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:12;DisplayPlane:UnderRadar')
			featurePortrayal:AddInstructions('LineInstruction:NAVARE51')
		else
			viewingGroup = 34050
			featurePortrayal:AddInstructions('ViewingGroup:34050;DrawingPriority:12;DisplayPlane:UnderRadar')
			viewingGroup = WRECKS05(feature, featurePortrayal, contextParameters, viewingGroup)
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
