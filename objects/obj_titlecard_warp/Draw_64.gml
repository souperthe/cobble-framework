if start
{

    var shake = 1
    var shakeX = random_range(-shake, shake)
    var shakeY = random_range(-shake, shake)
    
    draw_sprite_stretched(spr_titlecard_backround, global.levelCurrent.titleIndex, 0, 0, obj_screensizer.hudWidth, obj_screensizer.hudHeight)
    draw_sprite_stretched(spr_titlecard_title, global.levelCurrent.titleIndex, shakeX, shakeY, obj_screensizer.hudWidth, obj_screensizer.hudHeight)
    
    if fadeOut
    {
        draw_set_alpha(fadeOutAlpha)
        draw_set_colour(c_black)
        draw_rectangle(0, 0, obj_screensizer.hudWidth, obj_screensizer.hudHeight, false)
        draw_set_alpha(1) 
        draw_set_colour(c_white)
    }
    
    
}

draw_set_alpha(fadeAlpha)
draw_set_colour(c_black)
draw_rectangle(0, 0, obj_screensizer.hudWidth, obj_screensizer.hudHeight, false)
draw_set_alpha(1)
draw_set_colour(c_white)