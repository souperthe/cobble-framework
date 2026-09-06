/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_chainsawjump_enter(enterMessage)
{
    chainsawMove = check_input("right", true) - check_input("left", true)
    chainsawJumpSpeed = velocityX
    
    if chainsawJumpSpeed < 7
        chainsawJumpSpeed = 7
    
    if enterMessage == "jump"
    {
        velocityY = -11
        super_sound_oneshot_emitter(emitter, sfx_jump)
    }
    return;
}

/// @self obj_player
function scr_player_state_chainsawjump_exit()
{
    return;
}

/// @self obj_player
function scr_player_state_chainsawjump_step()
{
    var move = check_input("right", true) - check_input("left", true)
    chainsawMove = approach(chainsawMove, move, 0.05)
    velocityX = chainsawMove * chainsawJumpSpeed
    
    sprite_index = spriteGet("chainsaw_air")
    image_speed = 0.5
    
    if jumpAllow && check_input("jump", false)
    {
        stateSwitch(PlayerStates.CHAINSAWJUMP, "jump")
        return
    }
    
    if check_input("attack", false)
    {
        stateSwitch(PlayerStates.CHAINSAWATTACK)
        return
    }
    
    if check_input("down", false)
    {
        stateSwitch(PlayerStates.CHAINSAWPOGO)
        return
    }
    
    scr_player_jump_stop()
    
    if grounded
    {
        stateSwitch(PlayerStates.CHAINSAWNORMAL)
        super_sound_oneshot_emitter(emitter, sfx_step, random_pitch())
        return
    }
    return;
}
