
/// @self obj_baddie
function scr_baddie_create()
{
    stateCurrent = BaddieStates.WALK
    stateLibrary = []
    killedFromX = 0
    killedFromY = 0
    boundingBox = instance_create_depth(x, y, depth, obj_baddie_box)
    boundingBox.sprite_index = sprite_index
    boundingBox.mask_index = sprite_index
    boundingBox.baddieInstance = id
    moveAndCollide = true
    turnAllow = false
    turnTimer = 0
    turnTimerMax = 200
    turnForce = false
    turnBuffer = 0
    moveSpeed = 1
    
    spriteDead = spr_baddie
    spriteTurn = -1
    spriteIdle = spr_baddie
    spriteStun = spr_baddie
    spriteWalk = spr_baddie
    spriteGrabbed = spr_baddie
    spriteScared = spr_baddie
    
    onScreen = false
    
    scaleX = 1
    scaleY = 1
    angle = 0
    
    stunX = 0
    stunY = 0
    
    grabbedBy = obj_player
    return
}

/// @self obj_baddie
function scr_baddie_define_states()
{
    stateLibrary[BaddieStates.WALK] = scr_baddie_state_walk
    stateLibrary[BaddieStates.TURN] = scr_baddie_state_turn
    stateLibrary[BaddieStates.STUN] = scr_baddie_state_stun
    stateLibrary[BaddieStates.GRABBED] = scr_baddie_state_grabbed
    return
}

/// @self obj_baddie
function scr_baddie_step()
{
    var stateFunction = stateLibrary[stateCurrent]

    if !is_undefined(stateFunction)
    {
        stateFunction()
    }
    
    return
}


function scr_get_hit_animations()
{
    
    var hitAnimations = array_create(PlayerStates._length, "")
    
    hitAnimations[PlayerStates.MACH3] = "mach3hit"
    
    return hitAnimations
}


/// @param {Asset.GMObject} player
/// @param {Asset.GMObject} baddie
function scr_baddie_instakill(player, baddie)
{
    
    super_sound_oneshot_emitter(player.emitter, sfx_punch, random_pitch())
    
    instance_destroy(baddie.boundingBox)
    baddie.stateCurrent = BaddieStates.STUN
    baddie.stunX = baddie.x
    baddie.stunY = baddie.y
    baddie.moveAndCollide = false
    baddie.killedFromX = player.x
    baddie.killedFromY = player.y
        
    player.tauntState = player.stateCurrentEnum
    player.tauntVelocityX = player.velocityX
    player.tauntVelocityY = player.velocityY
    player.tauntImageSpeed = player.image_speed
    player.tauntSprite = player.sprite_index
    player.tauntImageIndex = player.image_index
    player.stateCurrent = player.stateLibrary[PlayerStates.HITSUN]
    player.stateCurrentEnum = PlayerStates.HITSUN
    player.hitstunX = player.x
    player.hitstunY = player.y
    player.hitstunTime = 3
    player.hitstunBaddie = baddie
    
        
    var hitAnimations = scr_get_hit_animations()
    var hitSprite = hitAnimations[player.tauntState]
    
    if hitSprite != ""
    {
        player.sprite_index = player.spriteGet(hitSprite)
        player.image_index = 0
        player.image_speed = 0.7
    }
    
    
    return
}