/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_machroll_enter(enterMessage)
{
    
    bufferGetup = 0
    soundRoll = 0
    diving = false
    mask_index = spr_player_crouchmask
    effectDashCloudTimer = 0
    
    if enterMessage == "crouchslip"
    {
        sprite_index = spriteGet("crouchslip")
        moveSpeed = 12
        super_sound_oneshot_emitter(emitter, sfx_dive, 1.5)
        bufferGetup = 25
        
        return
    }
    
    if enterMessage == "fromslope"
    {
        
        if freeFallProgress > 20
            moveSpeed = 12
        else
            moveSpeed = 8
        
        sprite_index = spriteGet("crouchslip")
        return
    }
    
    soundRoll = super_sound_loop_emitter(emitter, sfx_roll)
    audio_sound_gain(soundRoll, 0.5)
    velocityY = 10
    
    if !(grounded && velocityY > 0) 
        sprite_index = spriteGet("mach2jump")
    else
        sprite_index = spriteGet("machroll")
    
    return;
}

/// @self obj_player
function scr_player_state_machroll_exit()
{
    audio_stop_sound(soundRoll)
    mask_index = spr_player_mask
    return;
}

/// @self obj_player
function scr_player_state_machroll_step()
{
    
    velocityX = scaleX * moveSpeed
    
    if !(grounded && velocityY > 0) 
    {
        audio_sound_gain(soundRoll, 0)
        sprite_index = spriteGet("dive")
        image_speed = 0.8
        var diveSpeed = 10
        var speedCurrent = abs(velocityX)
        
        if speedCurrent > diveSpeed
            diveSpeed = speedCurrent
        
        velocityY = speedCurrent
        
        if !diving
        {
            super_sound_oneshot_emitter(emitter, sfx_dive, 1.6)
            diving = true
        }
    }
    else if sprite_index == spriteGet("dive")
    {
        sprite_index = spriteGet("machroll")
    }
    
    if sprite_index == spriteGet("dive") and check_input("jump", false)
    {
        stateSwitch(PlayerStates.FREEFALL, "divebomb")
        return
    }
    
    if sprite_index == spriteGet("machroll")
    {
        var spriteSpeed = abs(moveSpeed) / 10
        audio_sound_gain(soundRoll, 0.5)
        audio_sound_pitch(soundRoll, spriteSpeed)
        image_speed = spriteSpeed
    }
    
    
    
    if scr_slope()
        moveSpeed += 0.1
    
    bufferGetup--
    
    if scr_player_wallcheck_bump()
    {
        stateSwitch(PlayerStates.BUMP, "wallsplat")
        return
    }
    
    if grounded
    {
        
        effectDashCloudTimer--
        
        if effectDashCloudTimer < 0
        {
            scr_effect_create("smalldashcloud", x, y, scaleX)
            effectDashCloudTimer = 10
        }
    }
    
    
    if !check_input("down", true) && ((grounded && velocityY > 0)  && velocityY > 0)  && bufferGetup <= 0 && !scr_solid(x, y - 16) && !scr_solid(x, y - 32)
    {
        image_index = 0
        
        if (grounded && velocityY > 0) 
        {
            sprite_index = spriteGet("rollgetup")
            super_sound_oneshot_emitter(emitter, sfx_rollgetup, 2)
        }
        
        if moveSpeed < 12
        {
            
            if !grounded
                sprite_index = spriteGet("mach")
            
            stateSwitch(PlayerStates.MACH2)
            return
        }
        
        if !grounded
            sprite_index = spriteGet("mach4")
            
        stateSwitch(PlayerStates.MACH3)
        return
    }
    
    return;
}
