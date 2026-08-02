/// @self object
/// @param {Real} positionX
/// @param {Real} positionY
/// @returns {bool}
function scr_solid(positionX, positionY)
{
    static instanceList = global.instanceList
    static collidedMap = scr_get_collided_map()
    
    var oldPositionX = x;
    var oldPositionY = y;
    var collidables = [obj_solid, obj_slope]
    
    x = positionX
    y = positionY
    
    if y > oldPositionY
        array_push(collidables, obj_platform)
    
    var collidablesLength = array_length(collidables)
    
    if (collidablesLength > 0)
    {
        var collisions = instance_place_list(x, y, collidables, instanceList, true)
        var collided = false
        
        for (var index = 0; index < collisions; index++)
        {
            var collidedInstance = ds_list_find_value(instanceList, index)
            var collidedIndex = collidedInstance.object_index
            var collidedFunction = collidedMap[$ string(collidedIndex)]
            
            if (!is_undefined(collidedFunction))
                collided = collidedFunction(collidedInstance, oldPositionX, oldPositionY)
            else {
            	collided = true
            }
            
            continue
        }
        
        if collided
        {
            ds_list_clear(instanceList)
            x = oldPositionX
            y = oldPositionY
            return true
        }
        
        ds_list_clear(instanceList)
    }
    
    x = oldPositionX
    y = oldPositionY
    
    return false
}

function scr_get_collided_map()
{
    var collidedMap = {}
    
    collidedMap[$ string(obj_platform)] = scr_collided_platform
    collidedMap[$ string(obj_slope)] = scr_collided_slope
    
    return collidedMap;
}

/// @self object
/// @param {Asset.GMObject} object
/// @param {Real} oldX
/// @param {Real} oldY
/// @returns {bool}
function scr_collided_platform(object, oldX, oldY)
{
    
    if (place_meeting(x, oldY, object))
        return false
    
    return true
}

/// @self object
/// @param {Asset.GMObject} object
/// @param {Real} oldX
/// @param {Real} oldY
/// @returns {bool}
function scr_collided_slope(object, oldX, oldY)
{
    
    with (object)
    {

        var objectSide = 0
        var slopeStart = 0;
        var slopeEnd = 0;
        
        if (image_xscale > 0)
        {
            objectSide = other.bbox_right
            slopeStart = bbox_bottom
            slopeEnd = bbox_top
        }
        else 
        {
        	objectSide = other.bbox_left
            slopeStart = bbox_top
            slopeEnd = bbox_bottom
        }
        
        var slopeGradient = (sign(image_xscale) * (bbox_bottom - bbox_top)) / (bbox_right - bbox_left);
        var slopeY = slopeStart - round(slopeGradient * (objectSide - bbox_left));
        
        if other.bbox_bottom >= slopeY
            return true
        
    }
    
    return false
}