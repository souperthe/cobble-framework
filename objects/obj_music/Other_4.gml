var roomName = room_get_name(room)
var roomMusic = struct_get(musicLibrary, roomName)

if roomMusic == undefined
    exit

if global.panic
    exit

if !roomMusic.fade || !audio_is_playing(musicInstanceCurrent)
{
    audio_stop_sound(musicInstanceCurrent)
    musicInstanceCurrent = audio_play_sound(roomMusic.song, 0, true)
    exit
}

var musicInstanceOld = musicInstanceCurrent
var musicTrackLength = audio_sound_length(musicInstanceOld)
var musicTrackPosition = audio_sound_get_track_position(musicInstanceOld)
var musicTrackAveragePosition = musicTrackPosition / musicTrackLength

audio_sound_gain(musicInstanceOld, 0, musicFadeTime)
musicInstanceCurrent = audio_play_sound(roomMusic.song, 0, true, 0)
var newMusixTrackLength = audio_sound_length(musicInstanceCurrent)

audio_sound_gain(musicInstanceCurrent, 1, musicFadeTime)
audio_sound_set_track_position(musicInstanceCurrent, musicTrackAveragePosition * newMusixTrackLength)