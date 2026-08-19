/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_uppercut_enter(enterMessage)
{
    sprite_index = spriteGet("breakdanceuppercut")
    image_index = 0
    
    if grounded
        velocityY = -14
    else
        velocityY = -10
    
    moveSpeed = abs(velocityX)
    scaleX = 1
    image_speed = 0.35
    soundUppercut = super_sound_oneshot_emitter(emitter, sfx_uppercut, random_pitch() + .2)
    return;
}

/// @self obj_player
function scr_player_state_uppercut_exit()
{
    audio_stop_sound(soundUppercut)
    return;
}

/// @self obj_player
function scr_player_state_uppercut_step()
{
    
    var move = check_input("right", true) - check_input("left", true)
    
    if is_sprite_finished() && sprite_index == spriteGet("breakdanceuppercut")
        sprite_index = spriteGet("breakdanceuppercutend")
    
    if move != 0
        velocityX = approach(velocityX, move * moveSpeed, 0.4)
    else
        velocityX = approach(velocityX, 0, 0.2)
    
    if check_input("attack", false)
    {
        
        if move != 0
            scaleX = move
        
        stateSwitch(PlayerStates.SUPLEXDASH)
        uppercutAllow = false
        return
    }
    
    if grounded && velocityY >= 0
    {
        
        if velocityX != 0
            scaleX = sign(velocityX)
        
        moveSpeed = abs(velocityX)
        stateSwitch(PlayerStates.NORMAL, "land")
        return
    }
    
    return;
}
