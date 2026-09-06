/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_noclip_enter(enterMessage)
{
    collide = false
    alpha = 0.5
    return;
}

/// @self obj_player
function scr_player_state_noclip_exit()
{
    collide = true
    alpha = 1
    return;
}

/// @self obj_player
function scr_player_state_noclip_step()
{
    var moveX = check_input("right", true) - check_input("left", true)
    var moveY = check_input("up", true) - check_input("down", true)
    var moveSpeed = 6
    
    if check_input("dash", true)
        moveSpeed = 10
    
    velocityX = moveX * moveSpeed
    velocityY = -moveY * moveSpeed
    
    image_speed = 1
    sprite_index = spriteGet("debug")
    
    if check_input("jump", false) || check_input("attack", false)
    {
        stateSwitch(PlayerStates.NORMAL)
        return
    }
    return;
}
