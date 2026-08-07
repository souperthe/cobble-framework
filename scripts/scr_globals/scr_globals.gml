function scr_globals()
{
    scr_enums()
    scr_globals_warp()
    scr_globals_combo()
    scr_globals_fonts()
    scr_global_collect()
    pal_swap_init()
    global.instanceList = ds_list_create();
    global.panic = 0;
    global.levelName = "";
    global.levelSaveRoom = [];
    global.hitstunShake = 4
    return;
}

function scr_global_collect()
{
    global.collect = 0
    global.treasure = 0
    
    
    global.collectRankS = 0
    global.collectRankA = 0
    global.collectRankB = 0
    global.collectRankC = 0
    
    scr_set_collect_requirements(1000)
    return
}

function scr_globals_combo()
{
    global.comboTime = 0;
    global.comboTimeMax = 60;
    global.comboTimePause = 0
    global.comboSaved = 0
    global.comboBreaks = 0
    global.comboDropped = false
    global.comboScore = 0
    global.combo = 0;
    global.comboMilestone = 5;
    return
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

function scr_globals_fonts()
{
    global.fontCombo = font_add_sprite_ext(spr_tv_combobubbletext, "0123456789", true, 0)
    global.fontCollect = font_add_sprite_ext(spr_font_collect, "0123456789", true, 0)
    global.fontBig = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ!¡¿?.1234567890:ÁÄÃÀÂÉÈÊËÍÌÎÏÓÖÕÔÒÚÙÛÜÇ+", true, 0)
    global.fontSmall = font_add_sprite_ext(spr_smallerfont, "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ!¡.:?¿1234567890ÁÄÃÀÂÉÈÊËÍÌÎÏÓÖÕÔÒÚÙÛÜÇ+", true, 0)
    return
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