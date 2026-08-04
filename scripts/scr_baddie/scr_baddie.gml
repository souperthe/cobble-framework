
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
    
    
    
    stateLibrary[BaddieStates.WALK] = function() 
    {
        
        velocityX = scaleX * moveSpeed
        
        
        if turnTimer > 0 && turnForce == true
            turnTimer--
        
        sprite_index = spriteWalk
        
        turnBuffer--
        
        if turnBuffer > 0
        {
            trace(turnBuffer)
            return
        }
        
        var touchingSolid = scr_solid(x + velocityX, y - 31)
        var touchingHallway = place_meeting(x + velocityX, y, obj_hallway)
        var touchingRoomRight = (x + velocityX) > (room_width + 50)
        var touchingRoomLeft = (x + velocityX < -50)
        var touching = touchingSolid || touchingHallway || touchingRoomRight || touchingRoomLeft
        var turnForced = turnTimer <= 0 && turnForce
        
        
        if !(touching || turnForced)
            return
        
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
    
    stateLibrary[BaddieStates.TURN] = function() 
    {
        
        if !is_sprite_finished()
            return
        
        scaleX = scaleX * -1
        image_xscale = scaleX
        stateCurrent = BaddieStates.WALK
        turnBuffer = 50
        
        return
    }
    
    stateLibrary[BaddieStates.STUN] = function()
    {

        sprite_index = spriteStun
        x = stunX + random_range(-global.hitstunShake, global.hitstunShake)
        y = stunY + random_range(-global.hitstunShake, global.hitstunShake)
        return
    }
    
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