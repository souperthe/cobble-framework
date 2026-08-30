
/// @param {Struct.Menu} menu
/// @self obj_option
function scr_menu_draw_center(menu)
{
    var guiWidth = obj_screensizer.hudWidth
    var guiHeight = obj_screensizer.hudHeight
    
    var menuOptions = menu.options
    var menuOptionsLength = array_length(menuOptions)
    var menuOptionsSize = (string_height("A") * menuOptionsLength) + (menuOptionsLength * menu.padY)
    var menuOptionsSizeHalf = menuOptionsSize / 2
    var menuPad = 150

    var centerX = guiWidth / 2
    var centerYReal = guiHeight / 2
    var centerY = centerYReal - (menuOptionsSize / 4)
    
    draw_set_halign(fa_center)
    draw_set_valign(fa_top)
    
    for (var index = 0; index < menuOptionsLength; index++)
    {
        var option = menuOptions[index]
        var optionColor = c_gray
        var optionAlpha = 1
        
        if index == optionCurrent
        {
            optionColor = c_white
        }
        
        if option.type == OptionType.HEADER 
            optionColor = c_white
        
        
        var optionText = string_upper(option.name)
        var optionTextWidth = string_width(optionText)
        var optionTextHeight = string_height(optionText)
        
        draw_text_colour_simple(centerX, centerY + (menu.padY * index), optionText, optionColor, optionAlpha)
        
        
        if menu.type == MenuType.OPTIONS
        {
            var icon = optionIcons[$ option.name]
            var iconX = centerX + (optionTextWidth / 2) + 50
            var iconY = centerY + (menu.padY * index) + (optionTextHeight / 2)
            var iconOffsetX = icon.offsetX + icon.shakeX
            var iconOffsetY = icon.offsetY + icon.shakeY
            
            if index == optionCurrent
                optionIconHighlight = icon
            
            draw_sprite_ext(
                icon.spriteIndex, 
                icon.spriteFrame, 
                iconX + iconOffsetX, 
                iconY + iconOffsetY, 
                1, 
                1, 
                0, 
                c_white,
                icon.alpha
            )
        }
        continue
    }

    return
}

/// @param {Struct.Menu} menu
/// @self obj_option
function scr_menu_draw_left(menu)
{
    var guiWidth = obj_screensizer.hudWidth
    var guiHeight = obj_screensizer.hudHeight
    
    var menuOptions = menu.options
    var menuOptionsLength = array_length(menuOptions)
    var menuOptionsSize = (string_height("A") * menuOptionsLength) + (menuOptionsLength * menu.padY)
    var menuPad = 150

    var centerX = guiHeight / 2
    var centerY = guiWidth / 2 - (menuOptionsSize / 4)

    return
}