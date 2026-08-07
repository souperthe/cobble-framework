var scoreX = 131 + random_range(-collectShake, collectShake)
var scoreY = 70 + random_range(-collectShake, collectShake)

draw_sprite(spr_pizzascore, 0, scoreX, scoreY)


draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_set_font(global.fontCollect)


var textTarget = collectVisual
var textLength = string_length(textTarget)
var textWidth = string_width(textTarget)

var textX = scoreX - (textWidth / 2)
var textY = scoreY

for (var index = 0; index < textLength; index++)
{
    var progress = (textLength > 1) ? (index / (textLength - 1)) : 0.5;
    var indexOffset = -5 + (5 * sin(progress * pi));
    var character = string_char_at(textTarget, index + 1)
    var characterX = floor(textX)
    var characterY = floor((scoreY - 56) + indexOffset)
    var characterOffset = 0
    
    if index >= 0 && index < array_length(collectOffsets)
    {
        characterOffset = collectOffsets[index]
    }
    
    draw_text(characterX, characterY - characterOffset, character)
    
    textX += textWidth / textLength
    continue
}


for (var index = 0; index < array_length(collectList); index++)
{
    
    var collect = collectList[index]
    
    draw_sprite(collect.spriteIndex, collect.imageIndex, collect.x, collect.y)
    continue
}
