/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_taunt_enter(enterMessage)
{
    var tauntSprite = spriteGet("taunt")
    sprite_index = tauntSprite
    image_index = irandom(sprite_get_number(tauntSprite) - 1)
    image_speed = 0;
    super_sound_oneshot_emitter(emitter, sfx_taunt, random_pitch())
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
    return;
}
