/// @self obj_player
function scr_player_metalblock()
{
    
    static metalBlockStates = [PlayerStates.MACH3, PlayerStates.FREEFALL]
    
    if !array_contains(metalBlockStates, stateCurrentEnum)
    {
        return
    }
    
    static metalBlockDirectionDefault = [0, 0]
    var metalBlockDirection = metalBlockDirectionDefault
    
    
    if stateCurrentEnum == PlayerStates.MACH3
    {
        metalBlockDirection = [x + (scaleX * moveSpeed), y]
    }
    else if stateCurrentEnum == PlayerStates.FREEFALL
    {
        
        if freeFallProgress > 10
            metalBlockDirection = [x, y + 1]
        
    }
    
    
    if metalBlockDirection == metalBlockDirectionDefault
    {
        return
    }
    
    
    var metalBlockDirectionX = metalBlockDirection[0]
    var metalBlockDirectionY = metalBlockDirection[1]
    var metalBlockTouching = instance_place(metalBlockDirectionX, metalBlockDirectionY, obj_metalblock)
    
    if metalBlockTouching
        instance_destroy(metalBlockTouching)
    
    return
}