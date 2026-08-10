/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_chainsawpogo_enter(enterMessage)
{
    sprite_index = spriteGet("chainsaw_pogostart")
    image_index = 0
    
    if enterMessage != "nojump"
        velocityY = -4

    return;
}

/// @self obj_player
function scr_player_state_chainsawpogo_exit()
{
    return;
}

/// @self obj_player
function scr_player_state_chainsawpogo_step()
{
    image_speed = 0.35
    
    var move = check_input("right", true) - check_input("left", true)
    
    var pogoOneshots = [spriteGet("chainsaw_pogobounce"), spriteGet("chainsaw_pogostart")]
    
    if array_contains(pogoOneshots, sprite_index) && is_sprite_finished()
    {
        sprite_index = spriteGet("chainsaw_pogoloop")
    }
    
    if check_input("attack", false)
    {
        stateSwitch(PlayerStates.CHAINSAWATTACK)
        return
    }
    
    if grounded
    {
        if !check_input("jump", true)
        {
            stateSwitch(PlayerStates.CHAINSAWDASH, "frompogo")
            return
        }
        
        velocityY = -12
        sprite_index = spriteGet("chainsaw_pogobounce")
        super_sound_oneshot_emitter(emitter, sfx_killingblow, random_pitch())
    }
    else 
    {
    	velocityX = approach(velocityX, move * 15, 0.2)
        
        if move != 0
            scaleX = move
    }
    return;
}
