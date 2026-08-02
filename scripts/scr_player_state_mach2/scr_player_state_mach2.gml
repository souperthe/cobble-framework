/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_mach2_enter(enterMessage)
{
    
    if enterMessage == "start"
    {
        sprite_index = spriteGet("mach1")
        image_index = 0
        
        if moveSpeed < 6 && moveSpeed >= 0
            moveSpeed = 6
        
        if moveSpeed > -6 && moveSpeed < 0
            moveSpeed = 6
        
    }
    else if enterMessage == "turn"
    {
        velocityX = 0;
        sprite_index = spriteGet("mach")
        image_index = 0;
        scaleX *= -1
        moveSpeed = 8
        return
    }
    
    soundMach = super_sound_loop_emitter(emitter, sfx_mach1)
    return;
}

/// @self obj_player
function scr_player_state_mach2_exit()
{
    return;
}

/// @self obj_player
function scr_player_state_mach2_step()
{
    
    var move = check_input("right", true) - check_input("left", true)
    var accel = 0.1;
    var accelMach = 0.4;
    var maxMoveSpeed = 12;
    static fixedSpeedSprites = [
        spriteGet("rollgetup"), 
        spriteGet("longjumpend"), 
        spriteGet("longjump"),
        spriteGet("suplexdash")
    ]
    
    velocityX = (scaleX * moveSpeed)
    
    if grounded
    {
        
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
    
    if move == -scaleX && grounded
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

    if is_sprite_finished() && sprite_index == spriteGet("secondjump1")
    {
        sprite_index = spriteGet("secondjump2")
        image_index = 0
    }
    
    if grounded && (sprite_index == spriteGet("secondjump2") || sprite_index == spriteGet("secondjump1"))
    {
        sprite_index = spriteGet("mach")
        soundMach = super_sound_loop_emitter(emitter, sfx_mach2)
    }
    
    if check_input("jump", false) && jumpAllow && move == scaleX
    {
        super_sound_oneshot_emitter(emitter, sfx_jump)
        velocityY = -11
        sprite_index = spriteGet("secondjump1")
        image_index = 0
        audio_stop_sound(soundMach)
        return
    }
    
    if !check_input("dash", true) && moveSpeed >= 8 && grounded
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
