

repeat amount
{
    var content = instance_create_depth(x, y, depth, object)

    trace(object_get_name(object))
    
    if object_is_ancestor(content.object_index, obj_follower)
        content.playerFollowing = other
    
    if object_is_ancestor(content.object_index, obj_toppin)
    {
        super_sound_oneshot_global(sfx_collecttoppin)
        global.comboTime = 60
        global.collect += 1000
        obj_hud_score.smallNumber(x, y, 1000)
        
        array_push(global.toppinFollowers, content.toppinName)
    }
}

instance_destroy()