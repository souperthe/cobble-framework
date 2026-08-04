function scr_globals()
{
    scr_enums()
    scr_globals_warp()
    global.instanceList = ds_list_create();
    global.collect = 0;
    global.treasure = 0;
    global.comboTime = 0;
    global.combo = 0;
    global.comboMilestone = 5;
    global.panic = 0;
    global.levelName = "";
    global.levelSaveRoom = [];
    global.hitstunShake = 4
    return;
}

function scr_globals_warp()
{
    global.warpDoor = "A"
    global.warpRoom = rm_test
    global.warpHallwayDirection = 1;
    global.warpHallway = false;
    global.warpBox = false
    global.warpVerticalHallway = false;
    global.warpVerticalFlip = 1;
    global.warpVerticalHallwayPosition = 0
    global.warpVerticalHallwaySide = 1
    return;
}

function scr_globals_keys()
{
    global.keyDash = vk_shift
    global.keyPause = vk_escape
    global.keyJump = ord("Z")
    global.keyAttack = ord("X")
    global.keyTaunt = ord("C")
    global.keyLeft = vk_left
    global.keyRight = vk_right
    global.keyUp = vk_up
    global.keyDown = vk_down
    return
}