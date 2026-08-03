/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_sjumpland_enter(enterMessage)
{
    super_sound_oneshot_emitter(emitter, sfx_groundpound)
    sprite_index = spriteGet("superjumpland")
    image_speed = 0.5
    image_index = 0
    return;
}

/// @self obj_player
function scr_player_state_sjumpland_exit()
{
    return;
}

/// @self obj_player
function scr_player_state_sjumpland_step()
{
    moveSpeed = 0
    velocityX = 0
    velocityY = 0
    
    if floor(image_index) >= 6
    {
        sprite_index = spriteGet("machfreefall")
        image_speed = 0.35
        stateSwitch(PlayerStates.JUMP, "fromsprite")
        return
    }
    return;
}
