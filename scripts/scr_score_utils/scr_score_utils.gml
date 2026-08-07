
/// @param {Real} collectRankS
function scr_set_collect_requirements(collectRankS)
{
    
    global.collectRankS = collectRankS
    global.collectRankA = floor(global.collectRankS / 2);
    global.collectRankB = floor(global.collectRankA / 2);
    global.collectRankC = floor(global.collectRankB / 2);

    return
}