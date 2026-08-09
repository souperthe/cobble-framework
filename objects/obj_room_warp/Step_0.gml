
if fadeAlpha > fadeMax
{
    fadeIn = 1
    
    if room != global.warpRoom
    {
        room_goto(global.warpRoom)
        
        if global.levelEntering
            scr_level_enter(global.levelCurrent)
    }
}

fadeAlpha += (!fadeIn ? fadeAdd : -fadeAdd)

if fadeIn && fadeAlpha < 0
    instance_destroy()