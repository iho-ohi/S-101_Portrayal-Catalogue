-- ArchipelagicSeaLane main entry point.
--
-- Issue #152, PSWG #80
--
function ArchipelagicSeaLane(feature, featurePortrayal, contextParameters)
	
	local viewingGroup = 26260 

	--Debug.Break()
	local featureName = feature.featureName  -- DEBUG use: featureName = {} with next line  -- replace with: featureName = feature.featureName;
	-- MS Debug featureName[1] = {displayName = 'True', language = 'eng', name = 'Test Sea Lane'}

	 if feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization, text only
		featurePortrayal:AddInstructions('ViewingGroup:' .. viewingGroup ..';DrawingPriority:15;DisplayPlane:UnderRADAR')

		--if feature.featureName[1] and feature.featureName[1].name then
		if featureName[1] and featureName[1].name then
			featurePortrayal:AddInstructions('LocalOffset:0,0;TextAlignHorizontal:Center;TextAlignVertical:Center;FontSize:10')

			--Reference featurePortrayal:AddTextInstruction(text, textViewingGroup, textPriority, viewingGroup, priority)
			featurePortrayal:AddTextInstruction(EncodeString(GetFeatureNameNoGeometry(featureName, contextParameters), '%s'), 21, 24, viewingGroup, 15)
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
	return viewingGroup
end
