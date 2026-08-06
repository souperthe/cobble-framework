function get_touching_door()
{
    var doorMeeting = instance_place(x, y, obj_door)

    if doorMeeting == noone
        return ""

    var doorName = object_get_name(doorMeeting.object_index)
    var doorTarget = string_replace_all(doorName, "obj_door_", "")

    return doorTarget
}