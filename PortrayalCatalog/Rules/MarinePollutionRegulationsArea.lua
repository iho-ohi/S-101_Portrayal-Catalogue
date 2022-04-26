-- MarinePollutionRegulationsArea main entry point.

function MarinePollutionRegulationsArea(feature, featurePortrayal, contextParameters)

-- TODO: Implement rule
	featurePortrayal:AddInstructions('ViewingGroup:21010;DrawingPriority:15;DisplayPlane:UnderRADAR;NullInstruction') 

	return 21010
end