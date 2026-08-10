/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_chainsawturn_enter(enterMessage)
{
    sprite_index = spriteGet("chainsaw_bump")
    chainsawTurnTimer = 20
    super_sound_oneshot_emitter(emitter, sfx_machslideboost)
    return;
}

/// @self obj_player
function scr_player_state_chainsawturn_exit()
{
    return;
}

/// @self obj_player
function scr_player_state_chainsawturn_step()
{
    velocityX = approach(velocityX, 0, 0.4)
    chainsawTurnTimer--
    
    if chainsawTurnTimer < 0 && grounded
    {
        stateSwitch(PlayerStates.CHAINSAWDASH, "turn")
        return
    }
    return;
}
