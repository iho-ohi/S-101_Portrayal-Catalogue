-- Converter Version: 0.99
-- Feature Catalogue Version: 1.0.0 (2019/4/9)
--
-- #306, #312
--
-- Bridge main entry point.
function Bridge(feature, featurePortrayal, contextParameters)
	local viewingGroup = 12210

	if feature.PrimitiveType ~= PrimitiveType.None then
		featurePortrayal:AddInstructions('AlertReference:NavHazard')
	end

	if contextParameters.RadarOverlay then
		featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:OverRADAR')
	else
		featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:UnderRADAR')
	end

	-- if over navigable water: "opening bridge" is mandatory
	-- If "opening bridge" = True: category of opening bridge
	if feature.PrimitiveType == PrimitiveType.Curve then
		if feature.openingBridge == true then
			featurePortrayal:SimpleLineStyle('solid',1.6,'CHGRD')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
			featurePortrayal:AddInstructions('PointInstruction:BRIDGE01')
		else
			featurePortrayal:SimpleLineStyle('solid',1.6,'CHGRD')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PlainBoundaries then
		if feature.openingBridge == true then
			featurePortrayal:SimpleLineStyle('solid',1.6,'CHGRD')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
			featurePortrayal:AddInstructions('PointInstruction:BRIDGE01')
		else
			featurePortrayal:SimpleLineStyle('solid',1.6,'CHGRD')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if feature.openingBridge == true then
			featurePortrayal:SimpleLineStyle('solid',1.6,'CHGRD')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
			featurePortrayal:AddInstructions('PointInstruction:BRIDGE01')
		else
			featurePortrayal:SimpleLineStyle('solid',1.6,'CHGRD')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		end		
	elseif feature.PrimitiveType == PrimitiveType.None then
		viewingGroup = 12210
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:OverRADAR;NullInstruction')
		else
			featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:UnderRADAR;NullInstruction')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
