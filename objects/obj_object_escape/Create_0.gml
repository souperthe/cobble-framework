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
    
    if !global.panic || !global.roomPlaced
    {
        visible = false
        exit;
    }
    
    visible = false
    image_index = 0
    instance_deactivate_object(objectId)
    
    var playerDistance = distance_to_object(obj_player)
    
    if playerDistance > 500
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
            objectId.staggeredTimer = 20
            objectId.sprite_index = objectId.spriteStun
            objectId.stateCurrent = BaddieStates.STAGGERED
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