


pauseInputEnter = obj_input_manager.inputLibrary[$ "pause"]
pauseInputDown = obj_input_manager.inputLibrary[$ "down"]
pauseInputUp = obj_input_manager.inputLibrary[$ "up"]
pauseInputSelect = obj_input_manager.inputLibrary[$ "enter"]

pauseInputUpListener = -1
pauseInputDownListener = -1
pauseInputEnterListener = -1

paused = false

pauseSprite = -1
pauseSpriteGui = -1
pauseSpriteGuiAlpha = 1
pauseOverlayAlpha = 0
pauseDecorModifier = 0


pauseMusicAsset = mu_pause
pauseMusicInstance = -1
pauseMusicFade = 800

pauseOptionsLevelNames = ["resume", "options", "restart level", "chef tasks", "exit level"]
pauseOptionsLevel = {
    "resume" : scr_pause_resume,
    "options" : scr_pause_resume,
    "restart level" : scr_pause_restart,
    "chef tasks" : scr_pause_resume,
    "exit level" : scr_pause_resume
}

pauseOptionsHubNames = ["resume", "options", "main menu"]
pauseOptionsHub = {
    "resume" : scr_pause_resume,
    "options" : scr_pause_resume,
    "main menu" : scr_pause_resume
}
pauseOptionsIcons = {
    "resume" : 0,
    "options" : 1,
    "restart level" : 2,
    "exit level" : 3,
    "main menu" : 3,
    "chef tasks" : 8
}

pauseOptionNames = pauseOptionsLevelNames
pauseOptions = pauseOptionsLevel

pauseOptionsData = {}
pauseOptionSelected = 0

cursorTargetX = 0
cursorTargetY = 0
cursorX = 0
cursorY = 0
cursorIndex = 0

iconLast = 0
iconCurrent = 0
iconScale = 1

moveSoundMenu = -1

getSpriteApplication = function()
{
    
    var applicationWidth = surface_get_width(application_surface)
    var applicationHeight = surface_get_height(application_surface)
    var applicationSprite = sprite_create_from_surface(application_surface, 0, 0, applicationWidth, applicationHeight, false, false, 0, 0)
    
    return applicationSprite
}

getSpriteGui = function()
{
    var guiWidth = display_get_gui_width()
    var guiHeight = display_get_gui_height()
    
    var surfaceTemp = surface_create(guiWidth, guiHeight)
    
    surface_set_target(surfaceTemp)
    draw_clear_alpha(c_black, 0)
    display_set_gui_maximise()
    
    var guiObjects = [
        obj_hud_combo,
        obj_hud_comboend,
        obj_hud_combomilestone,
        obj_hud_pillarflash,
        obj_hud_pizzatime,
        obj_hud_rank,
        obj_hud_score,
        obj_hud_tv,
        obj_hud_timer
    ]
    var guiObjectsLength = array_length(guiObjects)
    
    for (var index = 0; index < guiObjectsLength; index++)
    {
        var guiObject = guiObjects[index]
        
        with guiObject
        {
            event_perform(ev_draw, ev_gui)
        }
        
        continue
    }
    
    surface_reset_target()
    
    var guiSprite = sprite_create_from_surface(surfaceTemp, 0, 0, guiWidth, guiHeight, false, false, 0, 0)
    
    surface_free(surfaceTemp)
    
    return guiSprite
}

pauseResetOptions = function(targetPositionModifier = 3, targetAlpha = 0)
{
    var pauseOptionsLength = array_length(pauseOptionNames)
    
    pauseOptionsData = {}
    
    for (var index = 0; index < pauseOptionsLength; index++)
    {
        var option = pauseOptionNames[index]
        var optionTimer = 5 * (1 + index)
        
        if !paused
            optionTimer = 5 * (pauseOptionsLength - index);
        
        var optionData = {
            positionModifer : targetPositionModifier,
            positionTimer : optionTimer,
            dipped : false,
            alpha : targetAlpha
        }
        
        pauseOptionsData[$ option] = optionData
        continue
    }
    
    return
}

pauseEnter = function()
{        
    pauseSprite = getSpriteApplication()
    pauseSpriteGui = getSpriteGui()
    pauseSpriteGuiAlpha = 1
    audio_emitter_position(obj_music.musicEmitter, obj_camera.centerX, obj_camera.centerY, 0)
    
    instance_deactivate_all(true)
    instance_activate_object(obj_input_manager)
    instance_activate_object(obj_pause)
    instance_activate_object(obj_screensizer)
    instance_activate_object(obj_music_debris)
    
    
    audio_pause_all()
    
    
    pauseMusicInstance = audio_play_sound_on(obj_music.musicEmitter, pauseMusicAsset, true, 0, 0)
    audio_sound_gain(pauseMusicInstance, 1, pauseMusicFade)
    
    pauseResetOptions()
    
    pauseInputUpListener = pauseInputUp.signalPressed.connect(pauseUp, false, id)
    pauseInputDownListener = pauseInputDown.signalPressed.connect(pauseDown, false, id)
    pauseInputEnterListener = pauseInputSelect.signalPressed.connect(pauseSelect, false, id)
    
    pauseOptionSelected = 0
    iconCurrent = 0
    iconLast = 0
    
    return
}

pauseExit = function()
{
    instance_activate_all()
    audio_resume_all()
    
    sprite_delete(pauseSprite)
    sprite_delete(pauseSpriteGui)
    
    pauseInputUpListener.disconnect()
    pauseInputDownListener.disconnect()
    pauseInputEnterListener.disconnect()
    
    var pauseOptionsLength = array_length(pauseOptionNames)
    
    for (var index = 0; index < pauseOptionsLength; index++)
    {
        var optionName = pauseOptionNames[index]
        var optionData = pauseOptionsData[$ optionName]
        
        optionData.positionTimer = 5 * (pauseOptionsLength - index)
        continue
    }
    
    pauseSprite = -1
    pauseSpriteGui = -1
    
    cursorTargetX = -60
    cursorTargetY = -300
    
    audio_sound_gain(pauseMusicInstance, 0, pauseMusicFade / 2)
    obj_music_debris.add(pauseMusicInstance)
    return
}

pausePressed = function()
{
    
    if instance_exists(obj_room_warp)
    {
        return
    }
    
    paused = !paused
    
    if paused
    {
        pauseEnter()
        return
    }
    
    pauseExit()
    return
}

menuMoveSound = function()
{
    
    if moveSoundMenu != -1
        audio_stop_sound(moveSoundMenu)
    
    audio_play_sound(sfx_step, 0, false)
    moveSoundMenu = audio_play_sound(sfx_menumove, 0, false, 1, 0, random_range(0.8, 1.2))
    return
}

pauseDown = function()
{
    pauseOptionSelected++
    
    menuMoveSound()
    
    if pauseOptionSelected > array_length(pauseOptionNames) - 1
        pauseOptionSelected = 0
    return
}
pauseUp = function()
{
    pauseOptionSelected--
    
    menuMoveSound()
    
    if pauseOptionSelected < 0
        pauseOptionSelected = array_length(pauseOptionNames) - 1
    
    return
}

/// @self obj_pause
pauseSelect = function()
{
    var optionCurrent = pauseOptionNames[pauseOptionSelected]
    var optionFunction = pauseOptions[$ optionCurrent]
    
    optionFunction()
    return
}

pauseInputEnter.signalPressed.connect(pausePressed)