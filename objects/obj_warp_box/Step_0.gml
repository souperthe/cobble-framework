if used
    exit;

var playerNearest = collision_circle(x, y, 400, obj_player, false, true)

if playerNearest == noone exit;


var validState = array_contains(statesDown, playerNearest.stateCurrentEnum)
var validStateForce = array_contains(statesDownForce, playerNearest.stateCurrentEnum)
var validInput = check_input("down", true) || validStateForce

var checkOffset = 1
var checkTouching = false
var boxDirection = "down"

if image_yscale == -1
{
    validState = array_contains(statesUp, playerNearest.stateCurrentEnum)
    validStateForce = array_contains(statesUpForce, playerNearest.stateCurrentEnum)
    validInput = check_input("up", true) || validStateForce
    checkOffset = -10
    boxDirection = "up"
}

with playerNearest
{
    checkTouching = place_meeting(x, y + checkOffset, other)
}

if !checkTouching
    exit;

if !validState
    exit

if !validInput
    exit;

trace(targetDoor)

global.warpDoor = targetDoor
global.warpHallway = false
global.warpBox = true
global.warpBoxDirection = boxDirection
global.warpRoom = targetRoom
global.warpObject = object_index

playerNearest.x = x

if boxDirection == "up"
    playerNearest.y = y + 24

playerNearest.stateSwitch(PlayerStates.DOOR, "pizzabox" + boxDirection)

used = true

depth = playerNearest.depth - 1

obj_camera.lock = true

super_sound_oneshot_emitter(playerNearest.emitter, sfx_box)