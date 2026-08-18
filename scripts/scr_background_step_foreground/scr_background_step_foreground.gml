/// @param {Struct.Background} background
/// @param {Real} cameraX
/// @param {Real} cameraY
function scr_background_step_foreground(background, cameraX, cameraY)
{
    
    background.scrollX += background.speedX
    background.scrollY += background.speedY
    
    var targetX = (cameraX * background.factorX) + background.offsetX + background.scrollX;
    var targetY = (cameraY * background.factorY) + background.offsetY + background.scrollY;
    
    layer_x(background.layerCurrent, targetX)
    layer_y(background.layerCurrent, targetY)

    return
}