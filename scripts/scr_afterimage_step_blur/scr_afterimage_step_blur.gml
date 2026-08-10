/// @param {Struct.AfterImage} afterImage
function scr_afterimage_step_blur(afterImage)
{
    afterImage.alpha -= 0.1
    
    if afterImage.alpha <= 0
        scr_afterimage_free(afterImage)
    
    return
}