
if fadeAlpha > fadeMax
{
    fadeIn = 1
    
    if room != global.warpRoom
    {
        room_goto(global.warpRoom)
    }
}

fadeAlpha += (!fadeIn ? fadeAdd : -fadeAdd)

if fadeIn && fadeAlpha < 0
    instance_destroy()