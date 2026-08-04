/// @self obj_baddie
function scr_baddie_state_turn()
{
    
    if !is_sprite_finished()
        return
    
    scaleX = scaleX * -1
    image_xscale = scaleX
    stateCurrent = BaddieStates.WALK
    turnBuffer = 50

    return
}