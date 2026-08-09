/// @self obj_player
function scr_player_destructibles()
{
    
    var metalBlockStates = [PlayerStates.MACH3, PlayerStates.FREEFALL]
    var destructibleStates = [PlayerStates.MACH3, PlayerStates.SUPLEXDASH, PlayerStates.MACH2, PlayerStates.MACHROLL]
    
    if array_contains(metalBlockStates, stateCurrentEnum)
    {
            
        var touchingMetalBlock = instance_place(x + scaleX, y, obj_metalblock)
    
        if touchingMetalBlock
            instance_destroy(touchingMetalBlock)
    }
    
    if array_contains(destructibleStates, stateCurrentEnum)
    {
        var touchingDestructible = instance_place(x + scaleX, y, obj_destructible)
        
        if touchingDestructible
            instance_destroy(touchingDestructible)
    }

    return
}