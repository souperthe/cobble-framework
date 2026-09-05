/// @param {Struct.AfterImage} afterImage
function scr_afterimage_step_supertaunt(afterImage)
{
    afterImage.x += afterImage.stepX
    afterImage.y += afterImage.stepY
    
    
    var camera = view_camera[0]
    var cameraX = camera_get_view_x(camera)
    var cameraY = camera_get_view_y(camera)
    var cameraWidth = camera_get_view_width(camera)
    var cameraHeight = camera_get_view_height(camera)
    
    if point_in_rectangle(afterImage.x, afterImage.y, cameraX, cameraY, cameraX + cameraWidth, cameraY + cameraHeight)
        return;
    
    scr_afterimage_free(afterImage)
    return
}