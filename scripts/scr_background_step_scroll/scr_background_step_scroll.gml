/// @param {Struct.Background} background
/// @param {Real} cameraX
/// @param {Real} cameraY
function scr_background_step_scroll(background, cameraX, cameraY)
{
    
    background.scrollX += background.speedX
    background.scrollY += background.speedY
    
    layer_x(background.layerCurrent, (cameraX * background.factorX) + background.scrollX + background.offsetX)
    layer_y(background.layerCurrent, (cameraY * background.factorY) + background.scrollY + background.offsetY)
    

    return
}