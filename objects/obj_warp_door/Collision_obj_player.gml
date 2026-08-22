playerTouching = other

if !playerCanEnter(playerTouching)
    exit

if !check_input("up", false)
    exit


global.warpDoor = targetDoor
global.warpRoom = targetRoom
global.warpHallway = false
playerTouching.stateSwitch(PlayerStates.DOOR, "enter")
super_sound_oneshot_global(sfx_door)

instance_create_depth(x, y, -999, obj_room_warp)