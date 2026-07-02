
-- Cable Submarine main entry point.
function CableSubmarine(feature, featurePortrayal, contextParameters)
	local viewingGroup
	local status = feature.status or feature.STATUS

	if feature.PrimitiveType == PrimitiveType.Curve then

		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('DisplayPlane:OverRadar')
		else
			featurePortrayal:AddInstructions('DisplayPlane:UnderRadar')
		end

		if contains(4, feature.status) then
			viewingGroup = 34070
			featurePortrayal:AddInstructions('ViewingGroup:34070;DrawingPriority:9')
			featurePortrayal:AddInstructions('LineInstruction:CBLSUB07') --changed to CBLSUB08
		elseif feature.categoryOfCable == 6 then
			viewingGroup = 24010
			featurePortrayal:AddInstructions('ViewingGroup:24010;DrawingPriority:18')
			--featurePortrayal:SimpleLineStyle('dash',0.32,'CHMGD')
			featurePortrayal:AddInstructions('LineInstruction:CBLSUB08') --changed to CBLSUB08
			--featurePortrayal:AddInstructions('LineInstruction:_simple_')
		elseif feature.categoryOfCable == 10 then  --value of 10 is general telecommunication lines (incorporates 4 and 5)
			viewingGroup = 34070
			featurePortrayal:AddInstructions('ViewingGroup:34070;DrawingPriority:9')
			featurePortrayal:AddInstructions('LineInstruction:CBLSUB07') -- changed to CBLSUB07
	
		else
			viewingGroup = 34070
			featurePortrayal:AddInstructions('ViewingGroup:34070;DrawingPriority:9')
			featurePortrayal:AddInstructions('LineInstruction:CBLSUB06')

		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
