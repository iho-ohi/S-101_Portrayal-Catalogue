
-- Referenced portrayal rules.
require 'RESTRN01'

-- Territorial sea area main entry point.
function TerritorialSeaArea(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Surface or feature.PrimitiveType == PrimitiveType.Curve then
		-- Plain and symbolized boundaries use the same symbolization
		viewingGroup = 36050
		featurePortrayal:AddInstructions('ViewingGroup:36050;DrawingPriority:6;DisplayPlane:UnderRadar')
		featurePortrayal:SimpleLineStyle('dash',0.64,'CHGRF')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
		RESTRN01(feature, featurePortrayal, contextParameters, viewingGroup)
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
