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
    
    static optionMasterSet = function(value)
    {
        var volume = value / 100
        global.volumeMaster = volume
        scr_apply_volume()
        return
    }
    static optionSetMusic = function(value)
    {
        var volume = value / 100
        global.volumeMusic = volume
        scr_apply_volume()
        return
    }
    static optionSetSound = function(value)
    {
        var volume = value / 100
        global.volumeSound = volume
        scr_apply_volume()
        return
    }
    static optionSetFocusMute = function(value)
    {
        return
    }
    
    audio.optionAddPress(0, "back", optionBack)
    
    audio.optionAddNewLine(1)
    
    var sliderMaster = audio.optionAddSlide(2, "master", optionMasterSet, optionMasterSet, sfx_knightslide)
    var sliderMusic = audio.optionAddSlide(3, "music", optionSetMusic, optionSetMusic, sfx_knightslide)
    var sliderSound = audio.optionAddSlide(4, "sfx", optionSetSound, optionSetSound, sfx_knightslide)
    
    sliderSound.value = global.volumeSound * 100
    sliderMusic.value = global.volumeMusic * 100
    sliderMaster.value = global.volumeMaster * 100
    
    audio.optionAddNewLine(5)
    
    audio.optionAddToggle(6, "unfocused mute", optionSetFocusMute)
    
    return audio
}