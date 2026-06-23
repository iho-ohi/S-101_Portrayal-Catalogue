-- Referenced portrayal rules.
require 'RESTRN01'

-- Cable area main entry point.
function CableArea(feature, featurePortrayal, contextParameters)
    local viewingGroup = 34030

    if feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PlainBoundaries then
        
        -- Radar Overlay Check
        if contextParameters.RadarOverlay then
            featurePortrayal:AddInstructions('ViewingGroup:34030;DrawingPriority:9;DisplayPlane:OverRadar')
        else
            featurePortrayal:AddInstructions('ViewingGroup:34030;DrawingPriority:9;DisplayPlane:UnderRadar')
        end

        -- Cables 4 & 5 (Telephone / Telegraph)
        if feature.categoryOfCable == 4 or feature.categoryOfCable == 5 then 
            featurePortrayal:AddInstructions('PointInstruction:CBLARE52') --need to change to CBLARE52 
            featurePortrayal:SimpleLineStyle('dash', 0.64, 'CHMGD')
            featurePortrayal:AddInstructions('LineInstruction:_simple_')
            RESTRN01(feature, featurePortrayal, contextParameters, viewingGroup)
            
        -- Default (Other Cables)
        else
            featurePortrayal:AddInstructions('PointInstruction:CBLARE51')
            featurePortrayal:SimpleLineStyle('dash', 0.64, 'CHMGD')
            featurePortrayal:AddInstructions('LineInstruction:_simple_')
            RESTRN01(feature, featurePortrayal, contextParameters, viewingGroup)
        end

    elseif feature.PrimitiveType == PrimitiveType.Surface then
        
        if contextParameters.RadarOverlay then
            featurePortrayal:AddInstructions('ViewingGroup:34030;DrawingPriority:9;DisplayPlane:OverRadar')
        else
            featurePortrayal:AddInstructions('ViewingGroup:34030;DrawingPriority:9;DisplayPlane:UnderRadar')
        end

        -- Cables 4 & 5 (Telephone / Telegraph)
        if feature.categoryOfCable == 4 or feature.categoryOfCable == 5 then
            featurePortrayal:AddInstructions('PointInstruction:CBLARE52') --need to change to CBLARE52
            featurePortrayal:AddInstructions('LineInstruction:CBLARE52') --need to change to CBLARE52
            RESTRN01(feature, featurePortrayal, contextParameters, viewingGroup)
            
        -- Default (Other Cables)
        else
            featurePortrayal:AddInstructions('PointInstruction:CBLARE51') 
            featurePortrayal:AddInstructions('LineInstruction:CBLARE51')
            RESTRN01(feature, featurePortrayal, contextParameters, viewingGroup)
        end

    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    return viewingGroup
end
