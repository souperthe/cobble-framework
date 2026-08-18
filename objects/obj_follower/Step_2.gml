if !introPerformed
{
    
    if sprite_index != spriteIntro
    {
        sprite_index = spriteIntro
        image_index = 0
    }
    
    if is_sprite_finished()
    {
        introPerformed = true
        sprite_index = spriteIdle
    }
    exit
}

if locked
    exit

if !instance_exists(playerFollowing)
    exit

followerDirection = lerp(followerDirection, followerObject.scaleX, 0.1)

var previousX = x

var targetOffsetX = round(offsetX * followerDirection)
var targetX = followerObject.x + targetOffsetX
var targetY = followerObject.y
var targetScaleX = followerObject.scaleX
var followData = {
    x : targetX,
    y : targetY,
    scaleX : targetScaleX
}

array_push(followHistory, followData)

if array_length(followHistory) > lagSteps
{
    
    var frame = array_shift(followHistory)
    
    if interp < 1
    {
        x = lerp(x, frame.x, interp)
        y = lerp(y, frame.y, interp)
        interp = approach(interp, 1, 0.01)
    }
    else 
    {
        x = frame.x
        y = frame.y
    }
    
    scaleX = frame.scaleX
}

var moveSpeed = point_distance(previousX, 0, x, 0)
var spriteIdleTarget = spriteIdle

moving = moveSpeed > 1

var movingBufferTarget = 0

if moving
    movingBufferTarget = 1

movingBuffer = approach(movingBuffer, movingBufferTarget, 0.3)

if global.panic
    spriteIdleTarget = spriteIdlePanic

if movingBuffer >= 0.5
    sprite_index = spriteMove
else
    sprite_index = spriteIdleTarget