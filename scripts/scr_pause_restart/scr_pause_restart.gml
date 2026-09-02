function scr_pause_restart()
{
    obj_pause.pauseExit()
    obj_pause.paused = false
    
    scr_reset()
    
    global.levelEntering = false
    
    with obj_player
        stateSwitch(PlayerStates.ENTERLEVEL)
    
    global.warpDoor = "A"
    global.warpHallway = false
    global.warpBox = false
    global.warpVerticalHallway = false
    global.warpRoom = global.levelCurrent.roomFirst
    
    room_goto(global.warpRoom)

    return
}