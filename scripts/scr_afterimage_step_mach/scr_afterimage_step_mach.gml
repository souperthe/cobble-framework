/// @param {Struct.AfterImage} afterImage
function scr_afterimage_step_mach(afterImage)
{
    
    if !array_contains(afterImage.object.machAfterImageStates, afterImage.object.stateCurrentEnum)
    {
        scr_afterimage_free(afterImage)
        return
    }
    
    var speedMin = 4
    var speedRange = 12 - speedMin
    var speedAboveMin = afterImage.object.moveSpeed - speedMin
    var speedFactor = speedAboveMin / speedMin
    speedFactor = clamp(speedFactor, 0, 1)
    
    afterImage.alpha = speedFactor
    return
}