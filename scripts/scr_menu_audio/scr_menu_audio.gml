/// @self obj_option
function scr_menu_audio()
{
    
    var audio = new Menu(MenuType.AUDIO, MenuAnchor.LEFT, 150, 40)
    
    static optionBack = function()
    {
        obj_option.menuGoto(MenuType.OPTIONS)
        return
    }
    
    static optionMasterSet = function(value)
    {
        var volume = value / 100
        global.volumeMaster = volume
        scr_apply_volume()
        obj_option.sliderStart(value)
        return
    }
    static optionSetMusic = function(value)
    {
        var volume = value / 100
        global.volumeMusic = volume
        scr_apply_volume()
        obj_option.sliderStart(value)
        return
    }
    static optionSetSound = function(value)
    {
        var volume = value / 100
        global.volumeSound = volume
        scr_apply_volume()
        obj_option.sliderStart(value)
        return
    }
    static optionSetFocusMute = function(value)
    {
        return
    }
    
    audio.optionAddPress(0, "back", optionBack)
    
    audio.optionAddNewLine(1)
    
    var sliderMaster = audio.optionAddSlide(2, "master", optionMasterSet, obj_option.sliderEnd, sfx_knightslide)
    var sliderMusic = audio.optionAddSlide(3, "music", optionSetMusic, obj_option.sliderEnd, sfx_knightslide)
    var sliderSound = audio.optionAddSlide(4, "sfx", optionSetSound, obj_option.sliderEnd, sfx_knightslide)
    
    sliderSound.value = global.volumeSound * 100
    sliderMusic.value = global.volumeMusic * 100
    sliderMaster.value = global.volumeMaster * 100
    
    audio.optionAddNewLine(5)
    
    audio.optionAddToggle(6, "unfocused mute", optionSetFocusMute)
    
    return audio
}