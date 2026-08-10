image_speed = 0.35
depth = 1

spriteWidth = sprite_get_width(sprite_index)
spriteHeight = sprite_get_height(sprite_index)
startScaleX = 0
startScaleY = 0

/// @param {Real} indexX
/// @param {Real} indexY
spriteDraw = function(indexX, indexY)
{
    var spriteX = xstart + (indexX * spriteWidth)
    var spriteY = ystart + (indexY * spriteHeight)
    
    draw_sprite(sprite_index, image_index, spriteX, spriteY)
    return
}
