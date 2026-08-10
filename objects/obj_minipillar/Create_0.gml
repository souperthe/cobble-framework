depth = 4
image_speed = 0.35
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


enable = function()
{
    x = xstart
    y = ystart
    image_xscale = startScaleX
    image_yscale = startScaleY
    sprite_index = spr_minipillar_woke
    return
}

disable = function()
{
    x = -800
    y = -800
    image_xscale = 0
    image_yscale = 0
    sprite_index = spr_minipillar_sleep
    return
}