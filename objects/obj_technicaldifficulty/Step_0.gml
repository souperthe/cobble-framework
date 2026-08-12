staticIndex += 0.35 * staticDirection
global.comboTimePause = 1

if staticUse
{
    
    if staticDirection > 0 && floor(staticIndex) == sprite_get_number(staticSprite) - 1
    {
        staticUse = false
    }
    else if (staticDirection < 0 && staticIndex <= 0)
    {
        instance_destroy()
    }
        
}