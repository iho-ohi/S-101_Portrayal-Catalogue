-- Converter Version: 0.99
-- Feature Catalogue Version: 1.0.0 (2019/4/9)

-- Dock area main entry point.
function DockArea(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Surface then
		viewingGroup = 22010
		featurePortrayal:AddInstructions('ViewingGroup:22010;DrawingPriority:9;DisplayPlane:UnderRADAR;ColorFill:DEPVS')
		if feature.featureName[1] and feature.featureName[1].name then
			featurePortrayal:AddInstructions('LocalOffset:0,0;TextAlignHorizontal:Center;TextAlignVertical:Center;FontSize:10')
			featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters)), 26, 24, 22010, 6)
		end
		if feature.condition then
			featurePortrayal:SimpleLineStyle('dash',0.32,'CHBLK')
		else
			featurePortrayal:SimpleLineStyle('solid',0.32,'CHBLK')
		end
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
