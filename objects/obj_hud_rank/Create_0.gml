rankScale = 1
rankPrevious = -1
depth = obj_hud_score.depth - 1

collectCurrent = 0

rankSoundsUp = [
    sfx_rankup_1,
    sfx_rankup_2,
    sfx_rankup_3,
    sfx_rankup_4,
    sfx_rankup_5
]

rankSoundsDown = [
    sfx_rankdown_5,
    sfx_rankdown_4,
    sfx_rankdown_3,
    sfx_rankdown_2,
    sfx_rankdown_1
]

rankSoundInstance = -1


fillPercentageRetrievers = []
fillPercentageRetrievers[4] = function() 
{
    return 1
}
fillPercentageRetrievers[3] = function() 
{
    return (collectCurrent - global.collectRankA) / (global.collectRankS - global.collectRankA)
}
fillPercentageRetrievers[2] = function() 
{
    return (collectCurrent - global.collectRankB) / (global.collectRankA - global.collectRankB)
}
fillPercentageRetrievers[1] = function() 
{
    return (collectCurrent - global.collectRankC) / (global.collectRankB - global.collectRankC)
}
fillPercentageRetrievers[0] = function() 
{
    return (collectCurrent / global.collectRankC)
}