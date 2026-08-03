
var stateFunction = stateLibrary[stateCurrent]

tvExpressionSpriteFrame += tvExpressionSpriteSpeed
tvWhiteFade = approach(tvWhiteFade, 0, 0.1)

if is_undefined(stateFunction)
    exit

script_execute(stateFunction)