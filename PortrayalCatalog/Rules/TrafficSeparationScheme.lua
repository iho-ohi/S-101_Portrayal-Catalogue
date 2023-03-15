-- Main entry point for feature type.

-- Issue #146, PSWG #86

function TrafficSeparationScheme(feature, featurePortrayal, contextParameters)
	
	--featurePortrayal:AddInstructions('ViewingGroup:21010;DrawingPriority:15;DisplayPlane:UnderRADAR;NullInstruction') -- TODO: Find aggregates and emit instructions.

	local viewingGroup = 25010

	local featureName = feature.featureName  -- DEBUG use: featureName = {} with next line  -- replace with: featureName = feature.featureName;
	-- MS Debug featureName[1] = {displayName = 'True', language = 'eng', name = 'Traffic Separation Scheme'}

	 if feature.PrimitiveType == PrimitiveType.Surface then
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('ViewingGroup:' .. viewingGroup .. ';DrawingPriority:18;DisplayPlane:OverRADAR')
		else
			featurePortrayal:AddInstructions('ViewingGroup:' .. viewingGroup .. ';DrawingPriority:18;DisplayPlane:UnderRADAR')
		end

		--if feature.featureName[1] and feature.featureName[1].name then
		if featureName[1] and featureName[1].name then
			featurePortrayal:AddInstructions('LocalOffset:0,0;TextAlignHorizontal:Center;TextAlignVertical:Center;FontSize:10')
			featurePortrayal:AddTextInstruction(EncodeString(GetFeatureNameNoGeometry(featureName, contextParameters), '%s'), 21, 24, viewingGroup, 24)
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
