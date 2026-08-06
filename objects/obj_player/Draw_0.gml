shader_set(global.shaderPalette)
pal_swap_set(paletteSprite, paletteIndex)
draw_sprite_ext(sprite_index, image_index, x, y, scaleX, scaleY, angle, c_white, 1)
shader_reset()



var debugData = {
    MOVESPEED : floor(moveSpeed),
    STATE : stateCurrent.stateName,
    SPRITE : sprite_get_name(sprite_index),
}
var debugString = ""
var debugDataKeys = struct_get_names(debugData)
var debugDataKeysLength = array_length(debugDataKeys)

for (var index = 0; index < debugDataKeysLength; index++)
{
    var key = debugDataKeys[index]
    var value = debugData[$ key]
    var stringKey = string(key)
    var stringValue = string(value)
    
    debugString = debugString + string_upper(stringKey) + " : " + string_upper(stringValue) + "\n"
    continue
}

draw_set_font(global.fontSmall)
draw_set_colour(c_white)
draw_set_halign(fa_center)
draw_set_valign(fa_bottom)
draw_text(x, y - 50, debugString)