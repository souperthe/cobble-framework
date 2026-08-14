
/// @param {Struct.LevelEntry} levelData
function scr_level_enter(levelData)
{
    scr_set_collect_requirements(levelData.rankS)
    audio_stop_sound(obj_music.musicInstanceCurrent)
    scr_reset()
    global.levelEntering = false
    return
}

function scr_level_panic()
{
    var levelCurrent = global.levelCurrent

    global.panic = true
    global.panicTime = time_in_frames(levelCurrent.escapeMinutes, levelCurrent.escapeSeconds)
    global.panicTimeMax = global.panicTime
    
    global.signalPanic.fire()
    
    instance_create_depth(0, 0, -5, obj_hud_pizzatime)
    
    obj_music.musicPanicStart()
    return
}