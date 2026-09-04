/// @self obj_baddie
function scr_baddie_state_chase()
{
    var playerTarget = instance_nearest(x, y, obj_player)
    var playerDirection = -sign(x - playerTarget.x)
    
    if x != playerTarget.x && scaleX != playerDirection
    {
        scaleX = playerDirection
        momentum = -scaleX * (moveSpeed + 4)
    }
    
    velocityX = (scaleX * moveSpeed) + momentum
    momentum = approach(momentum, 0, 0.1)
    
    sprite_index = spriteWalk
        
    return
}