

/// @param {Real} targetColorIndex
/// @param {Real} targetTitleIndex
/// @param {Real} targetMinutes
/// @param {Real} targetSecods
/// @param {Asset.GMRoom} targetRoom
/// @param {Real} targetSRank
function LevelEntry(targetColorIndex, targetTitleIndex, targetMinutes, targetSeconds, targetRoom, targetSRank = 1600) constructor 
{
    colorIndex = targetColorIndex
    titleIndex = targetTitleIndex
    escapeMinutes = targetMinutes
    escapeSeconds = targetSeconds
    rankS = targetSRank
    roomFirst = targetRoom
    return
}


function scr_level_data_init()
{
    var levelData = {}
    
    levelData[$ "example_level"] = new LevelEntry(1, 0, 0, 10, rm_example_1, 18320)
    
    global.levelData = levelData
    return
}


/// @param {String} levelName
/// @return {Struct.LevelEntry}
function scr_level_data_get(levelName)
{
    
    if !struct_exists(global.levelData, levelName)
        return noone
    
    return global.levelData[$ levelName]
}