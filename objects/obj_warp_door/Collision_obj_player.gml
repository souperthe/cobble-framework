playerTouching = other

if !playerCanEnter(playerTouching)
    exit

if !check_input("up", false)
    exit


global.warpDoor = targetDoor
global.warpRoom = targetRoom
playerTouching.stateSwitch(PlayerStates.DOOR, "enter")
audio_play_sound(sfx_door, 0, false)

instance_create_depth(x, y, -999, obj_room_warp)