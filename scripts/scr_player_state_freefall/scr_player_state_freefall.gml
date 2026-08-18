/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_freefall_enter(enterMessage)
{
    soundGroundPound = super_sound_loop_emitter(emitter, sfx_groundpoundloop)
    audio_sound_gain(soundGroundPound, 0)
    
    freeFallVelocity = 0
    
    if enterMessage == "bodyslam"
    {
        sprite_index = spriteGet("bodyslamstart")
        image_index = 0
        image_speed = 0.4
        freeFallVelocity = -4
        freeFallProgress = 0
        super_sound_oneshot_emitter(emitter, sfx_groundpoundstart)
        return
    }
    else if enterMessage == "divebomb"
    {
        super_sound_oneshot_emitter(emitter, sfx_groundpoundstart)
        freeFallVelocity = -5.5
        sprite_index = spriteGet("poundcancel1")
        image_speed = 0.4
        return
    }
    else if enterMessage == "fromsecret"
    {
        sprite_index = spriteGet("bodyslamstart")
        image_index = 0
        freeFallVelocity = -5
        return
    }
    
    return;
}

/// @self obj_player
function scr_player_state_freefall_exit()
{
    
    audio_stop_sound(soundGroundPound)
    return;
}

/// @self obj_player
function scr_player_state_freefall_step()
{
    
    if is_sprite_finished() && sprite_index == spriteGet("bodyslamstart")
    {
        sprite_index = spriteGet("bodyslamfall")
        image_speed = 0.35
    }
    
    if freeFallVelocity >= 2
        freeFallVelocity += 0.5
    
    velocityY = freeFallVelocity
    freeFallVelocity += grav * 1.5
    
    var move = check_input("right", true) - check_input("left", true)
    
    if !grounded
    {
        var targetSpeed = move * moveSpeed
        var targetStep = 0.5
        
        if move == -scaleX
            targetStep = 0.8
        
        if move == 0
            targetStep = 0.7
        
        velocityX = approach(velocityX, targetSpeed, targetStep)
    }
    
    if freeFallVelocity > 0
        freeFallProgress++
    else if freeFallVelocity < 0
        freeFallProgress = -14
    
    if freeFallProgress > 10
        audio_sound_gain(soundGroundPound, 1, 200)
    
    if (grounded && velocityY > 0)
    {
        
        if scr_slope()
        {
            with (instance_place(x, y + 1, obj_slope))
            {
                other.scaleX = -sign(image_xscale)
                other.stateSwitch(PlayerStates.MACHROLL, "fromslope")
                return
            }
        }
        
        stateSwitch(PlayerStates.FREEFALLLAND)
        return
    }
    
    return;
}
