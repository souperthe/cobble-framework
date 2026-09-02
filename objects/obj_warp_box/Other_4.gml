var doorNearest = collision_circle(x, y, 400, obj_door, false, true)

if doorNearest == noone
    exit;

targetDoor = get_door(doorNearest)