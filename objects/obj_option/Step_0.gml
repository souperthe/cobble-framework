backgroundX--
backgroundY--

for (var index = 0; index < optionIconNamesLength; index++)
{
    var optionIconName = optionIconNames[index]
    var optionIcon = optionIcons[$ optionIconName]
    var alphaTarget = 0
    
    if optionIconHighlight == optionIcon
    {
        var shakeRange = 1
        
        optionIcon.shakeX = random_range(-shakeRange, shakeRange)
        optionIcon.shakeY = random_range(-shakeRange, shakeRange)
        
        alphaTarget = 1
    }
    else
    {
        optionIcon.shakeX = 0
        optionIcon.shakeY = 0
    }
    
    optionIcon.alpha = approach(optionIcon.alpha, alphaTarget, 0.2)
    continue
}

