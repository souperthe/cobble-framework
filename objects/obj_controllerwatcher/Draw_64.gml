if !pause
{
    exit
}

var hudWidth = obj_screensizer.hudWidth
var hudHeight = obj_screensizer.hudHeight

draw_set_colour(c_black)
draw_rectangle(0, 0, hudWidth, hudHeight, false)
draw_set_alpha(1)
draw_set_colour(c_white)

var gamepadsLostLength = array_length(gamepadsLost)

var centerX = hudWidth / 2
var centerY = hudHeight / 2

var textStartY = centerY - 100

draw_set_font(global.fontSmall)
draw_set_halign(fa_center)
draw_set_valign(fa_center)

var controllerOffset = 140

draw_sprite(spr_controller, 0, controllerOffset, centerY)
draw_sprite(spr_controller, 0, hudWidth - controllerOffset, centerY)


for (var index = 0; index < gamepadsLostLength; index++)
{
    var gamepadIndex = gamepadsLost[index]
    var text = "CONTROLLER " + string(gamepadIndex) + " DISCONNECTED"
    var textY = textStartY + (index * 10)
    draw_text(centerX, textY, text)
    continue
}


draw_text(centerX, centerY + 100, "PRESS START TO CONTINUE")