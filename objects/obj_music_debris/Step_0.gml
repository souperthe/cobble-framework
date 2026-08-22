for (var index = 0; index < array_length(sounds); index++)
{
    var sound = sounds[index]
    var soundGain = audio_sound_get_gain(sound)
    var soundLength = audio_sound_length(sound)
    
    if soundGain > 0
        continue
    
    array_delete(sounds, index, 1)
    
    trace("cleared : ", sound)
    
    audio_stop_sound(sound)
    delete sound
    continue
}