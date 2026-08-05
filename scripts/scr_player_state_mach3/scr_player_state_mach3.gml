/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_mach3_enter(enterMessage)
{
    soundMachIndex = sfx_mach3
    if enterMessage == "enter"
    {
        
        if sprite_index != spriteGet("rollgetup")
            sprite_index = spriteGet("mach4")
        
        soundMachIndex = sfx_mach3
        soundMach = super_sound_loop_emitter(emitter, soundMachIndex)
        
        return
    }
    else if enterMessage == "turn"
    {
        velocityX = 0;
        sprite_index = spriteGet("mach4")
        image_index = 0;
        scaleX *= -1
        moveSpeed = 12
        soundMachIndex = sfx_mach3
        soundMach = super_sound_loop_emitter(emitter, soundMachIndex)
        return
    }
    else if enterMessage == "sjumpcancel"
    {
        moveSpeed = 13
        soundMachIndex = sfx_mach3
        velocityY = -4
        sprite_index = spriteGet("Sjumpcancel")
        image_index = 0
        return
    }
    
    return;
}

/// @self obj_player
function scr_player_state_mach3_exit()
{
    machMode = false
    audio_stop_sound(soundMach)
    return;
}

/// @self obj_player
function scr_player_state_mach3_step()
{
    
    var move = check_input("right", true) - check_input("left", true)
    var slopeAccel = 0.1
    var slopeDeccel = 0.2
    var speedMach4 = 20
    var speedMach3 = 16
    var accel = 0.025
    var accelMach4 = 0.1
    var machRollSpeed = 10;
    static overrideAnimations = [spriteGet("rollgetup"), spriteGet("mach3hit")]
    
    if is_sprite_finished() && array_contains(overrideAnimations, sprite_index)
    {
        
        if machMode
            sprite_index = spriteGet("crazyrun")
        else
            sprite_index = spriteGet("mach4")
        
    }
    
    if sprite_index == spriteGet("mach4")
        image_speed = 0.4;
    else if sprite_index == spriteGet("crazyrun")
        image_speed = 0.75;
    else
        image_speed = 0.4;
    
    velocityX = (scaleX * moveSpeed)
    
    if move == -scaleX && grounded && sprite_index != spriteGet("dashpadmach")
    {
        audio_stop_sound(soundMach)
        stateSwitch(PlayerStates.MACHSLIDE, "3")
        return;
    }
    
    if grounded
    {
        var withinThreshold = moveSpeed > 10 && moveSpeed < 18
        var onSlope = (scr_slope() && velocityX != 0)
        
        if sprite_index == spriteGet("Sjumpcancel")
            sprite_index = spriteGet("mach4")
        
        if (onSlope && withinThreshold)
            scr_player_apply_slope_momentum(slopeAccel, slopeDeccel)
        
        
        if moveSpeed > speedMach3 && sprite_index != spriteGet("crazyrun") && sprite_index != spriteGet("spr_player_Sjumpcancelstart")
        {
            machMode = true;
            sprite_index = spriteGet("crazyrun")
            soundMachIndex = sfx_mach4
            audio_stop_sound(soundMach)
        }
    }
    
    scr_player_jump_stop()
    
    if check_input("attack", false)
    {
        audio_stop_sound(soundMach)
        scr_player_attack()
        return
    }
    
    if check_input("taunt", false)
    {
        audio_stop_sound(soundMach)
        scr_player_taunt()
        return
    }
    
    if scr_player_wallcheck()
    {
        stateSwitch(PlayerStates.WALLCLIMB, "begin")
        return
    }
    
    if scr_player_wallcheck_bump_mach()
    {
        stateSwitch(PlayerStates.BUMP, "ramwall")
        return
    }
    
    if check_input("down", true)
    {
        stateSwitch(PlayerStates.MACHROLL)
        return
    }
    
    if check_input("up", false) && grounded
    {
        stateSwitch(PlayerStates.SJUMPPREP)
        return
    }
    
    if is_sprite_finished() && sprite_index == spriteGet("mach3jump")
    {
        sprite_index = spriteGet("mach4")
        image_index = 0
    }
    
    if grounded and !audio_is_playing(soundMach)
        soundMach = super_sound_loop_emitter(emitter, soundMachIndex)
    
    if check_input("jump", false) && jumpAllow && sprite_index != spriteGet("mach3jump") && move == scaleX
    {
        super_sound_oneshot_emitter(emitter, sfx_jump)
        velocityY = -11
        
        if !machMode
        { 
            sprite_index = spriteGet("mach3jump")
            image_index = 0
        }
        
        return
    }
    
    if !check_input("dash", true) && moveSpeed >= 8 && grounded
    {
        audio_stop_sound(soundMach)
        stateSwitch(PlayerStates.MACHSLIDE, "brake")
        return
    }
     
    if move == scaleX && grounded
    {
        
        if machMode
        {
            var targetAccel = accelMach4
            
            if moveSpeed < speedMach4 || mach4Capped
                moveSpeed += accel
        }
        else if moveSpeed < speedMach4
        {
            var targetAccel = accel
            
            moveSpeed += accel
        }
        
    }
        
    
    return;
}
