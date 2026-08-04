if ds_map_find_value(async_load, "type") != "audiogroup_load"
    exit

var audioGroupLoaded = ds_map_find_value(async_load, "group_id")
audioGroupsLoaded += 1


if audioGroupsLoaded <= audioGroupsLength
    exit

onAudioGroupsLoaded()

