-- Converter Version: 0.99
-- Feature Catalogue Version: 1.0.0 (2019/4/9)

-- Issues PC #114, PSWG 54

-- Referenced portrayal rules.
require 'RESTRN01'

-- Offshore production area main entry point.
function OffshoreProductionArea(feature, featurePortrayal, contextParameters)
	local viewingGroup

	featurePortrayal:AddInstructions('AlertReference:ProhAre,106,106')

	if feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PlainBoundaries and feature.categoryOfOffshoreProductionArea == 4 then
			viewingGroup = 26040
		featurePortrayal:AddInstructions('ViewingGroup:26040;DrawingPriority:12;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('PointInstruction:2022_TNKFRM')
		featurePortrayal:SimpleLineStyle('dash',0.64,'CHMGD')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PlainBoundaries then
		viewingGroup = 26040
		featurePortrayal:AddInstructions('ViewingGroup:26040;DrawingPriority:12;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('PointInstruction:CTYARE51')
		featurePortrayal:SimpleLineStyle('dash',0.64,'CHMGD')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
		RESTRN01(feature, featurePortrayal, contextParameters, viewingGroup)
	elseif feature.PrimitiveType == PrimitiveType.Surface and feature.categoryOfOffshoreProductionArea == 4 then
		viewingGroup = 26040
		featurePortrayal:AddInstructions('ViewingGroup:26040;DrawingPriority:12;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('PointInstruction:2022_TNKFRM')
		featurePortrayal:AddInstructions('LineInstruction:NAVARE51')
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		viewingGroup = 26040
		featurePortrayal:AddInstructions('ViewingGroup:26040;DrawingPriority:12;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('PointInstruction:CTYARE51')
		featurePortrayal:AddInstructions('LineInstruction:CTYARE51')
		RESTRN01(feature, featurePortrayal, contextParameters, viewingGroup)
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
