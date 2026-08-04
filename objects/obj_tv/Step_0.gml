

tvExpressionSpriteFrame += tvExpressionSpriteSpeed
tvWhiteFade = approach(tvWhiteFade, 0, 0.1)

var stateFunction = stateLibrary[stateCurrent]

if is_undefined(stateFunction)
    exit

script_execute(stateFunction)