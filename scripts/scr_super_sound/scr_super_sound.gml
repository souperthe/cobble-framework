/// @returns {Id.AudioEmitter}
function super_sound_create_emitter()
{
    var emitter = audio_emitter_create()
    
    audio_emitter_falloff(emitter, 240, 820, 1)
    audio_emitter_bus(emitter, global.busSound)
    
    return emitter;
}

/// @param {Real} positionX
/// @param {Real} positionY
/// @param {Asset.GMSound} targetSound
/// @param {Real} pitch
/// @returns {Id.Sound}
function super_sound_oneshot(positionX, positionY, targetSound, pitch = 1)
{
    var soundEmitter = super_sound_create_emitter()
    
    audio_emitter_position(soundEmitter, positionX, positionY, 0)
    
    var soundInstance = audio_play_sound_on(soundEmitter, targetSound, false, 0)
    audio_sound_pitch(soundInstance, pitch)
    
    var soundTempEmitter = {
        emitter : soundEmitter,
        sound : soundInstance,
        global : false
    }
    
    array_push(obj_temp_emitters.tempEmitters, soundTempEmitter)
    
    return soundInstance
}


/// @param {Asset.GMSound} sound
/// @param {Real} pitch
/// @returns {Id.Sound}
function super_sound_oneshot_global(sound, pitch = 1)
{
    var soundEmitter = audio_emitter_create()
    audio_emitter_falloff(soundEmitter, 100, 10000000, 1)
    
    var soundInstance = audio_play_sound(sound, 0, false, 1, 0)
    
    audio_sound_pitch(soundInstance, pitch)
    
    var soundTempEmitter = {
        emitter : soundEmitter,
        sound : soundInstance,
        global : true
    }
    
    array_push(obj_temp_emitters.tempEmitters, soundTempEmitter)
    
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