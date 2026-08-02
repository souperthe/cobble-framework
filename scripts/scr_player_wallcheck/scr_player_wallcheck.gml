/// @self obj_player
/// @return {bool}
function scr_player_wallcheck()
{
    var xCheck = x + velocityX
    var xStep = x + sign(velocityX)
    
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