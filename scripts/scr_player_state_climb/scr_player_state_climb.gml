/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_climb_enter(enterMessage)
{
    sprite_index = spriteGet("ladder")
    image_index =  0;
    moveSpeed = 0
    return;
}

/// @self obj_player
function scr_player_state_climb_exit()
{
    return;
}

/// @self obj_player
function scr_player_state_climb_step()
{
    velocityX = 0;
    
    if (!place_meeting(x, y, obj_ladder))
    {
        stateSwitch(PlayerStates.NORMAL)
        velocityY = 0
        return
    }
    
    if check_input("jump", false)
    {
        stateSwitch(PlayerStates.JUMP, "jump")
        return
    }
    
    if check_input("up", true)
    {
        sprite_index = spriteGet("laddermove")
        image_speed = 0.35;
        velocityY = -6
    }
    else if check_input("down", true)
    {
        
        if grounded && !place_meeting(x, y, obj_platform)
        {
            stateSwitch(PlayerStates.NORMAL)
            return
        }
        
    	velocityY = 10
        sprite_index = spriteGet("ladderdown")
        image_speed = 0.35;
        
    }
    else {
    	velocityY = 0
        sprite_index = spriteGet("ladder")
    }
    return;
}
