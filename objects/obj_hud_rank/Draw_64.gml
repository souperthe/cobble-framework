var rankIndex = 0
var rankX = 273 + random_range(-obj_hud_score.collectShake, obj_hud_score.collectShake)
var rankY = (58 + obj_hud_score.scoreYOffset) + random_range(-obj_hud_score.collectShake, obj_hud_score.collectShake)

if collectCurrent >= global.collectRankS
    rankIndex = 4
else if collectCurrent >= global.collectRankA
    rankIndex = 3
else if collectCurrent >= global.collectRankB
    rankIndex = 2
else if collectCurrent >= global.collectRankC
    rankIndex = 1

if rankPrevious != rankIndex
{
    var rankSounds = rankSoundsUp
    
    if rankIndex < rankPrevious
        rankSounds = rankSoundsDown
    
    if rankSoundInstance != -1
        audio_stop_sound(rankSoundInstance)
    
    var rankSound = rankSounds[rankIndex]
    rankSoundInstance = super_sound_oneshot_global(rankSound)
    audio_sound_gain(rankSoundInstance, 0.5)
    
    rankPrevious = rankIndex
    rankScale = 3
}

var fillSprite = spr_ranks_hudfill
var fillWidth = sprite_get_width(fillSprite)
var fillHeight = sprite_get_height(fillSprite)
var fillXOffset = sprite_get_xoffset(fillSprite)
var fillYOffset = sprite_get_yoffset(fillSprite)
var fillPercentage = 0
var fillPercentageFunction = fillPercentageRetrievers[rankIndex]

if !is_undefined(fillPercentageFunction)
    fillPercentage = fillPercentageFunction()


var fillTop = fillHeight * fillPercentage
fillTop = fillHeight - fillTop


draw_sprite_ext(spr_ranks_hud, rankIndex, rankX, rankY, rankScale, rankScale, 0, c_white, 1)

if rankScale == 1
{
    draw_sprite_part(
        spr_ranks_hudfill,
        rankIndex, 
        0,
        fillTop,
        fillWidth,
        fillHeight - fillTop,
        rankX - fillXOffset,
        (rankY - fillYOffset) + fillTop
    )
}