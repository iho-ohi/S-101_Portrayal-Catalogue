-- Main entry point for feature type.

-- Issue #151, PSWG #81

function DeepWaterRoute(feature, featurePortrayal, contextParameters)

	local viewingGroup = 25010

	local featureName = {}  -- replace with: featureName = feature.featureName;
	featureName[1] = {displayName = 'True', language = 'eng', name = 'Deep Water Route'}

	 if feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization, text only
		featurePortrayal:AddInstructions('ViewingGroup:' .. viewingGroup ..';DrawingPriority:15;DisplayPlane:UnderRADAR')

		--if feature.featureName[1] and feature.featureName[1].name then
		if featureName[1] and featureName[1].name then
			featurePortrayal:AddInstructions('LocalOffset:0,0;TextAlignHorizontal:Center;TextAlignVertical:Center;FontSize:10')
			featurePortrayal:AddTextInstruction(EncodeString(GetFeatureNameNoGeometry(featureName, contextParameters), '%s'), 21, 24, viewingGroup, 12)
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
	return viewingGroup
end
