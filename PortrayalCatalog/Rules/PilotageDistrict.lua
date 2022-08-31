-- PilotageDistrict portrayal rules file.
--
-- ISSUES: PSWG #57, PC #94

-- Main entry point for feature type.
function PilotageDistrict(feature, featurePortrayal, contextParameters)
	local viewingGroup = 28010

	if feature.PrimitiveType == PrimitiveType.Surface then
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('ViewingGroup:28010;DrawingPriority:18;DisplayPlane:OverRADAR')
		else
			featurePortrayal:AddInstructions('ViewingGroup:28010;DrawingPriority:18;DisplayPlane:UnderRADAR')
		end
				
		featurePortrayal:AddInstructions('LineInstruction:PILDSTR1')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
