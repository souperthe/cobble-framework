/// @param {Struct.Background} background
/// @param {Real} cameraX
/// @param {Real} cameraY
function scr_background_step_zigzag(background, cameraX, cameraY)
{
    
    background.x += background.speedX
    background.y = wave(-background.speedY, background.speedY, 4, 10)
    
    layer_x(background.layerCurrent, (cameraX * background.factorX) + background.x + background.offsetX)
    layer_y(background.layerCurrent, (cameraY * background.factorY) + background.y + background.offsetY)

    return
}