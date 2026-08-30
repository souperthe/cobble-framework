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