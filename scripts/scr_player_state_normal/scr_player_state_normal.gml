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
    var walkSpeed = 6;
    var accel = 0.5;
    var deccel = 0.1;
    
    velocityX = (move * moveSpeed)
    
    if move != 0
    {
        if moveSpeed < walkSpeed
            moveSpeed += accel
        else if floor(moveSpeed) == moveSpeed
            moveSpeed = walkSpeed
    }
    else {
    	moveSpeed = 0
    }
    
    if moveSpeed > walkSpeed
        moveSpeed -= deccel
    
    if check_input("jump", false)
    {
        stateSwitch(PlayerStates.JUMP, "jump")
        return
    }
    
    return;
}
