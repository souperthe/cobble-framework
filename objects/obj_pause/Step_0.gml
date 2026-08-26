var pauseOverlayAlphaTarget = 0
var pauseStep = 0.1

if paused
    pauseOverlayAlphaTarget = 1

pauseOverlayAlpha = lerp(pauseOverlayAlpha, pauseOverlayAlphaTarget, pauseStep)

var decorStep = 0.1

if !paused
    decorStep = 0.02


pauseDecorModifier = lerp(pauseDecorModifier, pauseOverlayAlphaTarget, decorStep)

if pauseOverlayAlpha == 0
{
    exit
}

iconScale = approach(iconScale, 1, 0.35)
iconShake = approach(iconShake, 0, 0.1)
cursorIndex += 0.35

pauseSpriteGuiAlpha = approach(pauseSpriteGuiAlpha, 0, 0.05)

var cursorStep = 0.1
cursorX = lerp(cursorX, cursorTargetX, cursorStep)
cursorY = lerp(cursorY, cursorTargetY, cursorStep)


var pauseOptionsLength = array_length(pauseOptionNames)

for (var index = 0; index < pauseOptionsLength; index++)
{
    var optionName = pauseOptionNames[index]
    
    if !struct_exists(pauseOptionsData, optionName)
    {
        continue
    }
    
    var optionData = pauseOptionsData[$ optionName]
    
    if !paused
    {
        optionData.alpha = approach(optionData.alpha, 0, 0.04)
    }
    
    if optionData.positionTimer > 0
    {
        optionData.positionTimer--
        continue
    }
    
    
    var targetDip = 0.95
    var targetRest = 1
    
    if paused
    {
        var targetAlpha = 1
        var targetAlphaStep = 0.05
        optionData.alpha = approach(optionData.alpha, targetAlpha, targetAlphaStep)
    }
    
    
    if !paused
    {
        optionData.positionModifer = approach(optionData.positionModifer, -5, 0.1)
        continue
    }
    
    
    
    if !optionData.dipped
    {
        optionData.positionModifer = approach(optionData.positionModifer, targetDip, 0.2)
        
        
        if optionData.positionModifer == targetDip
            optionData.dipped = true
    }
    else
    {
        optionData.positionModifer = lerp(optionData.positionModifer, targetRest, 0.1)
    }
    continue
}



