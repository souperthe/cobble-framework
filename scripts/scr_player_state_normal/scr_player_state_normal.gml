/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_normal_enter(enterMessage)
{
    uppercutAllow = true
    idleTimer = 0
    idleAnimationCurrent = undefined
    
    if enterMessage == "fromsprite"
    {
        image_index = 0
        return
    }
    else if enterMessage == "land"
    { 
        var move = check_input("right", true) - check_input("left", true)
        super_sound_oneshot_emitter(emitter, sfx_step, random_pitch())
        
        if move != 0
            sprite_index = spriteGet("land2")
        else
            sprite_index = spriteGet("land")
        
        image_index = 0
        scr_effect_create("land", x, y, scaleX)
        return
    }
    
    sprite_index = spriteGet("idle")
    image_index = 0
    return;
}

/// @self obj_player
function scr_player_state_normal_exit()
{
    return;
}

/// @self obj_player
function scr_player_idle_animation()
{
    
    if array_length(idleAnimationsPity) == 0
        idleAnimationsPity = variable_clone(idleAnimations)
    
    var idleAnimation = array_random(idleAnimationsPity)
    var idleAnimationIndex = array_get_index(idleAnimationsPity, idleAnimation)
    
    
    var voiceRandom = irandom(100)
    
    if voiceRandom <= 60
    {
        var voiceSound = array_random(voiceIdle)
        trace(voiceSound)
        super_sound_oneshot_emitter(emitter, voiceSound, voicePitch())
    }
    
    idleTimer = random_range(-600, 0)
       
    array_delete(idleAnimationsPity, idleAnimationIndex, 1)
    
    idleAnimationCurrent = spriteGet(idleAnimation)
    
    sprite_index = idleAnimationCurrent
    image_index = 0
    return
}

/// @self obj_player
function scr_player_state_normal_step()
{
    static landAnimations = [spriteGet("land"), spriteGet("land2")]
    var landing = false;
    var move = check_input("right", true) - check_input("left", true)
    var walkSpeed = 6;
    var walkSpeedMax = 8;
    var accel = 0.5;
    var deccel = 0.1;
    
    
    var spriteIdle = spriteGet("idle")
    var spriteMove = spriteGet("move")
    
    if global.combo >= 25 && global.combo < 50
    {
        spriteIdle = spriteGet("3hpidle")
        spriteMove = spriteGet("3hpwalk")
    }
    
    if global.combo >= 50
    {
        spriteIdle = spriteGet("rageidle")
        spriteMove = spriteGet("ragemove")
    }
    
    if global.panic
    {
        
        if global.panicTime > 0
        {
            spriteIdle = spriteGet("panic")
        }
        else 
        { 
            spriteIdle = spriteGet("hurtidle")
            spriteMove = spriteGet("hurtwalk")
        }
    }
    
    
    if array_contains(landAnimations, sprite_index)
    {
        landing = !is_sprite_finished()
    }
         
    if check_input("dash", true) && !place_meeting(x + scaleX, y, obj_solid)
    {
        scr_player_entermach()
        return
    }
    
    velocityX = (move * moveSpeed)
    
    if move != 0
    { 
        
        scaleX = move;
        
        if moveSpeed < walkSpeed
            moveSpeed += accel
        else if floor(moveSpeed) == moveSpeed
            moveSpeed = walkSpeedMax
        
        
        if !landing
        {
            if stepTime > 0
                stepTime--;
            else {
                stepTime = 12;
                super_sound_oneshot_emitter(emitter, sfx_step, random_pitch())
                scr_effect_create("stepcloud", x, y + 43)
            }
            
            if (moveSpeed < (floor(walkSpeedMax) / 2) && move != 0)
                image_speed = 0.35
            else if (moveSpeed < (floor(walkSpeedMax) / 2) && moveSpeed < walkSpeedMax)
                image_speed = 0.45
            else
                image_speed = 0.6
                
            sprite_index = spriteMove
        }
            
            
    }
    else {
    	moveSpeed = 0
        stepTime = 12;
        machCrazy = false
        
        idleTimer++
        
        if idleTimer >= 150
        {
            scr_player_idle_animation()
        }
        
        if !landing && idleAnimationCurrent == undefined
        { 
            sprite_index = spriteIdle
            image_speed = 0.35
        }
        
        if idleAnimationCurrent != undefined && is_sprite_finished()
        {
            idleAnimationCurrent = undefined
            sprite_index = spriteIdle
            image_speed = 0.35
        }
            
        
        
    }
    
    if moveSpeed > walkSpeed
        moveSpeed -= deccel
    
    if check_input("taunt", false)
    {
        scr_player_taunt()
        return
    }
    
        
    if check_input("attack", false)
    {
        scr_player_attack()
        return
    }
    
    
    if check_input("jump", false) && jumpAllow
    {
        stateSwitch(PlayerStates.JUMP, "jump")
        return
    }
    
    if !grounded
    {
        stateSwitch(PlayerStates.JUMP)
        return
    }
    
    return;
}
