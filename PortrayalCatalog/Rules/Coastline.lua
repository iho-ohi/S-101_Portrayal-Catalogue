
-- Referenced portrayal rules.
require 'QUAPOS01'

-- Coastline main entry point.
function Coastline(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Curve then
		if feature.categoryOfCoastline == 6 then
			viewingGroup = 12410
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:21;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:21;DisplayPlane:UnderRadar')
			end
			featurePortrayal:SimpleLineStyle('dash',0.32,'CSTLN')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		elseif feature.categoryOfCoastline == 7 then
			viewingGroup = 12410
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:21;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:21;DisplayPlane:UnderRadar')
			end
			featurePortrayal:SimpleLineStyle('dash',0.32,'CSTLN')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		elseif feature.categoryOfCoastline == 8 then
			viewingGroup = 12410
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:21;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:21;DisplayPlane:UnderRadar')
			end
			featurePortrayal:SimpleLineStyle('dash',0.32,'CSTLN')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		elseif feature.categoryOfCoastline == 10 then
			viewingGroup = 12410
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:21;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:21;DisplayPlane:UnderRadar')
			end
			featurePortrayal:SimpleLineStyle('dash',0.32,'CSTLN')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		else
			viewingGroup = 12410
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:21;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:21;DisplayPlane:UnderRadar')
			end
			QUAPOS01(feature, featurePortrayal, contextParameters, viewingGroup)
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
