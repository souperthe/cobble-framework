/// @self obj_player
/// @return {bool}
function scr_player_wallcheck()
{
    var xCheck = x + velocityX
    var xStep = x + sign(velocityX)
    var touchingMetalBlock = place_meeting(xCheck, y, obj_metalblock)
    var touchingDestructible = place_meeting(xCheck, y, obj_destructible)
    
    if touchingMetalBlock && stateCurrentEnum == PlayerStates.MACH3
        return false
    
    if touchingDestructible
        return false
    
    if !grounded
    {
        
        var airborneSolid = place_meeting(xCheck, y, obj_solid)
        var airborneSlope = scr_solid_slope(xCheck, y)
        
        return airborneSolid || airborneSlope
    }
    
    if grounded
    {
        
        var onSlope = place_meeting(x, y + 1, obj_slope)
        var groundedSolid = place_meeting(xStep, y - 16, obj_solid)
        var groundedSlope = scr_solid_slope(xStep, y - 16)
        
        return onSlope && (groundedSolid || groundedSlope)
    }
    
    return false
}


/// @self obj_player
/// @return {bool}
function scr_player_wallcheck_bump()
{
    var checkX = x + scaleX; 
    var stepOffset = 2;
    var checkY = y - stepOffset; 
    
    var meetingSolid = scr_solid(checkX, checkY);
    var meetingSlope = place_meeting(checkX, checkY, obj_slope);
    var onSlope = scr_solid_slope(checkX, checkY);
    
    return meetingSolid && !meetingSlope && !onSlope;
}

/// @self obj_player
/// @return {bool}
function scr_player_wallcheck_bump_mach()
{
    
    var xStep = x + sign(velocityX)
    
    var facingSolid = scr_solid(x + scaleX, y);
    var meetingSolid = scr_solid_slope(xStep, y) || place_meeting(xStep, y - 30, obj_solid);
    var meetingSlope = instance_place(xStep, y, obj_slope)
    var touchingDestructible = place_meeting(xStep, y, obj_destructible)
    
    if touchingDestructible
        return false
    
    return grounded && facingSolid && meetingSolid && !meetingSlope
}