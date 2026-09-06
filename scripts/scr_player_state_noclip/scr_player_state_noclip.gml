/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_noclip_enter(enterMessage)
{
    collide = false
    alpha = 0.5
    noclipSpeed = 8
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
    var moveSpeed = 8
    
    if check_input("dash", true)
        moveSpeed = 10
    
    noclipSpeed = approach(noclipSpeed, moveSpeed, 3)
    
    velocityX = moveX * noclipSpeed
    velocityY = -moveY * noclipSpeed
    alpha = 0.5
    collide = false
    
    if moveX != 0
        scaleX = moveX
    
    image_speed = 1
    sprite_index = spriteGet("debug")
    
    if check_input("jump", false) || check_input("attack", false)
    {
        stateSwitch(PlayerStates.NORMAL)
        return
    }
    return;
}
