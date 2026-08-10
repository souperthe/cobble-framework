/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_chainsawnormal_enter(enterMessage)
{
    chainsawMove = check_input("right", true) - check_input("left", true)
    return;
}

/// @self obj_player
function scr_player_state_chainsawnormal_exit()
{
    return;
}

/// @self obj_player
function scr_player_state_chainsawnormal_step()
{
    var move = check_input("right", true) - check_input("left", true)
    chainsawMove = approach(chainsawMove, move, 0.07)
    
    if move != 0
    {
        sprite_index = spriteGet("chainsaw")
        image_speed = 0.2
        scaleX = move
    }
    else {
    	sprite_index = spriteGet("chainsaw_end")
        image_speed = 0.5
    }
    
    velocityX = chainsawMove * 7
    
    if check_input("dash", true)
    {
        stateSwitch(PlayerStates.CHAINSAWDASH, "start")
        return
    }
    
    if check_input("attack", false)
    {
        stateSwitch(PlayerStates.CHAINSAWATTACK)
        return
    }
    
    if check_input("attack", false)
    {
        stateSwitch(PlayerStates.CHAINSAWATTACK)
        return
    }
    
    
    if check_input("jump", false)
    {
        stateSwitch(PlayerStates.CHAINSAWJUMP, "jump")
        return
    }
    
    if !grounded
    {
        stateSwitch(PlayerStates.CHAINSAWJUMP)
    }
    return;
}
