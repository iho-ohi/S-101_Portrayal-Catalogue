-- QualityOfBathymetricData portrayal rules file.

-- Main entry point for feature type.
function QualityOfBathymetricData(feature, featurePortrayal, contextParameters)
	if feature.PrimitiveType ~= PrimitiveType.Surface then
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
	
	--[[
		See https://github.com/iho-ohi/S-101_Portrayal-Catalogue/issues/50
	
		Rule Note: Plain and symbolized boundaries use the same symbolization
	--]]

	local scaleFactor = 0.311 -- Scale 16.04mm symbols to 5mm.
	local catzoc

	--Debug.Break()  
	
	featurePortrayal:AddInstructions('ViewingGroup:31010;DrawingPriority:4;DisplayPlane:UnderRADAR')

	if (feature.zoneOfConfidence[1]) then
		if (feature.zoneOfConfidence[1].categoryOfZoneOfConfidenceInData) then
			if (feature.zoneOfConfidence[1].categoryOfZoneOfConfidenceInData == 1) then
				catzoc = 'A11'
			end
			if (feature.zoneOfConfidence[1].categoryOfZoneOfConfidenceInData == 2) then
				catzoc = 'A21'
			end
			if (feature.zoneOfConfidence[1].categoryOfZoneOfConfidenceInData == 3) then
				catzoc = 'B01'
			end
			if (feature.zoneOfConfidence[1].categoryOfZoneOfConfidenceInData == 4) then
				catzoc = 'C01'
			end
			if (feature.zoneOfConfidence[1].categoryOfZoneOfConfidenceInData == 5) then
				catzoc = 'D01'
			end
			if (feature.zoneOfConfidence[1].categoryOfZoneOfConfidenceInData == 6) then
				catzoc = 'U01'
			end
			-- CATZOC values defined
			featurePortrayal:AddInstructions('AreaFillReference:DQUAL' .. catzoc .. '')
			featurePortrayal:SimpleLineStyle('dash',0.64,'CHGRD')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')

		else
			-- default without CATZOC: "M_QUAL","","AP(NODATA03);LS(DASH,2,CHGRD)","4","S","OTHER","31010" 

		featurePortrayal:AddInstructions('AreaFillReference:NODATA03')
		featurePortrayal:SimpleLineStyle('dash',0.64,'CHGRD')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
		end
	end

	return 31010
end
