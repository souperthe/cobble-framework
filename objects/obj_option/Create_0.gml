depth = -5

/// @param {MenuType} menuType
menuGoto = function(menuType)
{
    return
}

/// @return {Array<Struct.Menu>}
menusInit = function()
{
    
    var menus = []
    
    array_push(menus, scr_menu_option())
    
    return menus
}


menus = menusInit()
menusLength = array_length(menus)
menuCurrent = 0
menuLast = 0

menuDraws = []
menuDraws[MenuAnchor.CENTER] = scr_menu_draw_center
menuDraws[MenuAnchor.LEFT] = scr_menu_draw_left

backgroundX = 0
backgroundY = 0
backgroundAlpha = array_create(menusLength, 0)
backgroundAlpha[0] = 1
backgroundAlphaLength = array_length(backgroundAlpha)

textX = 0
textY = 0

optionCurrent = 0
optionCurrentOld = optionCurrent

optionIcons = {}
optionIcons[$ "audio"] = new OptionIcon(4)
optionIcons[$ "video"] = new OptionIcon(5)
optionIcons[$ "game"] = new OptionIcon(6)
optionIcons[$ "controls"] = new OptionIcon(7, spr_pause_icons, 8, 8)

optionIconNames = struct_get_names(optionIcons)
optionIconNamesLength = array_length(optionIconNames)
optionIconHighlight = optionIcons[$ "audio"]


clampSelection = function()
{
    var menu = menus[menuCurrent]
    var menuOptions = array_length(menu.options)
    
    optionCurrent = clamp(optionCurrent, 0, menuOptions - 1)
    
    if optionCurrentOld != optionCurrent
    {
        audio_play_sound(sfx_step, 0, false, 1, 0, random_pitch())
        optionCurrentOld = optionCurrent
    }
    return
}

onInputUp = function()
{
    optionCurrent--
    clampSelection()
    return
}

onInputDown = function()
{
    optionCurrent++
    clampSelection()
    return
}

onBack = function()
{
    var menu = menus[menuCurrent]
    
    audio_play_sound(sfx_menuback, 0, false)
    
    if menu.type == MenuType.OPTIONS
    {
        instance_destroy()
        return
    }
    
    return
}

inputDown = obj_input_manager.inputGet("down")
inputUp = obj_input_manager.inputGet("up")
inputBack = obj_input_manager.inputGet("back")

inputDownListener = inputDown.signalPressed.connect(onInputDown)
inputUpListener = inputUp.signalPressed.connect(onInputUp)
inputBackListner = inputBack.signalPressed.connect(onBack)