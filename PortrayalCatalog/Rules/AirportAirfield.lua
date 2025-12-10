-- #134

-- Airport/airfield main entry point.
function AirportAirfield(feature, featurePortrayal, contextParameters)
	local viewingGroup
	local categoriesOfAirportAirfield = feature.categoryOfAirportAirfield
  local categoryOfAirportAirfieldIsHeli = false
  for i = 1, #categoriesOfAirportAirfield do
    local category = categoriesOfAirportAirfield[i]
    if category  == 3 or category == 4 then
      categoryOfAirportAirfieldIsHeli = true
      break
    end
  end
	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		viewingGroup = 32240
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('ViewingGroup:32240;DrawingPriority:12;DisplayPlane:OverRadar')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32240;DrawingPriority:12;DisplayPlane:UnderRadar')
		end
		if categoryOfAirportAirfieldIsHeli then
		    featurePortrayal:AddInstructions('PointInstruction:HELIPD02')
		else
		    featurePortrayal:AddInstructions('PointInstruction:AIRARE02')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		viewingGroup = 32240
		featurePortrayal:AddInstructions('ViewingGroup:32240;DrawingPriority:6;DisplayPlane:UnderRadar')
		if categoryOfAirportAirfieldIsHeli then
			featurePortrayal:AddInstructions('PointInstruction:HELIPD02')
		else
			featurePortrayal:AddInstructions('AreaFillReference:AIRARE02')
		end
		featurePortrayal:SimpleLineStyle('solid',0.32,'LANDF')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end
	return viewingGroup
end
