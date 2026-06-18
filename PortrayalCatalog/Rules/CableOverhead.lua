
-- Cable Overhead main entry point.
function CableOverhead(feature, featurePortrayal, contextParameters)
	local viewingGroup

	featurePortrayal:AddInstructions('AlertReference:NavHazard')

	if feature.PrimitiveType == PrimitiveType.Curve then
		--1 Cables 1&3, Radar, Safe Clearance
		if (feature.categoryOfCable == 1 or feature.categoryOfCable == 3) and feature.radarConspicuous and feature.verticalClearanceSafe and feature.verticalClearanceSafe.verticalClearanceValue then
			viewingGroup = 12210
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:UnderRadar')
			end
			featurePortrayal:AddInstructions('LineInstruction:CBLOHD01')
			featurePortrayal:AddInstructions('PointInstruction:RACNSP01')
			if feature.verticalClearanceSafe and feature.verticalClearanceSafe.verticalClearanceValue then
				featurePortrayal:AddInstructions('LocalOffset:3.51,3.51;FontColor:CHBLK')
				featurePortrayal:AddTextInstruction(EncodeString(feature.verticalClearanceSafe.verticalClearanceValue, 'sf clr %4.1f'), 11, 24, 15110, 24)
			end

		--2 Cables 1&3, Radar, Fixed 
		elseif (feature.categoryOfCable == 1 or feature.categoryOfCable == 3) and feature.radarConspicuous and feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
			viewingGroup = 12210
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:UnderRadar')
			end
			featurePortrayal:AddInstructions('LineInstruction:CBLOHD01')
			featurePortrayal:AddInstructions('PointInstruction:RACNSP01')
			if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
				featurePortrayal:AddInstructions('LocalOffset:3.51,3.51;FontColor:CHBLK')
				featurePortrayal:AddTextInstruction(EncodeString(feature.verticalClearanceFixed.verticalClearanceValue, 'clr %4.1f'), 11, 24, 15110, 24)
			end

		--3 Cables 1&3, Radar, No Value
		elseif (feature.categoryOfCable == 1 or feature.categoryOfCable == 3) and feature.radarConspicuous then
			viewingGroup = 12210
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:UnderRadar')
			end
			featurePortrayal:AddInstructions('LineInstruction:CBLOHD01')
			featurePortrayal:AddInstructions('PointInstruction:RACNSP01')

		--4 Cables 1&3, NO Radar, Safe
		elseif (feature.categoryOfCable == 1 or feature.categoryOfCable == 3) and feature.verticalClearanceSafe and feature.verticalClearanceSafe.verticalClearanceValue then
			viewingGroup = 12210
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:UnderRadar')
			end
			featurePortrayal:AddInstructions('LineInstruction:CBLOHD01')
			if feature.verticalClearanceSafe and feature.verticalClearanceSafe.verticalClearanceValue then
				featurePortrayal:AddInstructions('LocalOffset:3.51,3.51;FontColor:CHBLK')
				featurePortrayal:AddTextInstruction(EncodeString(feature.verticalClearanceSafe.verticalClearanceValue, 'sf clr %4.1f'), 11, 24, 15110, 24)
			end 

 
		--5 Cables 1&3, NO radar, Fixed
		elseif (feature.categoryOfCable == 1 or feature.categoryOfCable == 3)  and feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
			viewingGroup = 12210
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:UnderRadar')
			end
			featurePortrayal:AddInstructions('LineInstruction:CBLOHD01')
			if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
				featurePortrayal:AddInstructions('LocalOffset:3.51,3.51;FontColor:CHBLK')
				featurePortrayal:AddTextInstruction(EncodeString(feature.verticalClearanceFixed.verticalClearanceValue, 'clr %4.1f'), 11, 24, 12210, 24)
			end 

		--6 NO Cables, Radar, Safe
		elseif feature.radarConspicuous and feature.verticalClearanceSafe and feature.verticalClearanceSafe.verticalClearanceValue then
			viewingGroup = 12210
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:UnderRadar')
			end
			featurePortrayal:SimpleLineStyle('dash',1.28,'CHGRD')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
			featurePortrayal:AddInstructions('PointInstruction:RACNSP01')
			if feature.verticalClearanceSafe and feature.verticalClearanceSafe.verticalClearanceValue then
				featurePortrayal:AddInstructions('LocalOffset:3.51,3.51;FontColor:CHBLK')
				featurePortrayal:AddTextInstruction(EncodeString(feature.verticalClearanceSafe.verticalClearanceValue, 'sf clr %4.1f'), 11, 24, 15110, 24)
			end 

		--7 NO Cables, Radar, Fixed
		elseif feature.radarConspicuous and feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then

			viewingGroup = 12210
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:UnderRadar')
			end
			featurePortrayal:SimpleLineStyle('dash',1.28,'CHGRD')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
			featurePortrayal:AddInstructions('PointInstruction:RACNSP01')
			if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
				featurePortrayal:AddInstructions('LocalOffset:3.51,3.51;FontColor:CHBLK')
				featurePortrayal:AddTextInstruction(EncodeString(feature.verticalClearanceFixed.verticalClearanceValue, 'clr %4.1f'), 11, 24, 15110, 24)
			end

		--8 NO Cables, Radar, NO Value
		elseif feature.radarConspicuous then
			viewingGroup = 12210
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:UnderRadar')
			end
			featurePortrayal:SimpleLineStyle('dash',1.28,'CHGRD')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
			featurePortrayal:AddInstructions('PointInstruction:RACNSP01')
			

		--9 No Cables, No Radar, Safe
		elseif feature.verticalClearanceSafe and feature.verticalClearanceSafe.verticalClearanceValue then
			viewingGroup = 12210
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:UnderRadar')
			end
			featurePortrayal:SimpleLineStyle('dash',1.28,'CHGRD')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
			if feature.verticalClearanceSafe and feature.verticalClearanceSafe.verticalClearanceValue then
				featurePortrayal:AddInstructions('LocalOffset:3.51,3.51;FontColor:CHBLK')
				featurePortrayal:AddTextInstruction(EncodeString(feature.verticalClearanceSafe.verticalClearanceValue, 'sf clr %4.1f'), 11, 24, 15110, 24)
			end

		--10 No Cables, No Radar, Fixed	
		elseif feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
			viewingGroup = 12210
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:UnderRadar')
			end
			featurePortrayal:SimpleLineStyle('dash',1.28,'CHGRD')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
			if feature.verticalClearanceFixed and feature.verticalClearanceFixed.verticalClearanceValue then
				featurePortrayal:AddInstructions('LocalOffset:3.51,3.51;FontColor:CHBLK')
				featurePortrayal:AddTextInstruction(EncodeString(feature.verticalClearanceFixed.verticalClearanceValue, 'clr %4.1f'), 11, 24, 15110, 24)
			end
		
		--default
		else
			viewingGroup = 12210
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:OverRadar')
			else
				featurePortrayal:AddInstructions('ViewingGroup:12210;DrawingPriority:24;DisplayPlane:UnderRadar')
			end
			featurePortrayal:SimpleLineStyle('dash',1.28,'CHGRD')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		end

	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
