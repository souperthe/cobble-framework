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


if baddieInstance.invincibleTimer > 0
    exit

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

if playerTouching.grabbedBaddie == baddieInstance
    exit


if array_contains(playerInstaKillStates, playerTouching.stateCurrentEnum)
{
    scr_baddie_instakill(playerTouching, baddieInstance)
    exit
}

if array_contains(playerBumpStates, playerTouching.stateCurrentEnum)
{
    baddieInstance.stateCurrent = BaddieStates.STAGGERED
    baddieInstance.staggeredTimer = 200
    baddieInstance.velocityX = playerTouching.velocityX
    baddieInstance.velocityY = -5
    baddieInstance.sprite_index = baddieInstance.spriteStun
    baddieInstance.scaleX = -playerTouching.scaleX
    baddieInstance.bumpScaleX = 0.6
    baddieInstance.bumpScaleY = 1.4
    baddieInstance.staggeredTimer = 200
    baddieInstance.invincibleTimer = 30
    super_sound_oneshot_emitter_list(
        baddieInstance.emitter, 
        [sfx_mach2bump_1, sfx_mach2bump_2, sfx_mach2bump_3, sfx_mach2bump_4],
        random_pitch()
        )
    obj_camera.shake(2, 2)
    exit
}

if place_meeting(x - playerTouching.scaleX, y, playerTouching) && playerTouching.stateCurrentEnum == PlayerStates.SUPLEXDASH
{
    playerTouching.grabbedBaddie = baddieInstance
    baddieInstance.grabbedBy = playerTouching
    
    if check_input("up", true)
    {
        playerTouching.stateSwitch(PlayerStates.PILEDRIVER, "frommovespeed")
        baddieInstance.stateCurrent = BaddieStates.GRABBED
        exit
    }
    
    playerTouching.stateSwitch(PlayerStates.HAULING)
    baddieInstance.stateCurrent = BaddieStates.GRABBED
    exit
}

if place_meeting(x, y + 5, playerTouching) && playerTouching.stateCurrentEnum == PlayerStates.UPPERCUT && playerTouching.velocityY < 0
{
    scr_baddie_instakill(playerTouching, baddieInstance)
    exit
}

if place_meeting(x, y - 5, playerTouching) && playerTouching.stateCurrentEnum == PlayerStates.CHAINSAWPOGO && !playerTouching.grounded
{
    scr_baddie_instakill(playerTouching, baddieInstance)
    playerTouching.velocityY = -12
    playerTouching.sprite_index = playerTouching.spriteGet("chainsaw_pogobounce")
    super_sound_oneshot_emitter(playerTouching.emitter, sfx_killingblow, random_pitch())
    exit
}