-- VesselTrafficServiceArea portrayal rules file.
-- #93 task 1: Update to support surfaces instead of points

-- Main entry point for feature type.
function VesselTrafficServiceArea(feature, featurePortrayal, contextParameters)
	local viewingGroup = 25060
	if feature.PrimitiveType == PrimitiveType.Surface then
		featurePortrayal:AddInstructions('ViewingGroup:25060;DrawingPriority:18;DisplayPlane:UnderRADAR')
		featurePortrayal:SimpleLineStyle('dash',0.32,'TRFCD')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
		featurePortrayal:AddInstructions('PointInstruction:testPCB')
		if feature.featureName[1] and feature.featureName[1].name then
			featurePortrayal:AddInstructions('LocalOffset:3.51,3.51;FontSize:10')
			featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'Nr %s'), 21, 24, 25060, 18)
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
	return viewingGroup
end
