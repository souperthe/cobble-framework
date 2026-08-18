var roomName = room_get_name(room)
var roomMusic = struct_get(musicLibrary, roomName)
var roomSecretMusic = struct_get(musicSecretLibrary, roomName)


if roomSecretMusic != undefined
{
    musicLastPosition = audio_sound_get_track_position(musicInstanceCurrent)
    musicInstanceSecret = audio_play_sound(roomSecretMusic.song, 0, true, 0)
    
    var musicSoundAveragePosition = audio_sound_get_average_position(musicInstanceCurrent)
    var secretLength = audio_sound_length(roomSecretMusic.song)
    
    audio_sound_set_track_position(musicInstanceSecret, musicSoundAveragePosition * secretLength)
    
    audio_sound_gain(musicInstanceSecret, 1, musicFadeTime / 2)
    audio_sound_gain(musicInstanceCurrent, 0, musicFadeTime / 2)
    exit
}

if musicInstanceSecret != undefined
{
    audio_sound_set_track_position(musicInstanceCurrent, musicLastPosition)
    audio_sound_gain(musicInstanceSecret, 0, musicFadeTime / 2)
    audio_sound_gain(musicInstanceCurrent, 1, musicFadeTime / 2)
    
    musicInstanceSecret = undefined
    exit
}

if roomMusic == undefined
    exit

if global.panic
    exit

if audio_sound_get_asset(musicInstanceCurrent) == roomMusic.song
    exit 


if !roomMusic.fade || !audio_is_playing(musicInstanceCurrent)
{
    audio_stop_sound(musicInstanceCurrent)
    musicInstanceCurrent = audio_play_sound(roomMusic.song, 0, true)
    exit
}

var musicInstanceOld = musicInstanceCurrent
var musicTrackAveragePosition = audio_sound_get_average_position(musicInstanceOld)

audio_sound_gain(musicInstanceOld, 0, musicFadeTime)
musicInstanceCurrent = audio_play_sound(roomMusic.song, 0, true, 0)
var newMusixTrackLength = audio_sound_length(musicInstanceCurrent)

audio_sound_gain(musicInstanceCurrent, 1, musicFadeTime)
audio_sound_set_track_position(musicInstanceCurrent, musicTrackAveragePosition * newMusixTrackLength)