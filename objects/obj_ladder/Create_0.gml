statesAllowed = [PlayerStates.NORMAL, PlayerStates.JUMP]
climbEnter = function(player)
{
    
    if !array_contains(statesAllowed, player.stateCurrentEnum)
        return false
    
    if player.stateCurrent == PlayerStates.CLIMB
        return false
    
    player.stateSwitch(PlayerStates.CLIMB)
    player.x = x + 16;
    player.y = floor(player.y);
    
    if (player.y % 2) == 1
        player.y -= 1
    return true
}