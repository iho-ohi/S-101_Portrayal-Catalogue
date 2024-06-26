-- TextPlacement portrayal rules file.

-- Main entry point for feature type.
function TextPlacement(feature, featurePortrayal, contextParameters)
	-- NOTE:
	--
	-- TextPlacement is not implemented via this file; this routine will never be called (because it is short-circuited in main.lua).
	-- TextPlacement is processed when the feature(s) to which it is associated are processed.
	-- The implementation is in PortrayalModel.lua, mostly as part of featurePortrayal:AddTextInstruction() and featurePortrayal:GetFeatureName().
	return -1
end
