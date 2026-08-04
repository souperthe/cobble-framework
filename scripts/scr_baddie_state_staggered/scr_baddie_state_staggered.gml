/// @self obj_baddie
function scr_baddie_state_staggered()
{
    
    if grounded
        velocityX = approach(velocityX, 0, 1)
    
    staggeredTimer--
    
    if staggeredTimer < 0
        stateCurrent = BaddieStates.WALK

    return
}