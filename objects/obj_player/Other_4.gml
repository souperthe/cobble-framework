
var doorTarget = string_lower(global.warpDoor)

if doorTarget == "hub"
    exit

var doorObject = asset_get_index("obj_door_" + doorTarget)

if !instance_exists(doorObject)
    exit

var doorInstance = instance_find(doorObject, 0)
var doorOffsetX = get_door_offset_x()
var doorOffsetY = get_door_offset_y()

x = doorInstance.x + doorOffsetX
y = doorInstance.y + doorOffsetY

