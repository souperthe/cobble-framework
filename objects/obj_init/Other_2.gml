audio_group_load(audiogroup_sfx)
audio_group_load(audiogroup_music)
instances = [obj_input_manager, obj_screensizer, obj_camera, obj_tv, obj_music]
scr_globals();

for (var index = 0; index < array_length(instances); index++)
{
    var instance = instances[index]
    instance_create_depth(0, 0, 0, instance)
    continue
}

room_goto(rm_test)