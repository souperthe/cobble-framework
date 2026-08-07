var title = floor(titleCombo / 2)
var titleX = obj_hud_tv.tvX
var titleY = (obj_hud_tv.tvY + 148) + titleOffset
var titleVery = 0
 


if (title > (sprite_get_number(spr_comboend_title1) / 2))
{
    title -= (sprite_get_number(spr_comboend_title1) / 2);
    titleVery += 1
}

if titleCombo >= 80
    titleVery += 1

draw_set_alpha(alpha)
draw_sprite(spr_comboend, 0, titleX, titleY - 40)


for (var index = 0; index < titleVery; index++)
{
    draw_set_alpha(alpha)
    draw_sprite(
        spr_combovery, 
        0, 
        titleX - 65 - (index * 15),
        (titleY - 6) - (index * 15)
    )
    continue
}

draw_set_alpha(alpha)
draw_sprite(spr_comboend_title1, (title * 2) + titleIndex, titleX, titleY)

draw_set_font(global.fontSmall)
draw_set_alpha(alpha)
draw_set_halign(fa_center)
draw_set_valign(fa_top)
draw_text(titleX, titleY + 40, titleCombo);

draw_set_alpha(1)