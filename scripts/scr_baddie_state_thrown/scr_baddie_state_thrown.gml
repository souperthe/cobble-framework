/// @self obj_baddie
function scr_baddie_state_thrown()
{
    sprite_index = spriteDead
    
    if scr_solid(x + velocityX, y + velocityY)
    {
        killedFromX = x + velocityX
        instance_destroy()
    }
    return
}