
-- Unsurveyed area main entry point.
function UnsurveyedArea(feature, featurePortrayal, contextParameters)
	local viewingGroup

	featurePortrayal:AddInstructions('AlertReference:SafetyContour')

	if feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		viewingGroup = 11050
		featurePortrayal:AddInstructions('ViewingGroup:11050;DrawingPriority:3;DisplayPlane:UnderRadar')
		featurePortrayal:AddInstructions('ColorFill:NODTA')
		featurePortrayal:AddInstructions('AreaFillReference:NODATA03')
		featurePortrayal:SimpleLineStyle('solid',0.64,'CHGRD')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
