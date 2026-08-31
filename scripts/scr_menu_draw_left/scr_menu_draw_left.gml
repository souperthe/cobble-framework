/// @param {Struct.Menu} menu
/// @self obj_option
function scr_menu_draw_left(menu)
{
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
    
    var guiWidth = obj_screensizer.hudWidth
    var guiHeight = obj_screensizer.hudHeight
    
    var menuOptions = menu.options
    var menuOptionsLength = array_length(menuOptions)
    var menuOptionsSize = (string_height("A") * menuOptionsLength) + (menuOptionsLength * menu.padY)
    var menuPad = 150

    var centerX = guiWidth / 2;
    var centerY = (guiHeight / 2) - (menuOptionsSize / 4);
    var centerYPlus = 0;
    
    static optionDraws = scr_menu_option_draws()
    

    for (var index = 0; index < menuOptionsLength; index++)
    {
        draw_set_halign(fa_left)
        
        var option = menuOptions[index]
        var optionColor = c_white
        var optionY = centerY + (menu.padY * index) + centerYPlus
        var newLine = false
        
        if option.name == "back"
            newLine = true
        
        if index != optionCurrent
            optionColor = c_gray
        
        var optionDraw = optionDraws[option.type]
        
        optionDraw(menu, option, optionY, optionColor)
        
        if newLine
            centerYPlus += 16
        
        continue
    }

    return
}


function scr_menu_option_draws()
{
    var draws = []
    
    draws[OptionType.PRESS] = scr_menu_draw_option_press
    draws[OptionType.SLIDE] = scr_menu_draw_option_slide
    draws[OptionType.TOGGLE] = scr_menu_draw_option_toggle
    
    return draws
}