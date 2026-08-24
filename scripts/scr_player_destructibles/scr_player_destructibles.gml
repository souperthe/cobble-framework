/// @self obj_player
function scr_player_destructibles()
{
    
    var metalBlockStates = [PlayerStates.MACH3, PlayerStates.FREEFALL]
    var destructibleStates = [
        PlayerStates.MACH3, 
        PlayerStates.SUPLEXDASH, 
        PlayerStates.MACH2, 
        PlayerStates.MACHROLL,
        PlayerStates.CHAINSAWDASH,
        PlayerStates.CHAINSAWJUMP,
        PlayerStates.CHAINSAWNORMAL,
        PlayerStates.CHAINSAWATTACK
    ]
    var destructibleStatesUp = [
        PlayerStates.UPPERCUT,
        PlayerStates.SJUMP,
        PlayerStates.WALLCLIMB,
        PlayerStates.FREEFALL
    ]
    
    if array_contains(metalBlockStates, stateCurrentEnum)
    {
            
        var touchingMetalBlock = instance_place(x + scaleX, y, obj_metalblock)
        
        if !touchingMetalBlock
            touchingMetalBlock = instance_place(x + (scaleX * moveSpeed), y, obj_destructible)
    
        if touchingMetalBlock
            instance_destroy(touchingMetalBlock)
    }
    
    static destructibleCheckDefault = [0, 0]
    var destructibleCheck = destructibleCheckDefault
    
    if array_contains(destructibleStates, stateCurrentEnum)
    {
        destructibleCheck = [x + (scaleX * moveSpeed), y]
    }
    
    if array_contains(destructibleStatesUp, stateCurrentEnum)
    {
        destructibleCheck = [x, y + velocityY]
    }
    
    if stateCurrentEnum == PlayerStates.JUMP
    {
        destructibleCheck = [x, y - 1]
    }
    
    if destructibleCheck == destructibleCheckDefault
    {
        return
    }
    
    var destructibleCheckX = destructibleCheck[0]
    var destructibleCheckY = destructibleCheck[1]
    var destructibleTouching = instance_place(destructibleCheckX, destructibleCheckY, obj_destructible)
    
    if destructibleTouching
        instance_destroy(destructibleTouching)
    
    return
}