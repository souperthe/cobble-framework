/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_freefallland_enter(enterMessage)
{
    image_speed = 0.35
    velocityY = 0
    velocityX = 0
    moveSpeed = 0
    
    
    if sprite_index == spriteGet("poundcancel1")
        sprite_index = spriteGet("poundcancel2")
    else if sprite_index == spriteGet("piledriver")
        sprite_index = spriteGet("piledriverland")
    else
        sprite_index = spriteGet("bodyslamland")
    
    image_index = 0
    super_sound_oneshot_emitter(emitter, sfx_groundpound)
    return;
}

/// @self obj_player
function scr_player_state_freefallland_exit()
{
    return;
}

/// @self obj_player
function scr_player_state_freefallland_step()
{
    
    if !is_sprite_finished()
        return
    
    sprite_index = spriteGet("facehurtup")
    stateSwitch(PlayerStates.NORMAL, "fromsprite")
    return;
}
