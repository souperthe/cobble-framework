/// @self obj_option
function scr_menu_video()
{
    
    var video = new Menu(MenuType.VIDEO, MenuAnchor.LEFT, 150, 40)
    
    static optionBack = function()
    {
        obj_option.menuGoto(MenuType.OPTIONS)
        return
    }
    
    video.optionAddPress(0, "back", optionBack)

    return video
}