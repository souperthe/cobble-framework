/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_jump_enter(enterMessage)
{
    
    if enterMessage == "jump"
    {
        sprite_index = spriteGet("jump")
        image_index = 0;
        image_speed = 0.35;
        sprite_ = 0;
        velocityY = -11
        super_sound_oneshot_emitter(emitter, sfx_jump)
        return
    }
    else if enterMessage == "fromsprite"
    {
        return
    }
    
    sprite_index = spriteGet("fall")
    
    return;
}

/// @self obj_player
function scr_player_state_jump_exit()
{
    return;
}

/// @self obj_player
function scr_player_state_jump_step()
{
    
    static jumpAnimations = [spriteGet("jump"), spriteGet("suplexcancel")]
    var move = check_input("right", true) - check_input("left", true)
    var airSpeed = 6;
    var airSpeedMax = 8;
    var turnSpeed = 2;
    var accel = 0.5;
    var deccel = 0.1;
    var jumpSpeed = -11;
    
    if array_contains(jumpAnimations, sprite_index) && is_sprite_finished()
        sprite_index = spriteGet("fall")
    
    if (!momemtum)
        velocityX = move * moveSpeed
    else
    	velocityX = scaleX * moveSpeed
    
    if (dir != scaleX)
    {
        dir = scaleX
        moveSpeed = turnSpeed
    }
    
    if move != scaleX
        moveSpeed = turnSpeed
    
    if moveSpeed == 0
        momemtum = false
    
    if move != 0
    {
        scaleX = move
        
        if moveSpeed < airSpeed
            moveSpeed += accel
        else if floor(moveSpeed) == airSpeed
            moveSpeed = airSpeedMax
    }
    else 
    {
    	moveSpeed = 0
    }
    
    if check_input("attack", false)
    {
        scr_player_attack()
        return
    }
    
    if check_input("taunt", false)
    {
        scr_player_taunt()
        return
    }
    
    if moveSpeed > airSpeed
        moveSpeed -= deccel
    
    if grounded
    {
        super_sound_oneshot_emitter(emitter, sfx_step, random_pitch())
        if move != 0
            sprite_index = spriteGet("land2")
        else
            sprite_index = spriteGet("land")
        
        stateSwitch(PlayerStates.NORMAL, "fromsprite")
        return
    }
    return;
}
