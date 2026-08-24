var touchOffsetY = 16
var touchingPlayer = instance_place(x, y - touchOffsetY, obj_player)

if !touchingPlayer
{
    exit
}

if touchingPlayer.scaleX != sign(image_xscale)
{
    exit
}

var thresholdY = 1

if touchingPlayer.moveSpeed < 11
{
    exit
}



if !array_contains(stateWhitelist, touchingPlayer.stateCurrentEnum)
{
    exit
}

if touchingPlayer.y > y + thresholdY
{
    exit
}

if !place_meeting(x, y - touchOffsetY, touchingPlayer)
{
    return
}

var playerGhost = scr_effect_create("playerghost", touchingPlayer.x, touchingPlayer.y)
playerGhost.scaleX = touchingPlayer.scaleX

touchingPlayer.velocityY = -12
touchingPlayer.moveSpeed = 14
touchingPlayer.stateSwitch(PlayerStates.TRICKJUMP)
used = true