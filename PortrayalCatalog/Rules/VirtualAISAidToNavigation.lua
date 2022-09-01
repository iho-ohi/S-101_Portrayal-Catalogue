-- VirtualAISAidToNavigation portrayal rules file.
-- #51 

-- Main entry point for feature type.
function VirtualAISAidToNavigation(feature, featurePortrayal, contextParameters)
	local viewingGroup = 21010
	
	if feature.PrimitiveType == PrimitiveType.Point
	then
		featurePortrayal:AddInstructions('AlertReference:NavHazard,115,115')
		if feature.virtualAISAidToNavigationType == nil or
		   feature.virtualAISAidToNavigationType < 1 or
		   feature.virtualAISAidToNavigationType > 12
		then
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('ViewingGroup:21010;DrawingPriority:15')
			featurePortrayal:AddInstructions('PointInstruction:VATON00')
		else
			featurePortrayal:AddInstructions('DisplayPlane:UnderRADAR;ViewingGroup:21010:DrawingPriority:18')
			if feature.virtualAISAidToNavigationType == 1
			then
				featurePortrayal:AddInstructions('PointInstruction:VATON01')
			elseif feature.virtualAISAidToNavigationType == 2
			then
				featurePortrayal:AddInstructions('PointInstruction:VATON02')
			elseif feature.virtualAISAidToNavigationType == 3
			then
				featurePortrayal:AddInstructions('PointInstruction:VATON03')
			elseif feature.virtualAISAidToNavigationType == 4
			then
				featurePortrayal:AddInstructions('PointInstruction:VATON04')
			elseif feature.virtualAISAidToNavigationType == 5
			then
				featurePortrayal:AddInstructions('PointInstruction:VATON05')
			elseif feature.virtualAISAidToNavigationType == 6
			then
				featurePortrayal:AddInstructions('PointInstruction:VATON06')
			elseif feature.virtualAISAidToNavigationType == 7
			then
				featurePortrayal:AddInstructions('PointInstruction:VATON07')
			elseif feature.virtualAISAidToNavigationType == 8
			then
				featurePortrayal:AddInstructions('PointInstruction:VATON08')
			elseif feature.virtualAISAidToNavigationType == 9
			then
				featurePortrayal:AddInstructions('PointInstruction:VATON09')
			elseif feature.virtualAISAidToNavigationType == 10
			then
				featurePortrayal:AddInstructions('PointInstruction:VATON10')
			elseif feature.virtualAISAidToNavigationType == 11
			then
				featurePortrayal:AddInstructions('PointInstruction:VATON11')
			elseif feature.virtualAISAidToNavigationType == 12
			then
				featurePortrayal:AddInstructions('PointInstruction:VATON12')
			end
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
	
	return viewingGroup
end
