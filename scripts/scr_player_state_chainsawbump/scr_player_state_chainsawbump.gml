/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_chainsawbump_enter(enterMessage)
{
    obj_camera.shake(10, 2)
    sprite_index = spriteGet("chainsaw_bump")
    velocityY = -6
    velocityX = -6 * scaleX
    
    super_sound_oneshot_emitter(emitter, sfx_bumpwall)
    super_sound_oneshot_emitter(emitter, sfx_groundpound)
    return;
}

/// @self obj_player
function scr_player_state_chainsawbump_exit()
{
    return;
}

/// @self obj_player
function scr_player_state_chainsawbump_step()
{
    if grounded
        stateSwitch(PlayerStates.CHAINSAWNORMAL)
    return;
}
