/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_hitstun_enter(enterMessage)
{
    return;
}

/// @self obj_player
function scr_player_state_hitstun_exit()
{
    return;
}

/// @self obj_player
function scr_player_state_hitstun_step()
{
    
    if hitstunTime <= 0
    {
        stateCurrent = stateLibrary[tauntState]
        stateCurrentEnum = tauntState
        image_speed = tauntImageSpeed
        velocityX = tauntVelocityX
        velocityY = tauntVelocityY
        x = hitstunX
        y = hitstunY
        instance_destroy(hitstunBaddie)
        return
    }
    
    velocityX = 0
    velocityY = 0
    
    x = hitstunX + random_range(-global.hitstunShake, global.hitstunShake )
    y = hitstunY + random_range(-global.hitstunShake, global.hitstunShake )
    
    hitstunTime--
    
    
    return;
}
