/// @self obj_camera
function scr_camera_state_normal()
{
    var target = obj_player
    
    if !instance_exists(target)
    {
        return
    }
    
    var shakeX = random_range(-shakeAmount, shakeAmount)
    var shakeY = random_range(-shakeAmount, shakeAmount)
    var targetX = (target.x + offsetX) + machOffsetX
    var targetY = (target.y + offsetY) + machOffsetY
    
    var camera = view_camera[0]
    var cameraWidth = camera_get_view_width(camera)
    var cameraHeight = camera_get_view_height(camera)
    var cameraX = targetX - (cameraWidth / 2)
    var cameraY = targetY - (cameraHeight / 2)
    
    cameraX = clamp(cameraX, 0, room_width  - cameraWidth);
    cameraY = clamp(cameraY, 0, room_height - cameraHeight);
    
    camera_set_view_pos(camera, cameraX + shakeX, cameraY + shakeY)
    
    
    if target.stateCurrentEnum != PlayerStates.HITSUN
        offsetXTarget = 0
    
    offsetYTarget = 0
    
    if target.stateCurrentEnum == PlayerStates.MACH2
        offsetXTarget = 50 * target.scaleX
    else if target.stateCurrentEnum == PlayerStates.MACH3
    {
        
        var offsetTarget = 80
        if target.machCrazy
        {
            offsetTarget = 150
        }
        
        offsetXTarget = offsetTarget * target.scaleX
    }
    
    machOffsetX = lerp(machOffsetX, offsetXTarget, 0.01)
    return
}