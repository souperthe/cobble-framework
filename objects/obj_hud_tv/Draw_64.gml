tvX = obj_screensizer.hudWidth - 115
tvY = 80 + tvYOffset


if stateCurrent != TvStates.enter && stateCurrent != TvStates.off
{
    draw_sprite(spr_tv_bgfinal, tvBackroundFrame, tvX, tvY)
    
    shader_set(global.shaderPalette)
    pal_swap_set(tvTargetPlayer.paletteSprite, tvTargetPlayer.paletteIndex)
    draw_sprite(tvExpressionSprite, tvExpressionSpriteFrame, tvX, tvY)
    shader_reset()
}

if tvWhiteFade > 0
{
    var roundedFade = round(tvWhiteFade * 10) / 10
    draw_sprite_ext(spr_tv_clip, 0, tvX, tvY, 1, 1, 0, c_white, roundedFade)
}

shader_set(global.shaderPalette)
pal_swap_set(spr_tv_palette, paletteIndex)
draw_sprite(sprite_index, image_index, tvX, tvY)
shader_reset()