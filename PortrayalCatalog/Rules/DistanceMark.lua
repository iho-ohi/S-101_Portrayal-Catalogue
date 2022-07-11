-- Converter Version: 0.99
-- Feature Catalogue Version: 1.0.0 (2019/4/9)
-- #65

-- Distance mark main entry point.
function DistanceMark(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Point then
		local structures = feature:GetFeatureAssociations('StructureEquipment')
		if next(structures) == nil then
			-- no StructureEquipment relationship, add a symbol
			viewingGroup = 27030
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:27030;DrawingPriority:21;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:27030;DrawingPriority:21;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:DISMAR06')
		else
			-- TODO: assign viewing group from structure?
			viewingGroup = 27030
		end
		
		if feature.measuredDistanceValue
		then
			local label = ''
			
			local distanceUnitMeasurement = feature.measuredDistanceValue.distanceUnitMeasurement
			if distanceUnitMeasurement
			then
				if distanceUnitMeasurement == 1	then
					label = 'm'
				elseif distanceUnitMeasurement == 2 then
					label = 'yd'
				elseif distanceUnitMeasurement == 3 then
					label = 'km'
				elseif distanceUnitMeasurement == 4 then
					label = 'sm'
				elseif distanceUnitMeasurement == 5 then
					label = 'nm'
				end
			end
			
			local waterwayDistance = feature.measuredDistanceValue.waterwayDistance
			if waterwayDistance
			then
				label = label .. waterwayDistance
			end
		
			featurePortrayal:AddInstructions('LocalOffset:2.106,0;FontWeight:Light;FontSize:6;FontColor:CHMGD')
			featurePortrayal:AddTextInstruction(EncodeString(label), 21, 24, viewingGroup, 21)
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
