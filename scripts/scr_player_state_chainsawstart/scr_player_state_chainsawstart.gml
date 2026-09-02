/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_chainsawstart_enter(enterMessage)
{
    sprite_index = spriteGet("chainsaw_start")
    image_index = 0
    image_speed = 0.1
    
    transformationDebris = spr_pickup_chainsaw
    transformationCurrent = "chainsaw"
    
    signalTransformationEnter.fire()
    return;
}

/// @self obj_player
function scr_player_state_chainsawstart_exit()
{
    return;
}

/// @self obj_player
function scr_player_state_chainsawstart_step()
{
    
    velocityX = approach(velocityX, 0, 0.5)
    
    if is_sprite_finished()
        stateSwitch(PlayerStates.CHAINSAWNORMAL)
    return;
}
