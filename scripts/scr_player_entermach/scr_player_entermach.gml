/// @self obj_player
function scr_player_entermach()
{
    stateSwitch(PlayerStates.MACH2, "start")
    return;
}