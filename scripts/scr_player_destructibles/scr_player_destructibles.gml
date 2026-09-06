/// @self obj_player
function scr_player_destructibles()
{
    
    static destructibleStates = [
        PlayerStates.MACH3, 
        PlayerStates.SUPLEXDASH, 
        PlayerStates.MACH2, 
        PlayerStates.MACHROLL,
        PlayerStates.CHAINSAWDASH,
        PlayerStates.CHAINSAWJUMP,
        PlayerStates.CHAINSAWNORMAL,
        PlayerStates.CHAINSAWATTACK,
        PlayerStates.NOCLIP,
    ]
    static destructibleStatesVerical = [
        PlayerStates.SJUMP,
        PlayerStates.WALLCLIMB,
        PlayerStates.FREEFALL
    ]
    
    static destructibleCheckDefault = [0, 0]
    var destructibleCheck = destructibleCheckDefault
    
    if array_contains(destructibleStates, stateCurrentEnum)
    {
        destructibleCheck = [x + velocityX, y]
    }
    
    if array_contains(destructibleStatesVerical, stateCurrentEnum)
    {
        destructibleCheck = [x, y + velocityY]
    }
    
    if stateCurrentEnum == PlayerStates.JUMP
    {
        destructibleCheck = [x, y - 1]
    }
    
    if stateCurrentEnum == PlayerStates.UPPERCUT && velocityY < 0
    {
        destructibleCheck = [x, y + velocityY]
    }
    
    if sprite_index = spriteGet("dive") || stateCurrentEnum == PlayerStates.TRICKJUMP || stateCurrentEnum == PlayerStates.NOCLIP
        destructibleCheck = [x + velocityX, y + velocityY]
    
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