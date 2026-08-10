/// @param {Real} targetX
/// @param {Real} targetY
/// @param {Asset.GMSprite} targetSprite
/// @param {Real} targetFrame
/// @param {Id.Instance} targetObject
/// @param {Enum.AfterImageType} targetType
function AfterImage(targetX, targetY, targetSprite, targetFrame, targetObject, targetType) constructor 
{
    x = targetX
    y = targetY
    blend = c_white
    sprite = targetSprite
    frame = targetFrame
    alpha = 1
    render = true
    scaleX = 1
    scaleY = 1
    object = targetObject
    type = targetType
    stepX = 0
    stepY = 0
    shader = undefined
    depth = 0
    alarm = []
    return
}


function scr_afterimage_mach()
{
    var afterImageManager = obj_afterimage_manager
    var afterImageNew = new AfterImage(x, y, sprite_index, image_index, self, AfterImageType.MACH)
    afterImageNew.scaleX = scaleX
    afterImageNew.scaleY = scaleY
    afterImageNew.blend = choose(global.colorMach1, global.colorMach2)
    afterImageNew.shader = shd_binary_threshold
    afterImageNew.depth = depth + 1
    afterImageNew.alarm[0] = 17
    afterImageNew.alarm[1] = 6
    afterImageNew.alarm[2] = -1
    
    array_push(afterImageManager.afterimageActive, afterImageNew)
    
    return afterImageNew
}

function scr_afterimage_blur()
{
    var afterImageManager = obj_afterimage_manager
    var afterImageNew = new AfterImage(x, y, sprite_index, image_index, self, AfterImageType.BLUR)
    afterImageNew.scaleX = scaleX
    afterImageNew.scaleY = scaleY
    afterImageNew.blend = c_white
    afterImageNew.depth = depth + 1
    afterImageNew.alpha = 0.8
    afterImageNew.shader = global.shaderPalette
    
    array_push(afterImageManager.afterimageActive, afterImageNew)
    
    return afterImageNew
}

/// @param {Struct.AfterImage} afterImage
function scr_afterimage_free(afterImage)
{
    var afterImageManager = obj_afterimage_manager
    var afterImageIndex = array_get_index(afterImageManager.afterimageActive, afterImage)
    
    array_delete(afterImageManager.afterimageActive, afterImageIndex, 1)
    return
}