-- Converter Version: 0.99
-- Feature Catalogue Version: 1.0.0 (2019/4/9)
--
-- ISSUES: PSWG #49, PC #112

-- Signal Station Warning main entry point.
function SignalStationWarning(feature, featurePortrayal, contextParameters)
	local viewingGroup

	-- NOTE: rearranged and not autogenerated 

	viewingGroup = 28020
	if contextParameters.RadarOverlay then
		featurePortrayal:AddInstructions('ViewingGroup:28020;DrawingPriority:21;DisplayPlane:OverRADAR')
	else
		featurePortrayal:AddInstructions('ViewingGroup:28020;DrawingPriority:21;DisplayPlane:UnderRADAR')
	end

	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('PointInstruction:2021_SISTAT03_01')
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- PSWG #48
		viewingGroup = 28020
		featurePortrayal:AddInstructions('ViewingGroup:28020;DrawingPriority:21;PointInstruction:2021_SISTAT03_01')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
