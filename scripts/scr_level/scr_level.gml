
/// @param {Struct.LevelEntry} levelData
function scr_level_enter(levelData)
{
    scr_set_collect_requirements(levelData.rankS)
    audio_stop_sound(obj_music.musicInstanceCurrent)
    scr_reset()
    
    obj_hud_tv.tvBackroundFrame = levelData.colorIndex
    global.levelEntering = false
    global.levelTimeStart = get_timer()
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

function scr_level_rank()
{
    
    audio_stop_sound(sfx_escaperumble)
    
    var saveDirectory = global.saveFile + "/levels/"
    var saveName = string_lower(global.levelName)
    var savePath = saveDirectory + saveName + ".cobbledata"
    var saveAttempts = 1
    var saveLevelTime = (get_timer() - global.levelTimeStart) / 1000000
    var dontSave = false
    
    if file_exists(savePath)
    {
        var saveFileOld = file_text_open_read_all(savePath)
        
        if saveFileOld != ""
        {
            var saveFileOldParsed = json_parse(saveFileOld)
            
            saveAttempts = saveFileOldParsed.attempts + 1
            
            if saveFileOldParsed.score >= global.collect
            {
                dontSave = true
            }
            
            if saveFileOldParsed.rankIndex >= global.levelRankIndex
            {
                dontSave = true
            }
        }
    }
    
    if dontSave
    {
        return
    }
    
    if file_exists(savePath)
    {
        file_delete(savePath)
    }
    
    var saveData = {
        score : global.collect,
        rankIndex: global.levelRankIndex,
        toppins : global.toppinFollowers,
        secrets : global.secretsFound,
        comboBreaks : global.comboBreaks,
        comboHighest : global.comboHighest,
        attempts : saveAttempts,
        baddiesKilled : global.levelBaddiesKilled,
        time : saveLevelTime,
        laps : global.panicLap
    }
    var saveDataString = json_stringify(saveData, true)
    var saveDataFile = file_text_open_write(savePath)
    
    if saveDataFile == -1
    {
        return
    }
    
    file_text_write_string(saveDataFile, saveDataString)
    file_text_close(saveDataFile)
    return
}