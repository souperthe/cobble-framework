tempEmitters = []

tempEmitterLoop = function(targetFunction)
{
    
    for (var index = 0; index < array_length(tempEmitters); index++)
    {
        var tempEmitter = array_get(tempEmitters, index)
        
        targetFunction(tempEmitter)
        continue
    }
    
    return
}


tempEmitterRoomStart = function(tempEmitter)
{
    var tempEmitterIndex = array_get_index(tempEmitters, tempEmitter)
    
    audio_emitter_free(tempEmitter.emitter)
    array_delete(tempEmitters, tempEmitterIndex, 1)
    return
}

tempEmitterStep = function(tempEmitter)
{
    var soundPlaying = audio_is_playing(tempEmitter.sound)
    
    if tempEmitter.global
        audio_emitter_position(tempEmitter.emitter, obj_camera.centerX, obj_camera.centerY, 0)
    
    if soundPlaying
    {
        return
    }
    
    var tempEmitterIndex = array_get_index(tempEmitters, tempEmitter)
    
    audio_emitter_free(tempEmitter.emitter)
    array_delete(tempEmitters, tempEmitterIndex, 1)
    return
}