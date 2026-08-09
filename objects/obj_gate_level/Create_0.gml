// Inherit the parent event
event_inherited();


rank = "D"
highscore = 0
servetCount = 0
toppins = array_create(5, 0)


onEnter = function()
{
    var levelTarget = string_lower(targetLevel)
    var level = scr_level_data_get(levelTarget)
    
    global.levelCurrent = level
    global.levelName = levelTarget
    global.warpRoom = level.roomFirst
    global.warpDoor = "A"
    global.levelEntering = true
    global.warpHallway = false
    global.warpVerticalHallway = false
    
    instance_create_depth(x, y, -8, obj_titlecard_warp)
    return
}