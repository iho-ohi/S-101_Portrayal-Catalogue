-- Converter Version: 0.99
-- Feature Catalogue Version: 1.0.0 (2019/4/9)

-- Local magnetic anomaly main entry point.
function LocalMagneticAnomaly(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		viewingGroup = 31080
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('ViewingGroup:31080;DrawingPriority:12;DisplayPlane:OverRADAR')
		else
			featurePortrayal:AddInstructions('ViewingGroup:31080;DrawingPriority:12;DisplayPlane:UnderRADAR')
		end
		featurePortrayal:AddInstructions('PointInstruction:LOCMAG01')
		

	elseif feature.PrimitiveType == PrimitiveType.Curve then
		viewingGroup = 31080
		featurePortrayal:AddInstructions('ViewingGroup:31080;DrawingPriority:12;DisplayPlane:UnderRADAR')
		featurePortrayal:SimpleLineStyle('dash',0.32,'CHMGF')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
		featurePortrayal:AddInstructions('PointInstruction:LOCMAG01')
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PlainBoundaries then
		viewingGroup = 31080
		featurePortrayal:AddInstructions('ViewingGroup:31080;DrawingPriority:12;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('PointInstruction:LOCMAG51')
		featurePortrayal:SimpleLineStyle('dash',0.32,'CHGRD')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		viewingGroup = 31080
		featurePortrayal:AddInstructions('ViewingGroup:31080;DrawingPriority:12;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('PointInstruction:LOCMAG51')
		featurePortrayal:AddInstructions('LineInstruction:NAVARE51')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

		-- issue #73
		
		if feature.valueOfLocalMagneticAnomaly then	-- complex attribute
			--Debug.Break()
			if feature.valueOfLocalMagneticAnomaly.magneticAnomalyValueMaximum then
				featurePortrayal:AddInstructions('LocalOffset:3.51,3.51;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(feature.valueOfLocalMagneticAnomaly.magneticAnomalyValueMaximum, '%3.1f\''), 30, 24, viewingGroup, 12)
			end
		end
		-- end #73

	return viewingGroup
end
