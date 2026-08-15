if scr_save_room_contains(id)
    exit

var debrisIndex = 0
var debrisPositions = []
debrisPositions[0] = [0, -32]
debrisPositions[1] = [0, 32]
debrisPositions[2] = [-10, 0]
debrisPositions[3] = [0, 0]
debrisPositions[4] = [10, 0]

repeat 5
{
    var debris = scr_debris_create(x, y, spr_debris_cage)
    var debrisPosition = debrisPositions[debrisIndex]
    
    debris.debrisIndex = debrisIndex
    debris.x = x + debrisPosition[0]
    debris.y = y + debrisPosition[1]
    debris.velocityY = random_range(-5, -10)
    debris.velocityX = random_range(-5, 5)
    
    debrisIndex += 1
}

super_sound_oneshot_list(x, y, [sfx_breakblock1, sfx_breakblock2])



scr_save_room_register(id)