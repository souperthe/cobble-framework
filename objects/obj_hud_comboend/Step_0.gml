titleIndex += 0.35;

if (titleIndex >= 2)
    titleIndex = frac(titleIndex);


if comboDelete
{
    
    comboDeleteTime--
    
    if comboDeleteTime < 0
        instance_destroy()
    
}

var titleOffsetTarget = 0

if global.comboTime > 0
    titleOffsetTarget = 80

titleOffset = approach(titleOffset, titleOffsetTarget, 15)