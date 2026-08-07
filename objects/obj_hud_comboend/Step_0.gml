titleIndex += 0.35;

if (titleIndex >= 2)
    titleIndex = frac(titleIndex);


if comboDelete
{
    
    comboDeleteTime--
    
    
}

if comboDeleteTime < 0
{
    alpha = approach(alpha, 0, 0.05)
    
    if alpha == 0
        instance_destroy()
}
else {
	alpha = approach(alpha, 1, 0.2)
}

var titleOffsetTarget = 0

if global.comboTime > 0
    titleOffsetTarget = 80

titleOffset = lerp(titleOffset, titleOffsetTarget, 0.05)