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

var thresholdY = 4
var thresholdX = 8


if touchingPlayer.stateCurrentEnum == PlayerStates.MACH3
{
    thresholdY = 10
    thresholdX = 18
}

if !array_contains(stateWhitelist, touchingPlayer.stateCurrentEnum)
{
    exit
}

touchingPlayer.velocityY = -12
touchingPlayer.moveSpeed = 14
touchingPlayer.stateSwitch(PlayerStates.TRICKJUMP)
used = true