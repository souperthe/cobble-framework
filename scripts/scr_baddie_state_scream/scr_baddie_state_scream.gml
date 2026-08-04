/// @self obj_baddie
function scr_baddie_state_scream()
{
    
    screamTimer--
    
    if screamTimer < 0
        stateCurrent = BaddieStates.WALK
    return
}