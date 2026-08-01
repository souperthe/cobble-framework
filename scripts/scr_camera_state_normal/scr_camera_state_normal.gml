/// @self obj_camera
function scr_camera_state_normal()
{
    var target = obj_player
    var targetX = target.x + offsetX
    var targetY = target.y + offsetY
    
    var camera = view_camera[0]
    var cameraWidth = camera_get_view_width(camera)
    var cameraHeight = camera_get_view_height(camera)
    var cameraX = targetX
    var cameraY = targetY
    
    
    centerX = cameraX + (cameraWidth / 2)
    centerY = cameraY + (cameraHeight / 2)
    
    if cameraWidth > room_width
        cameraX += ((cameraWidth - room_width) / 2)
    
    if cameraHeight > room_height
        cameraY += ((cameraHeight - room_height) / 2)
    
    camera_set_view_pos(camera, cameraX, cameraY)
    return
}