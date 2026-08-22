titleIndex += 0.35;

if (titleIndex >= 2)
    titleIndex = frac(titleIndex);

if titleDelete
{
    titleAlpha = approach(titleAlpha, 0, 0.05)
    titleOffset = approach(titleOffset, 30, 0.7)
    
    if titleAlpha == 0
        instance_destroy()
    
    exit
}

titleSize = approach(titleSize, 1, 0.4)
titleShake = approach(titleShake, 0, 0.6)