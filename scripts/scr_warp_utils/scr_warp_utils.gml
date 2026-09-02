function get_touching_door()
{
    var doorMeeting = instance_place(x, y, obj_door)

    if doorMeeting == noone
        return ""
    
    return get_door(doorMeeting)
}

/// @param {Asset.GMObject | Id.Instance} doorObject
function get_door(doorObject)
{
    var doorName = object_get_name(doorObject.object_index)
    var doorTarget = string_replace_all(doorName, "obj_door_", "")
    
    return doorTarget
}
