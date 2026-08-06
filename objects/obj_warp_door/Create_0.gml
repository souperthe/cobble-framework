targetDoor = ""
playerTouching = obj_player
playerStateWhitelist = [PlayerStates.NORMAL, PlayerStates.MACH2, PlayerStates.MACH3]
playerCanEnter = function(player)
{
    
    if instance_exists(obj_room_warp)
        return false
    
    if !array_contains(playerStateWhitelist, player.stateCurrentEnum)
        return false
    
    if !player.grounded
        return false
    
    return true
}