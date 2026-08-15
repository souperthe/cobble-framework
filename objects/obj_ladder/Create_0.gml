statesAllowed = [PlayerStates.NORMAL, PlayerStates.JUMP, PlayerStates.MACH2]
climbEnter = function(player)
{
    
    if !array_contains(statesAllowed, player.stateCurrentEnum)
        return false
    
    if player.stateCurrent == PlayerStates.CLIMB
        return false
    
    player.stateSwitch(PlayerStates.CLIMB)
    player.x = x + 16;
    return true
}
