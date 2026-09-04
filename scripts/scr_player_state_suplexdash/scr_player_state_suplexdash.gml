/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_suplexdash_enter(enterMessage)
{
    
    
    if grounded
        sprite_index = spriteGet("suplexdash")
    else
        sprite_index = spriteGet("suplexgrabjumpstart")
    
    if check_input("jump", false) && grounded
    { 
        sprite_index = spriteGet("suplexgrabjumpstart")
        velocityY = -11
        super_sound_oneshot_emitter(emitter, sfx_jump)
    }
    
    image_index = 0
    
    if moveSpeed < 12
        moveSpeed = 12
    
    soundSuplex = super_sound_oneshot_emitter(emitter, sfx_suplexdash, random_pitch())

    return;
}

/// @self obj_player
function scr_player_state_suplexdash_exit()
{
    audio_stop_sound(soundSuplex)
    return;
}

/// @self obj_player
function scr_player_state_suplexdash_step()
{
    var move = check_input("right", true) - check_input("left", true)
    image_speed = 0.35;
    
    velocityX = scaleX * moveSpeed;
    
    if move == -scaleX
    {
        
        
        if grounded
            stateSwitch(PlayerStates.NORMAL)
        else
        {
            sprite_index = spriteGet("suplexcancel")
            super_sound_oneshot_emitter(emitter, sfx_suplexcancel, random_pitch() + .5)
            stateSwitch(PlayerStates.JUMP, "fromsprite")
        }
        
        return
    }
    
    if check_input("down", true) && grounded
    {
        stateSwitch(PlayerStates.MACHROLL, "crouchslip")
        return
    }
    
    if check_input("jump", false) && jumpAllow
    {
        stateSwitch(PlayerStates.MACH2, "longjump")
        return
    }
    
    if scr_player_wallcheck()
    {
        stateSwitch(PlayerStates.WALLCLIMB, "start")
        return
    }
    
    if scr_player_wallcheck_bump_mach()
    {
        stateSwitch(PlayerStates.BUMP, "suplex")
        return
    }
    
    scr_player_jump_stop()
        
    
    if (is_sprite_finished())
    {
        
        if sprite_index == spriteGet("suplexdash")
        {
            uppercutAllow = true
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
