/// @self obj_player
function scr_player_transformation_enter()
{
    
        
    super_sound_oneshot_emitter(emitter, sfx_transform_enter, random_pitch())
    scr_effect_create("genericpoof", x, y)
    
    var voiceRandom = irandom(100)
    
    if voiceRandom < 70
        super_sound_oneshot_emitter_list(emitter, voiceTransfoIn, voicePitch())

    return
}

/// @self obj_player
function scr_player_transformation_exit()
{
    
    var debris = scr_debris_create(x, y, transformationDebris)
    debris.velocityY = random_range(-5, -10)
    debris.velocityX = random_range(-5, 5)
    transformationDebris = undefined
    transformationCurrent = ""
    
    super_sound_oneshot_emitter(emitter, sfx_transform_exit, random_pitch())
    
    var voiceRandom = irandom(100)
    
    if voiceRandom < 70
        super_sound_oneshot_emitter_list(emitter, voiceTransfoOut, voicePitch())

    return
}