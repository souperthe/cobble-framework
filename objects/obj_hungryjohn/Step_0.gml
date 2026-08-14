sprite_index = spriteNormal

var playerNearest = collision_circle(x, y, 400, obj_player, false, true);

if playerNearest == noone
    exit

playerX = playerNearest.x

if !array_contains(scaredStates, playerNearest.stateCurrentEnum)
    exit

sprite_index = spriteScared