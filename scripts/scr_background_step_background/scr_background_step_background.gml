/// @param {Struct.Background} background
/// @param {Real} cameraX
/// @param {Real} cameraY
function scr_background_step_background(background, cameraX, cameraY)
{
    
    var targetX = background.offsetX + (cameraX * background.factorX)
    var targetY = background.offsetY + (cameraY * background.factorX)
    
    layer_x(background.layerCurrent, targetX)
    layer_y(background.layerCurrent, targetY)

    return
}