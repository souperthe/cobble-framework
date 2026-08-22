audio_emitter_position(musicEmitter, obj_camera.centerX, obj_camera.centerY, 0)

if !audio_exists(musicInstanceCurrent)
    exit


var pitchStep = 0.01
var pitchTarget = 1

if secretEntering
    pitchTarget = 0.1

musicInstanceSecretPitch = approach(musicInstanceSecretPitch, pitchTarget, pitchStep)

var musicFinalPitch = musicInstancePitch * musicInstanceSecretPitch

audio_sound_pitch(musicInstanceCurrent, musicFinalPitch)


var musicIndex = audio_sound_get_asset(musicInstanceCurrent)

if !struct_exists(musicMagnetLibrary, string(musicIndex))
    exit

var musicMagnets = musicMagnetLibrary[$ musicIndex]
var musicMagnetCurrent = musicMagnets[musicMagnetState]

var musicPosition = audio_sound_get_track_position(musicInstanceCurrent)


if musicPosition < musicMagnetCurrent.positionEnd && musicPosition > musicMagnetCurrent.positionStart
    exit

var musicInstanceOld = musicInstanceCurrent
musicInstanceCurrent = audio_play_sound_on(musicEmitter, musicIndex, false, 0)

audio_sound_gain(musicInstanceOld, 0, musicMagnetCurrent.transitionTime)
audio_sound_gain(musicInstanceCurrent, 1, musicMagnetCurrent.transitionTime)
audio_sound_set_track_position(musicInstanceCurrent, musicMagnetCurrent.positionStart)
musicDebris.add(musicInstanceOld)