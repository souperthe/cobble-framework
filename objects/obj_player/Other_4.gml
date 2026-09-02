
var doorTarget = string_lower(global.warpDoor)

if doorTarget == "hub"
    exit

var doorObject = asset_get_index("obj_door_" + doorTarget)

if !instance_exists(doorObject)
    exit

var doorInstance = instance_find(doorObject, 0)
var doorOffsetX = get_door_offset_x()
var doorOffsetY = get_door_offset_y()
var doorTargetX = doorInstance.x + doorOffsetX
var doorTargetY = doorInstance.y + doorOffsetY

switch global.warpObject
{
    case obj_warp_door:
        
        sprite_index = spriteGet("walkfront")
        image_index = 0
        
        break;
    case obj_warp_box:
        
        stateSwitch(PlayerStates.NORMAL)
        obj_camera.lock = false
        moveAndCollide = true
        
        break
}

x = doorTargetX
y = doorTargetY
global.roomStartX = doorTargetX
global.roomStartY = doorTargetY


signalPlacedAtDoor.fire()

global.warpObject = obj_null


var followerLength = array_length(followers)
for (var index = 0; index < followerLength; index++)
{
    var follower = followers[index]
    follower.x = x
    follower.y = y
    follower.followHistory = []
    follower.interp = 0
    continue
}

