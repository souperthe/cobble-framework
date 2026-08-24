/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_trickjump_enter(enterMessage)
{
    velocityY = -12
    moveSpeed = 14
    trickJumpBuffer = 16
    
    sprite_index = spriteGet("rampjump")
    image_index = 0
    
    super_sound_oneshot_emitter(emitter, sfx_groundpoundstart)
    return;
}

/// @self obj_player
function scr_player_state_trickjump_exit()
{
    return;
}

/// @self obj_player
function scr_player_state_trickjump_step()
{
    velocityX = moveSpeed * scaleX
    
    
    if scr_player_wallcheck() && trickJumpBuffer <= 0
    {
        stateSwitch(PlayerStates.BUMP, "wallsplat")
        return
    }
    
    trickJumpBuffer--
    image_speed = 0.35
    
    if is_sprite_finished()
        image_index = image_number - 1
    
    if check_input("taunt", false)
    {
        scr_player_taunt()
        return
    }   
    
    if !(grounded && trickJumpBuffer <= 0)
    {
        exit
    }
    
    
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
    return;
}
