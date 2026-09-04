/// @self obj_option
function scr_menu_controls()
{
    
    var controls = new Menu(MenuType.CONTROLS, MenuAnchor.LEFT, 150, 40)
    
    static optionBack = function()
    {
        obj_option.menuGoto(MenuType.OPTIONS)
        return
    }
    
    controls.optionAddPress(0, "back", optionBack)

    return controls
}