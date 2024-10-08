--
-- ISSUES: PC #56, PSWG #23 

-- Referenced portrayal rules.
require 'DEPARE03'

-- Dredged area main entry point.
function DredgedArea(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		viewingGroup = 13030
		featurePortrayal:AddInstructions('ViewingGroup:13030;DrawingPriority:3;DisplayPlane:UnderRadar')
		DEPARE03(feature, featurePortrayal, contextParameters, viewingGroup)

		-- Dredged Date (row 47 main) #56
		featurePortrayal:AddInstructions('LocalOffset:0,-3.51;TextAlignHorizontal:Center;TextAlignVertical:Center;FontSize:10;FontSlant:Italics;FontColor:CHBLK')

		local drmv = ''
		local date = ''
		
		-- DEBUG TESTING with fake date
		-- feature.dredgedDate = '20220506'
		-- local drm = feature.depthRangeMinimumValue
		-- drm = nil
		-- END DEBUG

		if feature.depthRangeMinimumValue ~= nil then
			-- #262 precision of numeric values
			-- #438 removed text 'dredged to' before dredge depth value
			drmv = EncodeString(feature.depthRangeMinimumValue, '%gm')
			
			if feature.dredgedDate then 
				date = EncodeString(feature.dredgedDate, ' (%s)')
			end
		end

		-- combine depth with date
		local daDate = drmv .. date
		featurePortrayal:AddTextInstruction(EncodeString(daDate, '%s'), 11, 24, 13030, 3)
		-- end Dredged Date (row 47 main) #56
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
