if !instance_exists(baddieInstance)
{
    instance_destroy()
    exit
}


x = baddieInstance.x
y = baddieInstance.y
image_xscale = baddieInstance.image_xscale


var playerTouching = instance_place(x, y, obj_player)

if playerTouching == noone
    exit


if array_contains(playerInstaKillStates, playerTouching.stateCurrentEnum)
{
    //baddieInstance.killedFromX = playerTouching.x
    //baddieInstance.killedFromY = playerTouching.y
    //instance_destroy(baddieInstance)
    
    scr_baddie_instakill(playerTouching, baddieInstance)
    exit
}