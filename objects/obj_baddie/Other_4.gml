if scr_save_room_contains(id)
{
    instance_destroy()
    exit;
}

if !escape
    exit;

var escapeSpawn = instance_create_depth(x, y, depth, obj_object_escape)
    
escapeSpawn.objectId = id
    
instance_deactivate_object(id)
