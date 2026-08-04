/// @self obj_baddie
function scr_baddie_state_grabbed()
{
    sprite_index = spriteGrabbed
    velocityX = 0
    velocityY = 0
    
    static grabbedYOffset = [0, 10, 20, 30]
    
    x = grabbedBy.x
    
    
    if grabbedBy.sprite_index != grabbedBy.spriteGet("haulingstart")
        y = grabbedBy.y - 40
    else {
        
        var haulFrame = floor(grabbedBy.image_index)
        
        if haulFrame <= image_number
        {
            var offset = grabbedYOffset[haulFrame]
        
            y = grabbedBy.y - offset
        }
    }
    
    scaleX = grabbedBy.scaleX
    return
}