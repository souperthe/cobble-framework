var comboX = (obj_hud_tv.tvX + comboPositionX)
var comboY = (obj_hud_tv.tvY + 117 + comboPositionY)
var minX = comboX - 56
var maxX = comboX + 59
var minDiffrence = (maxX - minX)
var comboPercentage = global.comboTime / global.comboTimeMax
var comboFillXTarget = minX + (minDiffrence * comboPercentage)

comboFillY = comboY
comboFillX = lerp(comboFillX, comboFillXTarget, 0.5)

if comboY < obj_hud_tv.tvY + 10
{
    comboLostVisual = global.comboDropped
    exit
}

shader_set(global.shaderPalette)

var fillColorIndex = 2

if comboLostVisual
    fillColorIndex = 1

pal_swap_set(spr_tv_combofillpalette, fillColorIndex)
draw_sprite(spr_tv_combobubblefill, comboFillIndex, comboFillX + comboShakeGet(), comboFillY + comboShakeGet())

shader_reset()

shader_set(global.shaderPalette)
pal_swap_set(spr_tv_combopalette, comboPaletteIndex)

var comboRealX = comboX + comboShakeGet()
var comboRealY = comboY + comboShakeGet()

draw_sprite(spr_tv_combobubble, 0, comboRealX, comboRealY)

draw_set_font(global.fontCombo)
draw_set_halign(fa_left)
draw_set_valign(fa_top)


var comboTextX = comboRealX - 64
var comboTextY = comboRealY - 12
var comboTextLength = string_length(comboVisual)

for (var index = comboTextLength; index > 0; index--)
{
    var character = string_char_at(comboVisual, index)
    var characterWidth = string_width(character)
    var characterHeight = string_height(character)
    var characterScale = comboCharacterScales[index - 1]
    var characterScaleFloored = round(characterScale * 10) / 10
    
    var offsetX = (characterWidth * (1 - characterScale)) / 2
    var offsetY = (characterHeight * (1 - characterScale)) / 2
    var drawX = (comboTextX) + offsetX
    var drawY = (comboTextY) + offsetY
    
    draw_text_transformed(drawX, drawY, character, characterScaleFloored, characterScaleFloored, 0)
    
    comboTextX -= 22
    comboTextY -= 8
    continue
}

shader_reset()
