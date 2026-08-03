/// @self obj_player
function scr_player_attack()
{
    
    if check_input("up", true) && uppercutAllow
    { 
        stateSwitch(PlayerStates.UPPERCUT)
        return
    }
    
    stateSwitch(PlayerStates.SUPLEXDASH)
    return
}