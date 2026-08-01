/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_normal_enter(enterMessage)
{
    return;
}

/// @self obj_player
function scr_player_state_normal_exit()
{
    return;
}

/// @self obj_player
function scr_player_state_normal_step()
{
    var move = check_input("right", true) - check_input("left", true)
    
    velocityX = move * 8
    
    if check_input("jump", false)
        velocityY = -10
    return;
}
