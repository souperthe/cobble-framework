/// @self obj_option
function scr_menu_game()
{
    
    var game = new Menu(MenuType.GAME, MenuAnchor.LEFT, 150, 40)
    
    static optionBack = function()
    {
        obj_option.menuGoto(MenuType.OPTIONS)
        return
    }
    
    game.optionAddPress(0, "back", optionBack)

    return game
}