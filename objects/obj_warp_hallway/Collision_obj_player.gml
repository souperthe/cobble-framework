if targetDoor == ""
    exit

if instance_exists(obj_room_warp)
    exit

global.warpDoor = targetDoor
global.warpRoom = targetRoom
global.warpHallway = true
global.warpHallwayDirection = image_xscale
visited = true
instance_create_depth(x, y, -999999, obj_room_warp)
super_sound_oneshot_global(sfx_door)