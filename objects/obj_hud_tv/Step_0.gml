if tvTargetPlayer == noone
{
    exit
}

var playerGuiPositionX = get_gui_position_x(tvTargetPlayer)
var playerGuiPositionY = get_gui_position_y(tvTargetPlayer)
var tvYOffsetTarget = 0
var tvYRadius = 120

if global.comboTime > 0
    tvYRadius = 220

if playerGuiPositionX > (obj_screensizer.hudWidth - 210) && playerGuiPositionY < tvYRadius
    tvYOffsetTarget = -300

tvYOffset = approach(tvYOffset, tvYOffsetTarget, 20)

tvExpressionSpriteFrame += tvExpressionSpriteSpeed
tvWhiteFade = approach(tvWhiteFade, 0, 0.1)

var stateFunction = stateLibrary[stateCurrent]

if is_undefined(stateFunction)
    exit

script_execute(stateFunction)