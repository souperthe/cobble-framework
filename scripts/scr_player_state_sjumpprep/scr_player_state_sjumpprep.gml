/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_sjumpprep_enter(enterMessage)
{
    velocityX = 0
    sprite_index = spriteGet("superjumpprep")
    image_index = 0
    image_speed = 0.35
    soundSuperJump = 0
    soundSuperPrepSound = super_sound_oneshot_emitter(emitter, sfx_superjumpprep)
    return;
}

/// @self obj_player
function scr_player_state_sjumpprep_exit()
{
    audio_stop_sound(soundSuperJump)
    return;
}

/// @self obj_player
function scr_player_state_sjumpprep_step()
{
    
    var move = check_input("right", true) - check_input("left", true)
    
    if sprite_index == spriteGet("superjumpprep")
    {
        velocityX = scaleX * moveSpeed
        moveSpeed = approach(moveSpeed, 0, 1)
        
        if is_sprite_finished()
        {
            audio_stop_sound(soundSuperPrepSound)
            sprite_index = spriteGet("superjumppreplight")
            soundSuperJump = super_sound_loop_emitter(emitter, sfx_superjumphold)
        }

        return
    }
    
    velocityX = move * 2
    
    static movementRight = {
        "right" : spriteGet("superjumpright"),
        "left" : spriteGet("superjumpleft")
    }
    
    static movementLeft = {
        "right" : spriteGet("superjumpleft"),
        "left" : spriteGet("superjumpright")
    }
    
    var movementCurrent = movementRight
    
    if scaleX == -1
        movementCurrent = movementLeft
    
    if move == 1
        sprite_index = movementCurrent.right
    else if move == -1
        sprite_index = movementCurrent.left
    else
        sprite_index = spriteGet("superjumppreplight")
    
    if (!check_input("up", true)) && grounded
    {
        stateSwitch(PlayerStates.SJUMP)
        return
    }
    
    return;
}
