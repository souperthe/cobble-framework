/// @returns {Id.AudioEmitter}
function super_sound_create_emitter()
{
    var emitter = audio_emitter_create();
    audio_emitter_falloff(emitter, 240, 820, 1);
    return emitter;
}

/// @param {Real} positionX
/// @param {Real} positionY
/// @param {Asset.GMSound} sound
/// @param {Real} pitch
/// @returns {Id.Sound}
function super_sound_oneshot(positionX, positionY, sound, pitch = 1)
{
    var soundInstance = audio_play_sound_at(sound, positionX, positionY, 0, 200, 900, 1, false, 1)
    audio_sound_pitch(soundInstance, pitch)
    
    return soundInstance
}

/// @param {Real} positionX
/// @param {Real} positionY
/// @param {Array} sounds
/// @param {Real} pitch
/// @returns {Id.Sound}
function super_sound_oneshot_list(positionX, positionY, sounds, pitch = 1)
{
    var soundTarget = array_random(sounds)
    return super_sound_oneshot(positionX, positionY, soundTarget, pitch)
}

/// @param {Id.AudioEmitter} emitter
/// @param {Asset.GMSound} sound
/// @param {Real} pitch
/// @returns {Id.Sound}
function super_sound_oneshot_emitter(emitter, sound, pitch = 1)
{
    var soundInstance = audio_play_sound_on(emitter, sound, false, 0)
    audio_sound_pitch(soundInstance, pitch)
    
    return soundInstance
}

/// @param {Id.AudioEmitter} emitter
/// @param {Array} sounds
/// @param {Real} pitch
/// @returns {Id.Sound}
function super_sound_oneshot_emitter_list(emitter, sounds, pitch = 1)
{
    var soundTarget = array_random(sounds)
    return super_sound_oneshot_emitter(emitter, soundTarget, pitch)
}

/// @param {Id.AudioEmitter} emitter
/// @param {Asset.GMSound} sound
/// @param {Real} pitch
/// @returns {Id.Sound}
function super_sound_loop_emitter(emitter, sound, pitch = 1)
{
    var soundInstance = audio_play_sound_on(emitter, sound, true, 0)
    audio_sound_pitch(soundInstance, pitch)
    
    return soundInstance
}

/// @returns {Real}
function random_pitch()
{
    return random_range(0.955, 1.055);
}