-- MooringTrot main entry point.

-- Issue #148, PSWG #84
-- #61

function MooringTrot(feature, featurePortrayal, contextParameters)
	
	--featurePortrayal:AddInstructions('ViewingGroup:21010;DrawingPriority:15;DisplayPlane:UnderRADAR;NullInstruction') 

	local viewingGroup = 24010

	local featureName = feature.featureName  -- DEBUG use: featureName = {} with next line  -- replace with: featureName = feature.featureName;
	-- MS Debug featureName[1] = {displayName = 'True', language = 'eng', name = 'Mooring Trot'}

	 if feature.PrimitiveType == PrimitiveType.Surface then
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('ViewingGroup:' .. viewingGroup .. ';DrawingPriority:24;DisplayPlane:OverRADAR')
		else
			featurePortrayal:AddInstructions('ViewingGroup:' .. viewingGroup .. ';DrawingPriority:24;DisplayPlane:UnderRADAR')
		end

		--if feature.featureName[1] and feature.featureName[1].name then
		if featureName[1] and featureName[1].name then
			featurePortrayal:AddInstructions('LocalOffset:0,0;TextAlignHorizontal:Center;TextAlignVertical:Center;FontSize:10')
			featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), '%s'), 21, 24, viewingGroup, 24)
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
