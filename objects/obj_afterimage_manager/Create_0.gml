afterimageActive = []
afterimageSteps = array_create(AfterImageType._length, -4)
afterimageSteps[AfterImageType.MACH] = scr_afterimage_step_mach
afterimageSteps[AfterImageType.BLUR] = scr_afterimage_step_blur


afterimageAlarm = []
afterimageAlarm[0] = scr_afterimage_alarm_zero
afterimageAlarm[1] = scr_afterimage_alarm_one
afterimageAlarm[2] = scr_afterimage_alarm_two



afterimageFunctionLoop = function(targetFunction)
{
    
    for (var index = 0; index < array_length(afterimageActive); index++)
    {
        var afterImage = array_get(afterimageActive, index)
        
        targetFunction(afterImage)
        
        continue
    }
    
    return
}

/// @param {Struct.AfterImage} afterImage
afterimageStep = function(afterImage)
{
    
    var afterImageFunction = afterimageSteps[afterImage.type]
    var afterImageAlarms = array_length(afterImage.alarm)
    
    if afterImageFunction != 4
        afterImageFunction(afterImage)
    
    for (var index = 0; index < afterImageAlarms; index++)
    {
        if afterImage.alarm[index] >= 0
            afterImage.alarm[index]--
        else
            afterimageAlarm[index](afterImage)
        
        continue
    }
    
    
    return
}

/// @param {Struct.AfterImage} afterImage
afterimageDraw = function(afterImage)
{
    
    if !afterImage.render
        return
    
    if afterImage.shader != undefined
    {
        shader_set(afterImage.shader)
        
        if afterImage.shader == global.shaderPalette
        {
            pal_swap_set(afterImage.object.paletteSprite, afterImage.object.paletteIndex)
        }
    }
    
    var depthOld = gpu_get_depth()
    
    gpu_set_depth(afterImage.depth)
    
    draw_sprite_ext(
        afterImage.sprite, 
        afterImage.frame, 
        afterImage.x, 
        afterImage.y, 
        afterImage.scaleX, 
        afterImage.scaleY,
        0,
        afterImage.blend,
        afterImage.alpha
    )
    
    if afterImage.shader != undefined
        shader_reset()
    
    gpu_set_depth(depthOld)
    
    return
}
