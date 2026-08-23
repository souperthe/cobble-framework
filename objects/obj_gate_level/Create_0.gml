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
    
    global.levelEntering = true
    
    global.warpDoor = "A"
    global.warpHallway = false
    global.warpVerticalHallway = false
    global.warpRoom = level.roomFirst
    
    instance_create_depth(x, y, -8, obj_titlecard_warp)
    return
}