/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_bump_enter(enterMessage)
{
    
    moveSpeed = 0
    
    if enterMessage == "suplex"
    {
        sprite_index = spriteGet("suplexbump")
        image_speed = 0.35
        velocityY = -4
        super_sound_oneshot_emitter(emitter, sfx_splat)
        return
    }
    else if enterMessage == "ramwall"
    {
        velocityX = -6 * scaleX
        velocityY = -6
        sprite_index = spriteGet("mach3hitwall")
        image_speed = 0.4
        image_index = 0
        super_sound_oneshot_emitter(emitter, sfx_bumpwall)
        super_sound_oneshot_emitter(emitter, sfx_groundpound)
        return
    }
    else if enterMessage == "wallsplat"
    {
        sprite_index = spriteGet("wallsplat")
        image_index = 0
        super_sound_oneshot_emitter(emitter, sfx_splat)
        image_speed = 0.35
    }
    return;
}

/// @self obj_player
function scr_player_state_bump_exit()
{
    return;
}

/// @self obj_player
function scr_player_state_bump_step()
{
    
    if sprite_index == spriteGet("wallsplat")
    {
        velocityY = 0
        
    }
    
    if is_sprite_finished()
        stateSwitch(PlayerStates.NORMAL)
    return;
}
