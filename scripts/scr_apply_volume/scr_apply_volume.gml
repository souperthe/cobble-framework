function scr_apply_volume()
{
    
    var volumeMusic = global.volumeMaster * global.volumeMusic
    var volumeSound = global.volumeMaster * global.volumeSound
    
    
    audio_group_set_gain(audiogroup_music, volumeMusic)
    audio_group_set_gain(audiogroup_sfx, volumeSound)

    return
}