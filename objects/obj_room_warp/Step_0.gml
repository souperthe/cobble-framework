
if fadeAlpha > fadeMax
{
    fadeIn = 1
    
    global.roomPlaced = false
    
    if room != global.warpRoom
    {
        room_goto(global.warpRoom)
        global.signalWarped.fire()
        scr_room_changed()
    }
}

fadeAlpha += (!fadeIn ? fadeAdd : -fadeAdd)
global.comboTimePause = 1

if fadeIn && fadeAlpha < 0
    instance_destroy()