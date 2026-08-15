function scr_reset()
{
    
    audio_stop_sound(obj_music.musicInstanceCurrent)
    
    with obj_hud_tv
    {
        stateCurrent = TvStates.off
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
    }
    
    obj_hud_rank.rankPrevious = 0
    
    global.collect = 0
    global.combo = 0
    global.comboBreaks = 0
    global.comboDropped = false
    global.comboMilestone = 5
    global.comboSaved = 0
    global.comboScore = 0
    global.comboTimePause = 0
    global.levelSaveRoom = {}
    global.toppinFollowers = []

    return
}