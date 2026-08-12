/// @self obj_baddie
function scr_baddie_state_thrown()
{
    velocityX = thrownX
    velocityY = thrownY
    
    sprite_index = spriteDead
    var stepX = x + sign(velocityX)
    var stepY = y + sign(velocityY)
    
    collide = false
    
    
    var destructible = instance_place(stepX, stepY, obj_destructible)
    
    if destructible
    {
        instance_destroy(destructible)
        return
    }
    
    if scr_solid(stepX, stepY)
    {
        killedFromX = x + velocityX
        instance_destroy()
    }
    
    thrownAfterImageTimer--
    
    if thrownAfterImageTimer < 0
    {
        var afterImage = scr_afterimage_blur()
        afterImage.shader = undefined
        thrownAfterImageTimer = 0.5
    }
    return
}