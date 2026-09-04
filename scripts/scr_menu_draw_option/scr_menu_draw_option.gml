
/// @param {Struct.Menu} menu
/// @param {Struct.OptionToggle} option
/// @param {Real} optionY
/// @param {Real | Constant.Color} color
function scr_menu_draw_option_toggle(menu, option, optionY, color, rightMargin)
{
    var guiWidth = obj_screensizer.hudWidth
    
    draw_set_halign(fa_right)
    
    draw_sprite_ext(spr_toggle, 0, guiWidth - menu.padX, optionY, 1, 1, 0, color, 1)
    
    if option.value == true
        draw_sprite(spr_toggle_check, 0, guiWidth - menu.padX, optionY)
    return
}

/// @param {Struct.Menu} menu
/// @param {Struct.OptionSlider} option
/// @param {Real} optionY
/// @param {Real | Constant.Color} color
function scr_menu_draw_option_slide(menu, option, optionY, color)
{ 
    
    var guiWidth = obj_screensizer.hudWidth
    
    var slideWidth = 200
    var slideHeight = 5
    
    
    var fillWidth = slideWidth * (option.value / 100)
       
    var sliderX = guiWidth - menu.padX - slideWidth
    var sliderY = optionY
    var sliderSprite = spr_slider_icon_normal
    var sliderIndex = 0
    
    var shakeRange = 1
    var shakeX = 0
    var shakeY = 0
    
    if menu.type == MenuType.AUDIO
    {
        sliderSprite = spr_slider_icon_scream
        
        if option.moving && option.value > 0
        {
            sliderIndex = 1
            shakeX = random_range(-shakeRange, shakeRange)
            shakeY = random_range(-shakeRange, shakeRange)
        }
        
    }
    
    
    var handleX = sliderX + fillWidth + shakeX
    var handleY = sliderY + shakeY
    
    draw_sprite_ext(spr_slider, 0, sliderX, sliderY, 1, 1, 0, color, 1)
    
    draw_sprite(sliderSprite, sliderIndex, handleX, handleY)
    
    var optionName = string_upper(option.name)
    
    return
}

/// @param {Struct.Menu} menu
/// @param {Struct.OptionSlider} option
/// @param {Real} optionY
/// @param {Real | Constant.Color} color
function scr_menu_draw_option_press(menu, option, optionY, color)
{

    
    return
}