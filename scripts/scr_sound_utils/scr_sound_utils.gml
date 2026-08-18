/// @param {Asset.GMSound | Id.Sound} index
/// @return {Real}
function audio_sound_get_average_position(index)
{
    var musicTrackLength = audio_sound_length(index)
    var musicTrackPosition = audio_sound_get_track_position(index)
    
    return musicTrackPosition / musicTrackLength
}
