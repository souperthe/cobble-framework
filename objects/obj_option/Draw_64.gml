var guiWidth = obj_screensizer.hudWidth
var guiHeight = obj_screensizer.hudHeight

draw_rectangle_colour(0, 0, guiWidth, guiHeight, 0, 0, 0, 0, false)

for (var index = 0; index < backgroundAlphaLength; index++)
{
    var backgroundAlphaCurrent = backgroundAlpha[index]
    
    if backgroundAlphaCurrent == 0
    {
        continue
    }
    
    draw_sprite_tiled_ext(spr_options_bg, index, backgroundX, backgroundY, 1, 1, c_white, backgroundAlphaCurrent)
    continue
}


draw_set_font(global.fontBig)
draw_set_colour(c_white)

var menu = menus[menuCurrent]
var menuDraw = menuDraws[menu.anchor]

if !is_undefined(menuDraw)
    menuDraw(menu)
