/// @self obj_option
function scr_menu_option()
{
    
    var options = new Menu(MenuType.OPTIONS, MenuAnchor.CENTER, 0, 48, noone)
    var optionAudio = function()
    {
        menuGoto(MenuType.AUDIO)
        return
    }
    var optionVideo = function()
    {
        menuGoto(MenuType.VIDEO)
        return
    }
    var optionGame = function()
    {
        menuGoto(MenuType.GAME)
        return
    }
    var optionControls = function()
    {
        menuGoto(MenuType.CONTROLS)
        return
    }
    
    options.optionAddPress(0, "audio", optionAudio)
    options.optionAddPress(1, "video", optionVideo)
    options.optionAddPress(2, "game", optionGame)
    options.optionAddPress(3, "controls", optionControls)
    
    return options
}

/// @self obj_option
function scr_menu_audio()
{
    
    var audio = new Menu(MenuType.AUDIO, MenuAnchor.LEFT, 150, 40)
    
    var optionBack = function()
    {
        menuGoto(MenuType.OPTIONS)
        return
    }
    
    var optionMasterOnMove = function()
    {
        return
    }
    
    audio.optionAddPress(0, "back", optionBack)
    audio.optionAddSlide(2, "master", optionMasterOnMove, optionMasterOnMove, sfx_knightslide)
    audio.optionAddSlide(3, "sfx", optionMasterOnMove, optionMasterOnMove, sfx_knightslide)
    audio.optionAddSlide(4, "music", optionMasterOnMove, optionMasterOnMove, sfx_knightslide)
    audio.optionAddToggle(5, "unfocused mute", optionMasterOnMove)
    
    return audio
}