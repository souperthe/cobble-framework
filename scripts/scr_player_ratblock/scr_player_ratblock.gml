/// @self obj_player
function scr_player_ratblock()
{
    
    if distance_to_object(obj_ratblock) > 200
        return
    
    var ratTouching = instance_place(x + scaleX, y, obj_ratblock)
    
    if !ratTouching
        ratTouching = instance_place(x + (scaleX * moveSpeed), y, obj_ratblock)
    
    var ratStates = [PlayerStates.CHAINSAWDASH, PlayerStates.CHAINSAWATTACK]
    
    if !array_contains(ratStates, stateCurrentEnum)
        return
    
    if ratTouching
    {
        ratTouching.hitX = x
        instance_destroy(ratTouching)
    }
    
    
    return
}