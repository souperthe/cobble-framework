/// @self obj_baddie
function scr_baddie_state_grabbed()
{
    sprite_index = spriteGrabbed
    velocityX = 0
    velocityY = 0
    
    if grabbedBy.stateCurrentEnum == PlayerStates.FINISHINGBLOW
    {
        x = grabbedBy.x + (grabbedBy.scaleX * 60);
        y = grabbedBy.y - 10
        return
    }
    
    static grabbedYOffset = [0, 10, 20, 30, 35]
    
    x = grabbedBy.x
    
    
    if grabbedBy.sprite_index != grabbedBy.spriteGet("haulingstart")
        y = grabbedBy.y - 40
    else {
        
        var haulFrame = floor(grabbedBy.image_index)
        
        if haulFrame <= grabbedBy.image_number
        {
            var offset = grabbedYOffset[haulFrame]
        
            y = grabbedBy.y - offset
        }
    }
    
    scaleX = grabbedBy.scaleX
    return
}