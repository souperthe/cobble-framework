/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_mach2_enter(enterMessage)
{
    
    if enterMessage == "start"
    {
        sprite_index = spriteGet("mach1")
        image_index = 0
        
        soundMach = super_sound_loop_emitter(emitter, sfx_mach1)
        
        if moveSpeed < 6 && moveSpeed >= 0
            moveSpeed = 6
        
        if moveSpeed > -6 && moveSpeed < 0
            moveSpeed = 6
        return
    }
    else if enterMessage == "walljump"
    {
        moveSpeed = 10
        super_sound_oneshot_emitter(emitter, sfx_jump)
        velocityY = -11
        scaleX *= -1
        sprite_index = spriteGet("walljumpstart")
        image_index = 0
        return
    }
    else if enterMessage == "turn"
    {
        velocityX = 0;
        sprite_index = spriteGet("mach")
        image_index = 0;
        scaleX *= -1
        moveSpeed = 8
        soundMach = super_sound_loop_emitter(emitter, sfx_mach2)
        return
    }
    else if enterMessage == "longjump"
    {
        velocityY = -11
        super_sound_oneshot_emitter(emitter, sfx_rollgetup, random_pitch())
        sprite_index = spriteGet("longjump")
        image_index = 0
        return
    }
    
    if sprite_index != spriteGet("rollgetup") 
        sprite_index = spriteGet("mach") 
    soundMach = super_sound_loop_emitter(emitter, sfx_mach2)
    return;
}

/// @self obj_player
function scr_player_state_mach2_exit()
{
    audio_stop_sound(soundMach)
    return;
}

/// @self obj_player
function scr_player_state_mach2_step()
{
    
    var move = check_input("right", true) - check_input("left", true)
    var accel = 0.1;
    var accelMach = 0.4;
    var maxMoveSpeed = 12;
    var slopeAccel = 0.1;
    var slopeDeccel = 0.2;
    static fixedSpeedSprites = [
        spriteGet("rollgetup"), 
        spriteGet("longjumpend"), 
        spriteGet("longjump"),
        spriteGet("suplexdash"),
        spriteGet("longjumpend")
    ]
    static wallJumpSprites = [
        spriteGet("walljumpstart"),
        spriteGet("walljumpend")
    ]
    
    velocityX = (scaleX * moveSpeed)
    
    if is_sprite_finished() && sprite_index == spriteGet("walljumpstart")
    {
        sprite_index = spriteGet("walljumpend")
        image_index = 0
    }
        
    
    if grounded
    {
        
        if array_contains(wallJumpSprites, sprite_index)
        {
            sprite_index = spriteGet("mach")
            soundMach = super_sound_loop_emitter(emitter, sfx_mach2)
        }
        
        if scr_slope() && velocityY != 0 && moveSpeed > 8
            scr_player_apply_slope_momentum(slopeAccel, slopeDeccel)
        
        if moveSpeed < maxMoveSpeed
        {
            
            if machMode == false
                moveSpeed += accel
            else
                moveSpeed += accelMach
            
        }
        
        if (abs(velocityX) >= maxMoveSpeed && sprite_index != spriteGet("suplexdash"))
        {
            audio_stop_sound(soundMach)
            stateSwitch(PlayerStates.MACH3, "enter")
            return
        }
    }
    
    if move == -scaleX && grounded && velocityY > 0
    {
        audio_stop_sound(soundMach)
        stateSwitch(PlayerStates.MACHSLIDE, "2")
        return;
    }
    
    if check_input("attack", false)
    {
        audio_stop_sound(soundMach)
        scr_player_attack()
        return
    }
    
    if scr_player_wallcheck()
    {
        stateSwitch(PlayerStates.WALLCLIMB, "start")
        return
    }
    
    if scr_player_wallcheck_bump_mach()
    {
        stateSwitch(PlayerStates.BUMP, "wallsplat")
        return
    }

    if is_sprite_finished() && sprite_index == spriteGet("secondjump1")
    {
        sprite_index = spriteGet("secondjump2")
        image_index = 0
    }
    
    if is_sprite_finished() && sprite_index == spriteGet("longjump")
    {
        sprite_index = spriteGet("longjumpend")
        image_index = 0
    }
    
    if (grounded && velocityY > 0) && (sprite_index == spriteGet("secondjump2") || sprite_index == spriteGet("secondjump1"))
    {
        sprite_index = spriteGet("mach")
        soundMach = super_sound_loop_emitter(emitter, sfx_mach2)
    }
    
    if !(grounded && velocityY > 0)  && audio_is_playing(soundMach)
        audio_stop_sound(soundMach)
    
    if check_input("jump", false) && jumpAllow
    {
        super_sound_oneshot_emitter(emitter, sfx_jump)
        velocityY = -11
        sprite_index = spriteGet("secondjump1")
        image_index = 0
        audio_stop_sound(soundMach)
        return
    }
    
    if check_input("taunt", false)
    {
        scr_player_taunt()
        return
    }   
    
    if check_input("down", true)
    {
        stateSwitch(PlayerStates.MACHROLL)
        return
    }
    
    if !check_input("dash", true) && moveSpeed >= 8 && (grounded && velocityY > 0) 
    {
        audio_stop_sound(soundMach)
        stateSwitch(PlayerStates.MACHSLIDE, "brake")
        return
    }
    
    scr_player_jump_stop()
    
    if is_sprite_finished() && sprite_index == spriteGet("mach1")
    {
        audio_stop_sound(soundMach)
        sprite_index = spriteGet("mach")
        soundMach = super_sound_loop_emitter(emitter, sfx_mach2)
    }
    
    if array_contains(fixedSpeedSprites, sprite_index)
        image_speed = 0.4;
    else
        image_speed = abs(moveSpeed) / 15
        
    return;
}
