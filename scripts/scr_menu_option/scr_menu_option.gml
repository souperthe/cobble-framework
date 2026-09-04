/// @self obj_option
function scr_menu_option()
{
    
    var options = new Menu(MenuType.OPTIONS, MenuAnchor.CENTER, 0, 48, noone)
    static optionAudio = function()
    {
        obj_option.menuGoto(MenuType.AUDIO)
        return
    }
    static optionVideo = function()
    {
        obj_option.menuGoto(MenuType.VIDEO)
        return
    }
    static optionGame = function()
    {
        obj_option.menuGoto(MenuType.GAME)
        return
    }
    static optionControls = function()
    {
        obj_option.menuGoto(MenuType.CONTROLS)
        return
    }
    
    options.optionAddPress(0, "audio", optionAudio)
    options.optionAddPress(1, "video", optionVideo)
    options.optionAddPress(2, "game", optionGame)
    options.optionAddPress(3, "controls", optionControls)
    
    return options
}