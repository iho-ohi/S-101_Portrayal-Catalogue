-- from S-57 BRIDGE, CATBRG=2 (opening bridge)
function SpanOpening(feature, featurePortrayal, contextParameters)
	featurePortrayal:AddInstructions('AlertReference:NavHazard')

	if feature.PrimitiveType == PrimitiveType.Curve then
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:OverRADAR')
		else
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:UnderRADAR')
		end
		featurePortrayal:SimpleLineStyle('solid',1.6,'CHGRD')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
		featurePortrayal:AddInstructions('PointInstruction:BRIDGE01')

		if feature.verticalClearanceClosed and feature.verticalClearanceClosed.verticalClearanceValue then
			featurePortrayal:AddInstructions('LocalOffset:3.51,0;FontColor:CHBLK')
			featurePortrayal:AddTextInstruction(EncodeString(feature.verticalClearanceClosed.verticalClearanceValue, 'clr cl %4.1f'), 11, 24, 12210, 24)
		end

		if feature.verticalClearanceOpen and feature.verticalClearanceOpen.verticalClearanceValue then
			featurePortrayal:AddInstructions('LocalOffset:3.51,-3.51;FontColor:CHBLK')
			featurePortrayal:AddTextInstruction(EncodeString(feature.verticalClearanceOpen.verticalClearanceValue, 'clr op %4.1f'), 11, 24, 12210, 24)
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:OverRADAR')
		else
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:UnderRADAR')
		end
		featurePortrayal:AddInstructions('PointInstruction:BRIDGE01')
		featurePortrayal:SimpleLineStyle('solid',1.28,'CHGRD')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')

		if feature.verticalClearanceClosed and feature.verticalClearanceClosed.verticalClearanceValue then
			featurePortrayal:AddInstructions('LocalOffset:3.51,0;FontColor:CHBLK')
			featurePortrayal:AddTextInstruction(EncodeString(feature.verticalClearanceClosed.verticalClearanceValue, 'clr cl %4.1f'), 11, 24, 12210, 24)
		end

		if feature.verticalClearanceOpen and feature.verticalClearanceOpen.verticalClearanceValue then
			featurePortrayal:AddInstructions('LocalOffset:3.51,-3.51;FontColor:CHBLK')
			featurePortrayal:AddTextInstruction(EncodeString(feature.verticalClearanceOpen.verticalClearanceValue, 'clr op %4.1f'), 11, 24, 12210, 24)
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return 12210
end
