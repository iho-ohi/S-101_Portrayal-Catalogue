-- FairwaySystem main entry point.

-- Issue #150, PSWG #82

function FairwaySystem(feature, featurePortrayal, contextParameters)
	-- TODO: Feature has no geometry and is an aggregation of other features.
	--       Determine if aggregated features need special handling beyond their standard portrayal.

	--featurePortrayal:AddInstructions('ViewingGroup:26050;DrawingPriority:12;DisplayPlane:UnderRADAR;NullInstruction')

	local viewingGroup = 26050

	local featureName = {}  -- replace with: featureName = feature.featureName;
	-- MS Debug featureName[1] = {displayName = 'True', language = 'eng', name = 'Fairway System'}

	 if feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization, text only
		featurePortrayal:AddInstructions('ViewingGroup:' .. viewingGroup ..';DrawingPriority:15;DisplayPlane:UnderRADAR')

		--if feature.featureName[1] and feature.featureName[1].name then
		if featureName[1] and featureName[1].name then
			featurePortrayal:AddInstructions('LocalOffset:0,0;TextAlignHorizontal:Center;TextAlignVertical:Center;FontSize:10')
			featurePortrayal:AddTextInstruction(EncodeString(GetFeatureNameNoGeometry(featureName, contextParameters), '%s'), 26, 24, viewingGroup, 12)
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
