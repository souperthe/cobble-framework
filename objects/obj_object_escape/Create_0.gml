enum EscapeSpawnState 
{
    WAITING,
    SPIT,
    LEAVE
}

objectId = obj_baddie
active = false
stateCurrent = EscapeSpawnState.WAITING
states = []


states[EscapeSpawnState.WAITING] = function()
{
    
    visible = false
    image_index = 0
    instance_deactivate_object(objectId)
    
    if !global.panic
        return;
    
    if !global.roomPlaced
        return;
    
    var playerCloseset = instance_nearest(x, y, obj_player)
    var playerDistanceX = abs(x - playerCloseset.x)
    var playerDistanceY = abs(y - playerCloseset.y)
    
    if playerDistanceX > 650
        return;
    
    if playerDistanceY > 250
        return;
    
    stateCurrent = EscapeSpawnState.SPIT
    visible = true
    return
}

states[EscapeSpawnState.SPIT] = function()
{
    
    var spriteFrame = floor(image_index)
    
    if spriteFrame > 5
    {
        instance_activate_object(objectId)
        super_sound_oneshot(x, y, sfx_escapespawn, random_pitch())
        
        objectId.x = x
        objectId.y = y
        
        if objectId.escapeStun
        {
            objectId.sprite_index = objectId.spriteStun
            objectId.stateCurrent = BaddieStates.ESCAPESPAWN
        }
        stateCurrent = EscapeSpawnState.LEAVE
    }
    return
}

states[EscapeSpawnState.LEAVE] = function()
{
    
    if is_sprite_finished()
        instance_destroy()
    return
}

image_speed = 0.5