var tvX = obj_screensizer.hudWidth - 115
var tvY = 80

if stateCurrent != TvStates.enter
{
    draw_sprite(spr_tv_bgfinal, tvBackroundFrame, tvX, tvY)
    draw_sprite(tvExpressionSprite, tvExpressionSpriteFrame, tvX, tvY)
}

if tvClipTransparency > 0
{
    var roundedTransparency = round(tvClipTransparency * 10) / 10
    draw_sprite_ext(spr_tv_clip, 0, tvX, tvY, 1, 1, 0, c_white, roundedTransparency)
}

draw_sprite(sprite_index, image_index, tvX, tvY)