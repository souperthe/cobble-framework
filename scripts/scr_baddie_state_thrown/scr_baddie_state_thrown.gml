/// @self obj_baddie
function scr_baddie_state_thrown()
{
    sprite_index = spriteDead
    var stepX = x + sign(velocityX)
    var stepY = y + sign(velocityY)
    
    collide = false
    
    if scr_solid(stepX, stepY)
    {
        killedFromX = x + velocityX
        instance_destroy()
    }
    return
}