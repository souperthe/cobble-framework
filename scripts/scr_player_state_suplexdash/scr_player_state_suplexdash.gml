/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_suplexdash_enter(enterMessage)
{
    
    if grounded
        sprite_index = spriteGet("suplexdash")
    else
        sprite_index = spriteGet("suplexgrabjumpstart")
    
    image_index = 0
    moveSpeed = 8

    return;
}

/// @self obj_player
function scr_player_state_suplexdash_exit()
{
    return;
}

/// @self obj_player
function scr_player_state_suplexdash_step()
{
    var move = check_input("right", false) - check_input("left", false)
    image_speed = 0.35;
    
    velocityX = scaleX * moveSpeed;
    
    if move == -scaleX
    {
        
        if grounded
            stateSwitch(PlayerStates.NORMAL)
        else
        {
            sprite_index = spriteGet("suplexcancel")
            stateSwitch(PlayerStates.JUMP, "fromsprite")
        }
        
        return
    }
        
    
    if (is_sprite_finished())
    {
        
        if sprite_index == spriteGet("suplexdash")
        {
            stateSwitch(PlayerStates.NORMAL)
            return
        }
        else if sprite_index == spriteGet("suplexgrabjumpstart")
        {
            sprite_index = spriteGet("suplexgrabjump")
        }
        
        
    }
    
    if (sprite_index == spriteGet("suplexgrabjumpstart") || sprite_index == spriteGet("suplexgrabjump")) && grounded
    {
        stateSwitch(PlayerStates.NORMAL)
        return
    }
    
    return;
}
