function scr_globals()
{
    scr_enums()
    global.instanceList = ds_list_create();
    global.collect = 0;
    global.treasure = 0;
    global.comboTime = 0;
    global.combo = 0;
    global.comboMilestone = 5;
    global.panic = 0;
    global.levelName = "";
    global.levelSaveRoom = [];
    return;
}


function scr_globals_keys()
{
    global.keyDash = vk_shift
    global.keyPause = vk_escape
    global.keyJump = ord("Z")
    global.keyAttack = ord("X")
    global.keyLeft = vk_left
    global.keyRight = vk_right
    global.keyUp = vk_up
    global.keyDown = vk_down
    return
}