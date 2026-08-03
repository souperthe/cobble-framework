
var stateFunction = stateLibrary[stateCurrent]

tvExpressionSpriteFrame += tvExpressionSpriteSpeed
tvClipTransparency = approach(tvClipTransparency, 0, 0.08)

if is_undefined(stateFunction)
    exit

script_execute(stateFunction)