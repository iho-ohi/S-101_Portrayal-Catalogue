--
-- ISSUE PSWG #48, PC #111, 
-- ISSUE PSWG #48, PC #111, 9/12/22 symbol decision and name change 2022_SISTAT03.svg to SISTAT03.svg
--
-- Signal Station Traffic main entry point.
function SignalStationTraffic(feature, featurePortrayal, contextParameters)
	local viewingGroup

	-- NOTE: rearranged and not autogenerated for #48 
	viewingGroup = 28020
	if contextParameters.RadarOverlay then
		featurePortrayal:AddInstructions('ViewingGroup:28020;DrawingPriority:21;DisplayPlane:OverRadar')
	else
		featurePortrayal:AddInstructions('ViewingGroup:28020;DrawingPriority:21;DisplayPlane:UnderRadar')
	end


	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		featurePortrayal:AddInstructions('PointInstruction:SISTAT03') 
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- PSWG #48
		viewingGroup = 28020
		featurePortrayal:AddInstructions('ViewingGroup:28020;DrawingPriority:21;PointInstruction:SISTAT03')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
