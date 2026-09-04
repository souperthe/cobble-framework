/// @self obj_baddie
function scr_baddie_state_turn()
{
    
    if !is_sprite_finished()
        return

    velocityX = approach(velocityX, 0, 5)
    image_xscale = scaleX
    stateCurrent = BaddieStates.WALK
    turnBuffer = 50

    return
}