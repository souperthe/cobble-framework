function scr_reset()
{
    
    audio_stop_sound(obj_music.musicInstanceCurrent)
    audio_group_stop_all(audiogroup_sfx)
    
    if obj_music.musicInstanceSecret != undefined
    {
        audio_stop_sound(obj_music.musicInstanceSecret)
        obj_music.musicInstanceSecret = undefined
    }
    
    obj_music.secretEntering = false
    obj_music.musicInstancePitch = 1
    
    obj_camera.lock = false
    
    with obj_hud_tv
    {
        stateCurrent = TvStates.off
        tvTransitionTarget = spr_tv_idle
        tvExpressionSprite = spr_tv_idle
        tvIdleTime = 200
        tvYOffset = -300
        tvExpressionForceTime = 0
        sprite_index = spr_tv_off
        alarm[0] = 60
    }
    
    with obj_hud_score
    {
        scoreYOffset = -300
    }
    
    with obj_player
    {
        moveSpeed = 0
        instance_destroy_list(followers)
        followers = []
        grabbedBaddie = -1
        scaleVisual = 1
    }
    
    obj_hud_rank.rankPrevious = 0
    
    global.collect = 0
    global.combo = 0
    global.comboTime = 0
    global.comboBreaks = 0
    global.comboDropped = false
    global.comboMilestone = 5
    global.comboSaved = 0
    global.comboScore = 0
    global.comboTimePause = 0
    global.levelSaveRoom = {}
    global.toppinFollowers = []
    
    global.panic = false
    global.panicLap = 0
    global.panicTime = 5
    global.panicTimeMax = 5
    global.panicMinutes = 0
    global.panicSeconds = 0
    
    global.secretsFound = 0

    return
}