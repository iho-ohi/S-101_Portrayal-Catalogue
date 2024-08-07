
-- Referenced portrayal rules.
require 'SOUNDG03'

-- Sounding main entry point.
function Sounding(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.MultiPoint then
		-- Simplified and paper chart points use the same symbolization
		viewingGroup = 33010
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('ViewingGroup:33010;DrawingPriority:18;DisplayPlane:OverRadar')
		else
			featurePortrayal:AddInstructions('ViewingGroup:33010;DrawingPriority:18;DisplayPlane:UnderRadar')
		end
		SOUNDG03(feature, featurePortrayal, contextParameters, viewingGroup)
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
