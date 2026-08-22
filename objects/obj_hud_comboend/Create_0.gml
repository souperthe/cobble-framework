depth = 0
comboAmount = global.comboSaved
comboAmountStart = comboAmount
comboDelete = false
comboDeleteTime = 300
comboScoreCollects = []
comboCollects = 0
comboCollectSound = -1
comboCollectTime = 5
comboCollect = function()
{
    global.collect += 1
    comboAmount -= 1
    
    var collectSprite = choose(
        spr_shroomcollect, 
        spr_tomatocollect, 
        spr_cheesecollect, 
        spr_sausagecollect, 
        spr_pineapplecollect
    )
    var collectOffset = 30
    var collectXOffset = random_range(-collectOffset, collectOffset)
    var collectYOffset = random_range(-collectOffset, collectOffset)
    
    var collect = obj_hud_score.collectCreate(
        0,
        0,
        collectSprite,
        1
    )
    collect.x = obj_hud_tv.tvX + collectXOffset
    collect.y = (obj_hud_tv.tvY + 148) + titleOffset + collectYOffset
    return
}

titleCombo = comboAmount
titleIndex = 0
titleOffset = 0
alpha = 0

/// @param {Struct.Collect} collect
comboCollectRecieved = function(collect)
{
    
    if collect.collectValue != 1
    {
        return
    }
    
    comboCollects += 1
    
    if audio_is_playing(comboCollectSound)
        audio_stop_sound(comboCollectSound)
    
    var collectPitchOffset = comboCollects / 300
    var collectPitchRandom = random_range(0.9, 1.1)
    var collectPitch = (collectPitchRandom) + collectPitchOffset
    comboCollectSound = audio_play_sound(sfx_collect, 0, false, 0.8, 0, collectPitch)
    return
}

comboCollectRecievedConnection = obj_hud_score.collectReceived.connect(comboCollectRecieved)

global.comboScore = comboAmount

alarm[0] = 1