audioGroups = [audiogroup_sfx, audiogroup_music]
audioGroupsLoaded = 0;
audioGroupsLength = array_length(audioGroups)

for (var index = 0; index < audioGroupsLength; index++)
{
    var audioGroup = audioGroups[index]
    audio_group_load(audioGroup)
    
    continue
}




onAudioGroupsLoaded = function()
{
    var instances = [
        obj_input_manager, 
        obj_screensizer, 
        obj_camera, 
        obj_music, 
        obj_hud_tv, 
        obj_hud_score,
        obj_hud_combo,
        obj_hud_rank,
        obj_hud_timer,
        obj_effects_manager,
        obj_debris_manager,
        obj_afterimage_manager,
        obj_parrallax,
        obj_pause,
        obj_temp_emitters,
        obj_controllerwatcher,
        obj_collisionview
    ]
    
    var instancesLength = array_length(instances)
    scr_globals();

    for (var index = 0; index < instancesLength; index++)
    {
        var instance = instances[index]
        instance_create_depth(0, 0, 0, instance)
        continue
    }

    room_goto(rm_test)
    return
}