if targetDoor == ""
    exit

if instance_exists(obj_room_warp)
    exit

visited = true

global.warpDoor = targetDoor
global.warpRoom = targetRoom
global.warpBox = false
global.warpHallway = true
global.warpHallwayDirection = image_xscale

instance_create_depth(x, y, -999999, obj_room_warp)
super_sound_oneshot_global(sfx_door)