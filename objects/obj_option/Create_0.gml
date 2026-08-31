depth = -5

/// @param {MenuType} menuType
menuGoto = function(menuType)
{
    
    var menuTarget = menus[menuType]
    
    menuCurrent = menuType
    optionCurrent = 0
    return
}

/// @return {Array<Struct.Menu>}
menusInit = function()
{
    
    var menus = []
    
    menus[MenuType.OPTIONS] = scr_menu_option()
    menus[MenuType.AUDIO] = scr_menu_audio()
    
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
optionDisabled = false

optionIcons = {}
optionIcons[$ "audio"] = new OptionIcon(4)
optionIcons[$ "video"] = new OptionIcon(5)
optionIcons[$ "game"] = new OptionIcon(6)
optionIcons[$ "controls"] = new OptionIcon(7, spr_pause_icons, 8, 8)

optionIconNames = struct_get_names(optionIcons)
optionIconNamesLength = array_length(optionIconNames)
optionIconHighlight = optionIcons[$ "audio"]

soundSelect = [sfx_menuselect_1, sfx_menuselect_2, sfx_menuselect_3]
soundSelectCurrent = -1
soundSelectPlay = function()
{
    var sound = array_random(soundSelect)
    
    audio_stop_sound(soundSelectCurrent)
    
    soundSelectCurrent = audio_play_sound(sound, 0, false, 1, 0, 1)
    return
}


clampSelection = function()
{
    var menu = menus[menuCurrent]
    var menuOptions = array_length(menu.options)
    var optionBlacklist = [OptionType.HEADER, OptionType.NEWLINE]
    
    var selectionDirection = sign(optionCurrent - optionCurrentOld)
    
    if (selectionDirection == 0) 
        selectionDirection = 1
    
    optionCurrent = clamp(optionCurrent, 0, menuOptions - 1)
    
    while (array_contains(optionBlacklist, menu.options[optionCurrent].type))
    {
        var nextOption = optionCurrent + selectionDirection
        if (nextOption < 0 || nextOption >= menuOptions)
        {
            break
        }
        
        optionCurrent = nextOption
    }
    
    if (optionCurrentOld != optionCurrent)
    {
        audio_play_sound(sfx_step, 0, false, 1, 0, random_pitch())
        optionCurrentOld = optionCurrent
    }
}

onInputUp = function()
{
    if optionDisabled
    {
        return
    }
    
    optionCurrent--
    clampSelection()
    return
}

onInputDown = function()
{
    if optionDisabled
    {
        return
    }
    
    optionCurrent++
    clampSelection()
    return
}

onBack = function()
{
    if optionDisabled
    {
        return
    }
    
    var menu = menus[menuCurrent]
    
    audio_play_sound(sfx_menuback, 0, false)
    
    if menu.type == MenuType.OPTIONS
    {
        instance_destroy()
        return
    }
    
    menuGoto(menu.returnMenu)
    
    return
}

inputDown = obj_input_manager.inputGet("down")
inputUp = obj_input_manager.inputGet("up")
inputBack = obj_input_manager.inputGet("back")

inputDownListener = inputDown.signalPressed.connect(onInputDown)
inputUpListener = inputUp.signalPressed.connect(onInputUp)
inputBackListner = inputBack.signalPressed.connect(onBack)