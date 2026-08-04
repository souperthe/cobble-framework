if !instance_exists(baddieInstance)
{
    instance_destroy()
    exit
}


x = baddieInstance.x
y = baddieInstance.y
image_xscale = baddieInstance.image_xscale


var playerTouching = instance_place(x, y, obj_player)
var baddieTouching = instance_place(x, y, obj_baddie)

if baddieTouching != noone && baddieTouching != baddieInstance
{
    
    if baddieTouching.stateCurrent == BaddieStates.THROWN
    {   
        baddieInstance.killedFromX = baddieTouching.x
        baddieInstance.killedFromY = baddieTouching.y
        instance_destroy(baddieInstance)
        instance_destroy(baddieTouching)
        exit
    }
    
}

if playerTouching == noone
    exit


if array_contains(playerInstaKillStates, playerTouching.stateCurrentEnum)
{
    scr_baddie_instakill(playerTouching, baddieInstance)
    exit
}

if place_meeting(x - playerTouching.scaleX, y, playerTouching) && playerTouching.stateCurrentEnum == PlayerStates.SUPLEXDASH
{
    playerTouching.grabbedBaddie = baddieInstance
    playerTouching.stateSwitch(PlayerStates.HAULING)
    baddieInstance.grabbedBy = playerTouching
    baddieInstance.stateCurrent = BaddieStates.GRABBED
    exit
}

if place_meeting(x, y + 5, playerTouching) && playerTouching.stateCurrentEnum == PlayerStates.UPPERCUT && playerTouching.velocityY < 0
{
    scr_baddie_instakill(playerTouching, baddieInstance)
    exit
}