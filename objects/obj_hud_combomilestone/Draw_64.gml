var title = floor(combo / 2)
var titleX = obj_hud_tv.tvX
var titleY = (obj_hud_tv.tvY + 148) + titleOffset
var titleVery = 0
var titleLength = sprite_get_number(spr_comboend_title1)


if (title > titleLength / 2)
{
    title -= titleLength / 2
    titleVery += 1
}

titleVery += combo div 80

for (var index = titleVery - 1; index >= 0; index--)
{
    
    var veryOffsetX = 65 + ((index * 15) * titleSize)
    var veryOffsetY = 6 + ((index * 15) * titleSize)
    draw_sprite_ext(
        spr_combovery, 
        0, 
        (titleX + titleGetShake()) - veryOffsetX,
        (titleY + titleGetShake()) - veryOffsetY,
        titleSize,
        titleSize,
        0,
        c_white,
        titleAlpha
    )
    continue
}

draw_sprite_ext(
    spr_comboend_title1, 
    (title * 2) + titleIndex, 
    titleX + titleGetShake(), 
    titleY + titleGetShake(), 
    titleSize, 
    titleSize, 
    0, 
    c_white, 
    titleAlpha
)