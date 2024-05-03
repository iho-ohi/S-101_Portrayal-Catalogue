function StructureOverNavigableWater(feature, featurePortrayal, contextParameters)
	featurePortrayal:AddInstructions('AlertReference:NavHazard')

	if feature.PrimitiveType == PrimitiveType.Surface then
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:OverRADAR')
		else
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:UnderRADAR')
		end
		featurePortrayal:AddInstructions('ColorFill:CHGRF,0.5')
		featurePortrayal:SimpleLineStyle('solid',0.32,'CHBLK')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')

		--if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
			--featurePortrayal:AddInstructions('LocalOffset:3.51,-3.51;FontColor:CHBLK')
			--featurePortrayal:AddTextInstruction(EncodeString(feature.verticalClearanceFixed.verticalClearanceValue, 'clr %4.1f'), 11, 24, 12210, 24)
		--end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return 12210
end
