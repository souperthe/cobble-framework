/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_chainsawdash_enter(enterMessage)
{   
    chainsawDashVelocity = velocityX
    chainsawJumping = false
    chainsawSoundDash = super_sound_loop_emitter(emitter, sfx_mach2)
    if enterMessage == "start"
    {
        chainsawDashVelocity = -scaleX * 8
        return
    }
    else if enterMessage == "turn"
    {
        scaleX *= -1
        chainsawDashVelocity = scaleX * 10
        return
    }
    else if enterMessage == "frompogo"
    {
        return
    }
    
    chainsawDashVelocity = scaleX * 4
    return;
}

/// @self obj_player
function scr_player_state_chainsawdash_exit()
{
    audio_stop_sound(chainsawSoundDash)
    mask_index = spr_player_mask
    return;
}

/// @self obj_player
function scr_player_state_chainsawdash_step()
{
    
    var move = check_input("right", true) - check_input("left", true)
    chainsawDashVelocity = approach(chainsawDashVelocity, scaleX * 15, 0.3)
    velocityX = chainsawDashVelocity
    moveSpeed = abs(velocityX)
    
    if check_input("down", true) && grounded
    {
        sprite_index = spriteGet("chainsaw_slide")
        mask_index = spr_player_crouchmask
    }
    else
    {
        mask_index = spr_player_mask
        sprite_index = spriteGet("chainsaw")
    }
    image_speed = abs(chainsawDashVelocity) / 13
    
    if move == -scaleX && grounded
    {
        stateSwitch(PlayerStates.CHAINSAWTURN)
        return
    }
    
    if check_input("jump", false) && chainsawJumping
    {
        stateSwitch(PlayerStates.CHAINSAWPOGO)
        return
    }
    
    if check_input("jump", false) && jumpAllow
    {
        velocityY = -11
        super_sound_oneshot_emitter(emitter, sfx_jump)
        chainsawJumping = true
        return
    }
    
    if grounded
        chainsawJumping = false
    
    
    
    
    if check_input("attack", false)
    {
        stateSwitch(PlayerStates.CHAINSAWATTACK)
        return
    }
    
    scr_player_jump_stop()
    
    if !check_input("dash", true) && grounded
    {
        stateSwitch(PlayerStates.CHAINSAWNORMAL)
        return
    }
    
    var wallCheck = scr_player_wallcheck()
    
    if scr_player_wallcheck() && sign(velocityX) == scaleX
    {
        stateSwitch(PlayerStates.CHAINSAWBUMP)
        return
    }
    
    if scr_player_wallcheck_bump_mach() && sign(velocityX) == scaleX
    {
        stateSwitch(PlayerStates.CHAINSAWBUMP)
        return
    }
    return;
}
