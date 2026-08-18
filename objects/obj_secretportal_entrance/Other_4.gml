var start = false


if global.warpDoor == "SECRET" && global.warpSecretId == id
{
    
    global.roomStartX = x
    global.roomStartY = y
    
    with obj_player
    {
        x = other.x
        y = other.y
    }
    
    active = false
    
    start = true
    instance_destroy(other)
    instance_create_depth(x, y, depth, obj_secretportal_exit)
    
}

if secret
{
    global.secretsFound++
    audio_play_sound(sfx_secretfound, 0, false)
    instance_create_depth(0, 0, depth, obj_ghostcollectibles)
}

if scr_save_room_contains(id)
{
    instance_destroy()
}