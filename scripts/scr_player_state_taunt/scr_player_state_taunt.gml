/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_taunt_enter(enterMessage)
{
    var tauntSprite = spriteGet("taunt")
    var tauntSounds = [sfx_taunt_1, sfx_taunt_2, sfx_taunt_3, sfx_taunt_4, sfx_taunt_5, sfx_taunt_6]
    sprite_index = tauntSprite
    image_index = irandom(sprite_get_number(tauntSprite) - 1)
    image_speed = 0;
    soundTaunt = super_sound_oneshot_emitter_list(emitter, tauntSounds)
    audio_sound_gain(soundTaunt, 0.5)
    return;
}

/// @self obj_player
function scr_player_state_taunt_exit()
{
    return;
}

/// @self obj_player
function scr_player_state_taunt_step()
{
    velocityX = 0
    velocityY = 0
    
    tauntTimer--;
    
    if tauntTimer > 0
        return
    
    moveSpeed = tauntMoveSpeed
    velocityX = tauntVelocityX
    velocityY = tauntVelocityY
    sprite_index = tauntSprite
    image_index = tauntImageIndex
    image_speed = tauntImageSpeed
    
    stateCurrentEnum = tauntState
    stateCurrent = stateLibrary[tauntState]
    audio_stop_sound(soundTaunt)
    return;
}
