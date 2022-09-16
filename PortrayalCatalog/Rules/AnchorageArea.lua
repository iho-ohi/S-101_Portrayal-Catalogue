-- Converter Version: 0.99
-- Feature Catalogue Version: 1.0.0 (2019/4/9)
--
-- ISSUES: {PSWG #72, PC #121}, {PSWG #28, PC #124}
--
-- Referenced portrayal rules.
require 'RESTRN01'

-- Anchorage area main entry point.
function AnchorageArea(feature, featurePortrayal, contextParameters)
	local viewingGroup
	local COA = feature.categoryOfAnchorage

	featurePortrayal:AddInstructions('AlertReference:ProhAre,112,112')

	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		viewingGroup = 26220
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('ViewingGroup:26220;DrawingPriority:18;DisplayPlane:OverRADAR')
		else
			featurePortrayal:AddInstructions('ViewingGroup:26220;DrawingPriority:18;DisplayPlane:UnderRADAR')
		end

		if COA == 8 then		-- 8 - Small Craft Mooring Area #28
			featurePortrayal:AddInstructions('PointInstruction:BOYMOR02')
		elseif COA == 15 then	-- 15 - Reported Anchorage PSWG #72
			featurePortrayal:AddInstructions('PointInstruction:ACHARE03')
		else
			featurePortrayal:AddInstructions('PointInstruction:ACHARE02')
		end

		if feature.featureName[1] and feature.featureName[1].name then
			featurePortrayal:AddInstructions('LocalOffset:-3.51,-7.02;FontSize:10')
			featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters)), 26, 24, 26220, 18)
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PlainBoundaries then
		if COA == 8 then
			viewingGroup = 26220
			featurePortrayal:AddInstructions('ViewingGroup:26220;DrawingPriority:9;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:BOYMOR51')
			featurePortrayal:SimpleLineStyle('dash',0.64,'CHGRF')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')

			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,7.02;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters)), 26, 24, 26220, 9)
			end

			RESTRN01(feature, featurePortrayal, contextParameters, viewingGroup)
		else
			viewingGroup = 26220
			featurePortrayal:AddInstructions('ViewingGroup:26220;DrawingPriority:9;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:ACHARE51')
			featurePortrayal:SimpleLineStyle('dash',0.64,'CHMGF')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')

			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,-7.02;TextAlignHorizontal:End;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters)), 26, 24, 26220, 9)
			end
			RESTRN01(feature, featurePortrayal, contextParameters, viewingGroup)
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if COA == 8 then
			viewingGroup = 26220
			featurePortrayal:AddInstructions('ViewingGroup:26220;DrawingPriority:9;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:BOYMOR51')
			featurePortrayal:AddInstructions('LineInstruction:NAVARE52')

			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,7.02;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters)), 26, 24, 26220, 9)
			end

			RESTRN01(feature, featurePortrayal, contextParameters, viewingGroup)
		else
			viewingGroup = 26220
			featurePortrayal:AddInstructions('ViewingGroup:26220;DrawingPriority:9;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:ACHARE51')
			featurePortrayal:AddInstructions('LineInstruction:ACHARE51')

			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:-3.51,7.02;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters)), 26, 24, 26220, 9)
			end

			RESTRN01(feature, featurePortrayal, contextParameters, viewingGroup)
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
