
-- Referenced portrayal rules.
require 'DEPCNT03'

-- Depth contour main entry point.
function DepthDiscontinuity(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Curve then
		viewingGroup = 33020
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('ViewingGroup:33020;DrawingPriority:15;DisplayPlane:OverRadar')
		else
			featurePortrayal:AddInstructions('ViewingGroup:33020;DrawingPriority:15;DisplayPlane:UnderRadar')
		end
        featurePortrayal:SimpleLineStyle('solid', 0.64, 'CHGRD')
        featurePortrayal:AddInstructions('LineInstruction:_simple_')

	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
