
/// @self obj_baddie
function scr_baddie_create()
{
    stateCurrent = BaddieStates.WALK
    stateLibrary = []
    killedFromX = 0
    killedFromY = 0
    
    boundingBox = undefined
    
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
    
    bumpScaleXTarget = scaleX
    bumpScaleYTarget = scaleY
    bumpScaleX = 1
    bumpScaleY = 1
    
    stunX = 0
    stunY = 0
    
    grabbedBy = obj_player
    emitter = super_sound_create_emitter()
    
    screamSound = -1
    screamTimer = 0
    
    staggeredTimer = 0
    
    invincibleTimer = 0
    return
}

/// @self obj_baddie
function scr_baddie_create_bounding_box()
{
    boundingBox = instance_create_depth(x, y, depth, obj_baddie_box)
    boundingBox.sprite_index = sprite_index
    boundingBox.mask_index = sprite_index
    boundingBox.image_speed = 0
    boundingBox.baddieInstance = id
    boundingBox.depth = id.depth - 1
    return
}

/// @self obj_baddie
function scr_baddie_define_states()
{
    stateLibrary[BaddieStates.WALK] = scr_baddie_state_walk
    stateLibrary[BaddieStates.TURN] = scr_baddie_state_turn
    stateLibrary[BaddieStates.STUN] = scr_baddie_state_stun
    stateLibrary[BaddieStates.GRABBED] = scr_baddie_state_grabbed
    stateLibrary[BaddieStates.THROWN] = scr_baddie_state_thrown
    stateLibrary[BaddieStates.SCREAM] = scr_baddie_state_scream
    stateLibrary[BaddieStates.STAGGERED] = scr_baddie_state_staggered
    
    return
}

/// @self obj_baddie
function scr_baddie_step()
{
    var stateFunction = stateLibrary[stateCurrent]
    audio_emitter_position(emitter, x, y, 0)

    if !is_undefined(stateFunction)
    {
        stateFunction()
    }
    
    var alpha = 0.08
    
    bumpScaleX = lerp(bumpScaleX, bumpScaleXTarget, alpha)
    bumpScaleY = lerp(bumpScaleY, bumpScaleYTarget, alpha)
    
    invincibleTimer--
    
    if boundingBox == undefined
        scr_baddie_create_bounding_box()
    
    return
}

/// @self obj_baddie
function scr_baddie_scream(player)
{
    stateCurrent = BaddieStates.SCREAM
    velocityY = -5
    velocityX = 0
    scaleX = -sign(x - player.x);
    sprite_index = spriteScared
    image_index = 0
    
    screamTimer = 100
    
    var screams = [sfx_enemyscream1, sfx_enemyscream2]
    
    if (irandom(100) <= 5)
        screamSound = super_sound_oneshot_emitter_list(emitter, screams, random_pitch())
    return
}

/// @self obj_baddie
function scr_baddie_scream_check()
{
    
    
    var screamInstance = collision_circle(x, y, 400, obj_player, false, true)
    
    if screamInstance == noone
        return false
    
    
    var positionYDiffrence = abs(y - screamInstance.y)

    if positionYDiffrence > 100
        return false
    
    if screamInstance.stateCurrentEnum == PlayerStates.MACH3
    {
        scr_baddie_scream(screamInstance)
        return true
    }
    
    return false
}

/// @self obj_baddie
function scr_baddie_turn()
{
    if spriteTurn != -1
    {
        image_index = 0
        sprite_index = spriteTurn
        stateCurrent = BaddieStates.TURN
        return
    }
    
    scaleX = scaleX * -1
    image_xscale = scaleX
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
function scr_baddie_throw(player, baddie)
{
    instance_destroy(baddie.boundingBox)
    baddie.stateCurrent = BaddieStates.THROWN
    baddie.scaleX = -player.scaleX
    baddie.grav = 0
    
    var throwSpeed = 40
    
    if player.sprite_index == player.spriteGet("uppercutfinishingblow")
        baddie.velocityY = -throwSpeed
    else
        baddie.velocityX = player.scaleX * throwSpeed
    
    baddie.killedFromX = player.x
    baddie.killedFromY = player.y
    return
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