/// @param {Struct.AfterImage} afterImage
function scr_afterimage_step_color(afterImage)
{
    afterImage.alpha -= 0.05
    
    if afterImage.alpha <= 0
        scr_afterimage_free(afterImage)
    
    return
}