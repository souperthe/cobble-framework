
/// @param {Struct.LevelEntry} levelData
function scr_level_enter(levelData)
{
    scr_set_collect_requirements(levelData.rankS)
    audio_stop_sound(obj_music.musicInstanceCurrent)
    scr_reset()
    global.levelEntering = false
    return
}