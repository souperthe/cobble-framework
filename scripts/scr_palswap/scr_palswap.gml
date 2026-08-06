function pal_swap_init()
{
    global.shaderPalette = shd_pal_swapper
    global.shaderPaletteTexelSize = shader_get_uniform(global.shaderPalette, "texel_size")
    global.shaderPaletteUVS = shader_get_uniform(global.shaderPalette, "palette_UVs")
    global.shaderPaletteIndex = shader_get_uniform(global.shaderPalette, "palette_index")
    global.shaderPaletteTexture = shader_get_sampler_index(global.shaderPalette, "palette_texture")
    return
}


/// @param {Asset.GMSprite} sprite
/// @param {Real} index
function pal_swap_set(sprite, index)
{
    var texture = sprite_get_texture(sprite, 0)
    var uvs = sprite_get_uvs(sprite, 0)
    
    texture_set_stage(global.shaderPaletteTexture, texture)
    gpu_set_texfilter_ext(global.shaderPaletteTexture, false)
    
    var texelX = texture_get_texel_width(texture)
    var texelY = texture_get_texel_height(texture)
    var texelMargin = 0.5
    var texelMarginX = texelX * texelMargin
    var texelMarginY = texelY * texelMargin
    
    shader_set_uniform_f(global.shaderPaletteTexelSize, texelX, texelY)
    shader_set_uniform_f(
        global.shaderPaletteUVS, 
        uvs[0] + texelMarginX,
        uvs[1] + texelMarginY,
        uvs[2] + texelMarginX,
        uvs[3] + texelMarginY
    )
    shader_set_uniform_f(global.shaderPaletteIndex, index)
    return
}