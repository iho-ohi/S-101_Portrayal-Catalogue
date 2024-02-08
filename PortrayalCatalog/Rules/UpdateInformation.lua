-- UpdateInformation conditional symbology rules file.
-- #119
-- #192

-- Main entry point for CSP.
function UpdateInformation(feature, featurePortrayal, contextParameters)
	local viewingGroup = "updateReview"
	local updateType = feature.updateType
	
	-- Place feature on top of everything except text
	featurePortrayal:AddInstructions('ViewingGroup:updateReview;DrawingPriority:30')

	if feature.PrimitiveType == PrimitiveType.Point then
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('DisplayPlane:OverRADAR')
		else
			featurePortrayal:AddInstructions('DisplayPlane:UnderRADAR')
		end
		
		if updateType == 1 then
			-- insert
			featurePortrayal:AddInstructions('PointInstruction:CHRVID01')
		elseif updateType == 2 then
			-- delete
			featurePortrayal:AddInstructions('PointInstruction:CHRVDEL1')
		elseif updateType == 3 then
			-- modify
			featurePortrayal:AddInstructions('PointInstruction:CHRVDEL1;PointInstruction:CHRVID01')
		elseif updateType == 4 then
			-- move (spatial on this feature marks old location, associated feature spatial is new location)
			featurePortrayal:AddInstructions('PointInstruction:CHRVDEL1')

			--local associatedFeatures = feature:GetFeatureAssociations('UpdatedInformation')
			--local pt2 = feature.Point.Spatial

			--local i, other = next(associatedFeatures)
			--while i do
				--local spatial = other.Spatial
				
				--if (other.Spatial.SpatialType ~= SpatialType.Point)
					--error('UpdateInformation: unsupported portrayal; spatial type changed during move')
					
				--local pt1 = other.Point.Spatial
				--featurePortrayal:AddInstructions('AugmentedPoint:GeographicCRS,' .. pt1.X .. ',' .. pt1.Y)
				--featurePortrayal:AddInstructions('PointInstruction:CHRVID01')
				--featurePortrayal:AddInstructions('Polyline:' .. pt1.X .. ',' .. pt1.Y .. ',' .. pt2.X .. ',' .. pt2.Y)
				--featurePortrayal:AddInstructions('AugmentedPath:GeographicCRS,GeographicCRS,GeographicCRS')
				--featurePortrayal:SimpleLineStyle('dot',0.64,'CHCOR')
				--featurePortrayal:AddInstructions('LineInstruction:_simple_')
				--i, other = next(associatedFeatures, i)
			--end
		else
			-- undefined updateType
			error('UpdateInformation feature with undefined updateType')
		end
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		featurePortrayal:AddInstructions('DisplayPlane:UnderRADAR')
		if updateType == 1 then
			-- insert
			featurePortrayal:AddInstructions('LineInstructionUnsuppressed:CHRVID02')
		elseif updateType == 2 then
			-- delete
			featurePortrayal:AddInstructions('LineInstructionUnsuppressed:CHRVDEL2')
		elseif updateType == 3 then
			-- modify
			featurePortrayal:AddInstructions('LineInstructionUnsuppressed:CHRVDEL2')
			featurePortrayal:AddInstructions('LineInstructionUnsuppressed:CHRVID02')
		elseif updateType == 4 then
			-- move
			featurePortrayal:AddInstructions('LineInstructionUnsuppressed:CHRVDEL2')
		else
			-- undefined updateType
			error('UpdateInformation feature with undefined updateType')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		featurePortrayal:AddInstructions('DisplayPlane:UnderRADAR')
		if updateType == 1 then
			-- insert
			featurePortrayal:AddInstructions('LineInstructionUnsuppressed:CHRVID02;PointInstruction:CHRVID01')
		elseif updateType == 2 then
			-- delete
			featurePortrayal:AddInstructions('LineInstructionUnsuppressed:CHRVDEL2;PointInstruction:CHRVDEL1')
		elseif updateType == 3 then
			-- modify
			featurePortrayal:AddInstructions('LineInstructionUnsuppressed:CHRVDEL2')
			featurePortrayal:AddInstructions('LineInstructionUnsuppressed:CHRVID02')
			featurePortrayal:AddInstructions('PointInstruction:CHRVID01')
			featurePortrayal:AddInstructions('PointInstruction:CHRVDEL1')
		elseif updateType == 4 then
			-- move
			featurePortrayal:AddInstructions('LineInstructionUnsuppressed:CHRVDEL2')
			featurePortrayal:AddInstructions('PointInstruction:CHRVDEL1')
		else
			-- undefined updateType
			error('UpdateInformation feature with undefined updateType')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
	return viewingGroup
end
