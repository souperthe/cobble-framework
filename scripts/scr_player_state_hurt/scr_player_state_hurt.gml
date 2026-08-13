/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_hurt_enter(enterMessage)
{
    moveSpeed = 8
    velocityY = -14
    
    sprite_index = spriteGet("hurt")
    
    if enterMessage == "behind"
        sprite_index = spriteGet("jumphurt")
    return;
}

/// @self obj_player
function scr_player_state_hurt_exit()
{
    return;
}

/// @self obj_player
function scr_player_state_hurt_step()
{
    
    if sprite_index == spriteGet("jumphurt")
        velocityX = scaleX * moveSpeed
    else
        velocityX = -scaleX * moveSpeed
    
    image_speed = 0.35
    
    if grounded && velocityY > 0
    {
        stateSwitch(PlayerStates.NORMAL, "land")
        return
    }
    return;
}
