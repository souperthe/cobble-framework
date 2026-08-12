/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_chainsawattack_enter(enterMessage)
{
    sprite_index = spriteGet("chainsaw_swing")
    image_speed = 0.5
    image_index = 0
    chainsawAttackSpeed = scaleX * 12
    
    if !grounded
        velocityY = -4
    
    return;
}

/// @self obj_player
function scr_player_state_chainsawattack_exit()
{
    return;
}

/// @self obj_player
function scr_player_state_chainsawattack_step()
{
    
    if grounded
        chainsawAttackSpeed = approach(chainsawAttackSpeed, 0, 0.2)
    
    velocityX = chainsawAttackSpeed
    
    if is_sprite_finished()
    {
        if check_input("jump", true)
            stateSwitch(PlayerStates.CHAINSAWPOGO, "nojump")
        else
            stateSwitch(PlayerStates.CHAINSAWDASH, "frompogo")
    }
    
    if scr_player_wallcheck()
    {
        stateSwitch(PlayerStates.CHAINSAWBUMP)
        return
    }
    
    if scr_player_wallcheck_bump_mach()
    {
        stateSwitch(PlayerStates.CHAINSAWBUMP)
        return
    }
    return;
}
