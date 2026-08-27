if paused
{
    if sprite_exists(pauseSprite)
    {
        draw_sprite_stretched(pauseSprite, 0, 0, 0, obj_screensizer.hudWidth, obj_screensizer.hudHeight)
    }
    
    if sprite_exists(pauseSpriteGui) && pauseSpriteGuiAlpha > 0
    {
        draw_sprite_stretched_ext(pauseSpriteGui, 0, 0, 0, obj_screensizer.hudWidth, obj_screensizer.hudHeight, c_white, pauseSpriteGuiAlpha)
    }
    
}

if pauseOverlayAlpha == 0
{
    exit
}

draw_set_alpha(pauseOverlayAlpha - 0.5)
draw_set_colour(c_white)
draw_rectangle(0, 0, obj_screensizer.hudWidth, obj_screensizer.hudHeight, false)
draw_set_alpha(1)


var guiWidth = display_get_gui_width()
var guiHeight = display_get_gui_height()

var vineY = -117 + (117 * pauseOverlayAlpha)

draw_sprite(spr_pause_vine, 0, guiWidth / 2, vineY)

var borderSprite = spr_pause_border
var borderWidth = sprite_get_width(borderSprite)
var borderHeight = sprite_get_height(borderSprite)

var borderOffsetX = borderWidth * (1 - pauseDecorModifier)
var borderOffsetY = borderHeight * (1 - pauseDecorModifier)

var borderRightX = guiWidth + borderOffsetX
var borderLeftX = 0 - borderOffsetX
var borderY = guiHeight + borderOffsetY

draw_sprite_ext(borderSprite, 0, borderRightX, borderY, 1, 1, 0, c_white, 1)
draw_sprite_ext(borderSprite, 0, borderLeftX, borderY, -1, 1, 0, c_white, 1)

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(global.fontBig)

var pauseOptionsLength = array_length(pauseOptionNames)

var startX = guiWidth / 2
var startY = guiHeight / 2

var optionSpacing = 52
var optionsHeight = (pauseOptionsLength - 1) * optionSpacing


for (var index = 0; index < pauseOptionsLength; index++)
{
    var optionName = pauseOptionNames[index]
    var optionData = pauseOptionsData[$ optionName]
    var optionIcon = pauseOptionsIcons[$ optionName]
    
    var optionY = (startY - (optionsHeight / 2)) + (index * optionSpacing)
    var optionColor = c_white
    
    optionName = string_upper(optionName)
    
    var optionNameWidth = string_width(optionName)
    
    if index != pauseOptionSelected
        optionColor = c_gray
    else if paused
    {
        cursorTargetX = startX - (optionNameWidth / 2) - 30
        cursorTargetY = optionY
        
        iconCurrent = optionIcon
        
        if iconLast != iconCurrent
        {
            iconLast = iconCurrent
            iconScale = 1.2
            iconShake = 3
        }
        
        var iconX = startX + (optionNameWidth / 2) + 55 + random_range(-iconShake, iconShake)
        var iconY = (optionY - 4) + random_range(-iconShake, iconShake)
        draw_sprite_ext(spr_pause_icons, iconCurrent, iconX, iconY * optionData.positionModifer, iconScale, iconScale, 0, c_white, optionData.alpha)
    }
    
    draw_text_colour(startX, optionY * optionData.positionModifer, optionName, optionColor, optionColor, optionColor, optionColor, optionData.alpha)
    continue
}

draw_sprite_ext(spr_pause_pizzaangle, cursorIndex, cursorX, cursorY, 1, 1, 0, c_white, pauseOverlayAlpha)
