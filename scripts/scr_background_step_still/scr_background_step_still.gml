/// @param {Struct.Background} background
/// @param {Real} cameraX
/// @param {Real} cameraY
function scr_background_step_still(background, cameraX, cameraY)
{
    
    var positionX = (cameraX * background.factorX) + background.offsetX
    var positionY = (cameraY * background.factorY) + background.offsetY
    
    layer_x(background.layerCurrent, positionX)
    layer_y(background.layerCurrent, positionY)
    
    return
}