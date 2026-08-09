debrisActive = []



debrisFunctionLoop = function(targetFunction)
{
    
    for (var index = 0; index < array_length(debrisActive); index++)
    {
        var debris = array_get(debrisActive, index)
        
        targetFunction(debris)
        continue
    }
    
    return
}

/// @param {Struct.Debris} debris
debrisStep = function(debris)
{
    
    var debrisIndex = array_get_index(debrisActive, debris)
    
    if debris.velocityY < 20
        debris.velocityY += debris.grav
    
    debris.x += debris.velocityX
    debris.y += debris.velocityY
    debris.angle += (debris.velocityX / 2)
    
    if debris.animate
        debris.spriteFrame += debris.animateSpeed
    
    var outOfX = debris.x > (room_width + debris.spriteWidth) || debris.x < -debris.spriteWidth
    var outOfY = debris.y > (room_width + debris.spriteHeight) || debris.y < -debris.spriteHeight
    
    if (outOfX || outOfY)
    {
        array_delete(debrisActive, debrisIndex, 1)
    }
    return
}

/// @param {Struct.Debris} debris
debrisDraw = function(debris)
{
    draw_sprite_ext(debris.spriteIndex, debris.spriteFrame, debris.x, debris.y, 1, 1, debris.angle, c_white, 1)
    return
}
