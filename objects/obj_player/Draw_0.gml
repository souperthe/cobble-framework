draw_sprite_ext(sprite_index, image_index, x, y, scaleX, scaleY, angle, c_white, 1)



var debugString = "movespeed: " + string(moveSpeed) + "\n" + "state: " + string(stateCurrent.stateName)
draw_set_colour(c_white)
draw_set_halign(fa_center)
draw_set_valign(fa_bottom)
draw_text(x, y - 50, debugString)