if paletteSprite == -1
{
    draw_self()
    exit
}

shader_set(global.shaderPalette)
pal_swap_set(paletteSprite, paletteIndex)
draw_self()
shader_reset()