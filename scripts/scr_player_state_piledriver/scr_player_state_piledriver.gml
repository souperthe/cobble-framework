/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_piledriver_enter(enterMessage)
{
    
    super_sound_oneshot_emitter(emitter, sfx_groundpoundstart)
    
    sprite_index = spriteGet("piledriver")
    soundGroundPound = super_sound_loop_emitter(emitter, sfx_groundpoundloop)
    audio_sound_gain(soundGroundPound, 0)
    
    if enterMessage == "frommovespeed"
        velocityY = -abs(moveSpeed)
    return;
}

/// @self obj_player
function scr_player_state_piledriver_exit()
{
    audio_stop_sound(soundGroundPound)
    
    if grabbedBaddie != -1
        instance_destroy(grabbedBaddie)
    return;
}

/// @self obj_player
function scr_player_state_piledriver_step()
{
    
    var move = check_input("right", true) - check_input("left", true)
    velocityX = approach(velocityX, move * moveSpeed, 0.7)
    
    if velocityY >= 0
        velocityY += 0.5
    
    if grounded and velocityY > 0
    {
        stateSwitch(PlayerStates.FREEFALLLAND)
        return
    }
    
    
    if velocityY < 0
        image_speed = 0.35
    else
    {
        audio_sound_gain(soundGroundPound, 1, 200)
        image_speed = 0.5
    }
    return;
}
