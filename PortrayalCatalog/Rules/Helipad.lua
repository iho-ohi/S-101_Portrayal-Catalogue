-- Converter Version: 0.99
-- Feature Catalogue Version: 1.0.0 (2019/4/9)
-- #134

-- Airport/airfield main entry point.
function AirportAirfield(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		viewingGroup = 32240
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('ViewingGroup:32240;DrawingPriority:12;DisplayPlane:OverRADAR')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32240;DrawingPriority:12;DisplayPlane:UnderRADAR')
		end
	    featurePortrayal:AddInstructions('PointInstruction:HELIPD02')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
