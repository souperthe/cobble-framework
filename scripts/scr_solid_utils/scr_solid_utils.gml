
/// @param {Real} xStep
/// @param {Real} yStep
/// @param {Real} maxSteps
/// @return {Real}
function try_solid(xStep, yStep, maxSteps)
{
    
    var xOld = x;
    var yOld = y;
    var freeStepCount = -1;
    
    for (var index = 0; index < maxSteps; index++)
    {
        x += xStep
        y += yStep
        
        if (!scr_solid(x, y))
        {
            freeStepCount = index + 1
            break
        }
        
        continue
    }
    
    x = xOld
    y = yOld
    return freeStepCount
}


/// @self obj_player
/// @param {Real} maxClimbHeight
/// @param {Real} forwardCheckDistance
function ledge_bump(maxClimbHeight, forwardCheckDistance = 4)
{
    var xOld = x
    var yOld = y
    
    x += (scaleX * forwardCheckDistance)
    
    var climbOffset = try_solid(0, -1, maxClimbHeight)
    
    x = xOld;
    
    if climbOffset != -1
    {
        y -= climbOffset
        x += scaleX
        
        if (scr_solid(x, y))
        {
            x = xOld
            y = yOld
            return true
        }
        
        with (obj_camera)
            offsetY += climbOffset
        
        return false
    }
    
    return true
}


/// @self object
/// @returns {bool}
function scr_slope()
{
    y++
    
    var slope = instance_place(x, y, obj_slope)
    
    if slope
        return scr_collided_slope(slope, 0, 0)
    
    y--;
    return false
}

/// @param {Real} xTarget
/// @param {Real} yTarget
/// @self obj_player
function scr_solid_slope(xTarget, yTarget)
{
    
    var xOld = x;
    var yOld = y;
    x = xTarget
    y = yTarget
    
    var slope = instance_place(x, y, obj_slope)
    
    if slope
    {
        
        if scr_collided_slope(slope, 0, 0)
        {
            var slopeDirection = sign(slope.image_xscale)
            
            if slope != scaleX
            {
                x = xOld
                y = yOld
                return true
            }
        }
        
    }
    
    x = xOld
    y = yOld
    return false
}

/// @self obj_player
function find_ground()
{
    
    var xOld = x
    var yOld = y
    var checks = 0
    
    while !scr_solid(x + scaleX, y)
    {
        checks++
        y++
        
        if scr_solid(x + scaleX, y)
        {
            y--
            
            if check_input("attack", true)
                y -= 11
            
            break
        }
        
        if checks > 40
        {
            x = xOld
            y = yOld
            break
        }
        
    }
    return
}