


/// @self obj_hud_tv
function scr_tv_get_state_expressions()
{
    
    var tvStateExpressions = array_create(PlayerStates._length, undefined)
    
    tvStateExpressions[PlayerStates.MACH3] = scr_tv_state_mach3
    
    return tvStateExpressions
}