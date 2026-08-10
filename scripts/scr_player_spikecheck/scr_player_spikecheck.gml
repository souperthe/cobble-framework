/// @self obj_player
function scr_player_spikecheck()
{
    
    if distance_to_object(obj_spike) > 500
        return
    
    static directions = [
        [0, 1],
        [0, -1],
        [1, 0],
        [-1, 0]
    ]
    static directionsLength = array_length(directions)
    
    for (var index = 0; index < directionsLength; index++)
    {
        var directionCurrent = directions[index]
        var directionX = directionCurrent[0]
        var directionY = directionCurrent[1]
        var spikeTouching = instance_place(x + directionX, y + directionY, obj_spike)
        
        if spikeTouching == noone
            continue
        
        scr_player_hurt(spikeTouching)
        
        if spikeTouching.fake
            instance_destroy(spikeTouching)
        
        break
    }

    return
}
