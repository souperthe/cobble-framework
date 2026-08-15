function is_sprite_finished(){
    return (floor(image_index) == (image_number - 1))
}

/// @param {Asset.GMObject} object
/// @return {Real}
function get_gui_position_x(object)
{
    
    var camera = view_camera[0]
    var cameraPositionX = camera_get_view_x(camera)
    var cameraSizeX = camera_get_view_width(camera)
    
    var displaySizeX = display_get_gui_width()
    
    return (object.x - cameraPositionX) * (displaySizeX / cameraSizeX)
}

/// @param {Asset.GMObject} object
/// @return {Real}
function get_gui_position_y(object)
{
    
    var camera = view_camera[0]
    var cameraPositionY = camera_get_view_y(camera)
    var cameraSizeY = camera_get_view_height(camera)
    
    var displaySizeY = display_get_gui_height()
    
    return (object.y - cameraPositionY) * (displaySizeY / cameraSizeY)
}


/// @param {Array} objects
function instance_destroy_list(objects)
{
    var objectsLength = array_length(objects)
    
    for (var index = 0; index < objectsLength; index++)
    {
        var object = objects[index]
        
        instance_destroy(object)
        continue
    }
    return
}