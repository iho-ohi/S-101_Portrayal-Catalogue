-- Converter Version: 0.99
-- Feature Catalogue Version: 1.0.0 (2019/4/9)

-- Issue #161, PSWG #108

-- Sloping ground main entry point.
function SlopingGround(feature, featurePortrayal, contextParameters)
	local viewingGroup


	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization

		local symbol = 'HILTOP01'

		if feature.visualProminence == 1 or feature.radarConspicuous then
			symbol = 'HILTOP11'
		end

		viewingGroup = 32010
		featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:9;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('PointInstruction:' .. symbol)
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PlainBoundaries then
		if feature.categoryOfSlope == 1 and feature.radarConspicuous then
			viewingGroup = 32010
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:9;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFill:CHGRD')
			featurePortrayal:SimpleLineStyle('solid',0.32,'CHBLK')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		elseif feature.categoryOfSlope == 2 and feature.radarConspicuous then
			viewingGroup = 32010
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:9;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFill:CHGRD')
			featurePortrayal:SimpleLineStyle('solid',0.32,'CHBLK')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		elseif feature.categoryOfSlope == 3 and feature.radarConspicuous then
			viewingGroup = 32010
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:9;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFill:CHGRD')
			featurePortrayal:SimpleLineStyle('solid',0.32,'CHBLK')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		elseif feature.categoryOfSlope == 4 and feature.radarConspicuous then
			viewingGroup = 32010
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:9;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFill:CHGRD')
			featurePortrayal:SimpleLineStyle('solid',0.32,'CHBLK')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		elseif feature.categoryOfSlope == 5 and feature.radarConspicuous then
			viewingGroup = 32010
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:9;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFill:CHGRD')
			featurePortrayal:SimpleLineStyle('solid',0.32,'CHBLK')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		elseif feature.categoryOfSlope == 6 then
			viewingGroup = 32010
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:9;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFill:CHGRD')
		elseif feature.categoryOfSlope == 7 and feature.radarConspicuous then
			viewingGroup = 32010
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:9;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFill:CHGRD')
			featurePortrayal:SimpleLineStyle('solid',0.32,'CHBLK')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		else
			viewingGroup = 32010
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:9;DisplayPlane:UnderRADAR;NullInstruction')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		
		local myFeature  = feature
		local color = 'CHBLK'
	
		viewingGroup = 32010
	
		--DEBUG TEST
		--Debug.Break()
		--myFeature.categoryOfSlope = 2
		--myFeature.radarConspicuous = false
		--myFeature.visualProminence = 1
		-- END DEBUG TEST

		if contains(myFeature.categoryOfSlope, {1, 2, 3}) then

			if myFeature.radarConspicuous == true and myFeature.visualProminence == 1 then
			-- do as S-52
				color = 'CHBLK'

				featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:9;DisplayPlane:UnderRADAR')
				featurePortrayal:AddInstructions('ColorFill:LANDF')
				featurePortrayal:SimpleLineStyle('solid',0.32,color)
				featurePortrayal:AddInstructions('LineInstruction:_simple_')

			elseif myFeature.radarConspicuous ~= true or myFeature.visualProminence ~= 1 then 
			--PSWG #108
				color = 'CHGRD'
				featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:9;DisplayPlane:UnderRADAR')
				featurePortrayal:AddInstructions('ColorFill:LANDF')
				featurePortrayal:SimpleLineStyle('solid',0.32,color)
				featurePortrayal:AddInstructions('LineInstruction:_simple_')
			end
		elseif contains(myFeature.categoryOfSlope, {4, 5, 7}) then
			if myFeature.radarConspicuous == true then
			-- do as S-52
				color = 'CHBLK'

				featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:9;DisplayPlane:UnderRADAR')
				featurePortrayal:AddInstructions('ColorFill:LANDF')
				featurePortrayal:SimpleLineStyle('solid',0.32,color)
				featurePortrayal:AddInstructions('LineInstruction:_simple_')

			else
			--PSWG #108
				color = 'CHGRD'
				featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:9;DisplayPlane:UnderRADAR')
				featurePortrayal:AddInstructions('ColorFill:LANDF')
				featurePortrayal:SimpleLineStyle('solid',0.32,color)
				featurePortrayal:AddInstructions('LineInstruction:_simple_')
			end
		elseif myFeature.categoryOfSlope == 6 then
			viewingGroup = 32010
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:9;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFill:LANDF')
			featurePortrayal:SimpleLineStyle('solid',0.32,'CHBLK')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')


		else
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:9;DisplayPlane:UnderRADAR;NullInstruction')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	--[[
		end
	
		if feature.categoryOfSlope == 1 and feature.radarConspicuous and feature.visualProminence == 1 then
			viewingGroup = 32010
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:9;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFill:LANDF')
			featurePortrayal:SimpleLineStyle('solid',0.32,'CHBLK')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		elseif feature.categoryOfSlope == 2 and feature.radarConspicuous and feature.visualProminence == 1 then
			viewingGroup = 32010
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:9;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFill:LANDF')
			featurePortrayal:SimpleLineStyle('solid',0.32,'CHBLK')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		elseif feature.categoryOfSlope == 3 and feature.radarConspicuous and feature.visualProminence == 1 then
			viewingGroup = 32010
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:9;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFill:LANDF')
			featurePortrayal:SimpleLineStyle('solid',0.32,'CHBLK')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		elseif feature.categoryOfSlope == 4 and feature.radarConspicuous then
			viewingGroup = 32010
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:9;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFill:LANDF')
			featurePortrayal:SimpleLineStyle('solid',0.32,'CHBLK')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		elseif feature.categoryOfSlope == 5 and feature.radarConspicuous then
			viewingGroup = 32010
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:9;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFill:LANDF')
			featurePortrayal:SimpleLineStyle('solid',0.32,'CHBLK')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		elseif feature.categoryOfSlope == 6 then
			viewingGroup = 32010
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:9;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFill:LANDF')
			featurePortrayal:SimpleLineStyle('solid',0.32,'CHBLK')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		elseif feature.categoryOfSlope == 7 and feature.radarConspicuous then
			viewingGroup = 32010
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:9;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFill:LANDF')
			featurePortrayal:SimpleLineStyle('solid',0.32,'CHBLK')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		else
			viewingGroup = 32010
			featurePortrayal:AddInstructions('ViewingGroup:32010;DrawingPriority:9;DisplayPlane:UnderRADAR;NullInstruction')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
	--]]
	return viewingGroup
end
