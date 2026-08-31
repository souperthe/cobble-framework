

/// @param {Enum.MenuType} targetType
/// @param {Enum.MenuAnchor} targetAnchor
/// @param {Real} targetPadX
/// @param {Real} targetPadY
/// @param {Enum.MenuType} targetReturnMenu
function Menu(targetType, targetAnchor, targetPadX, targetPadY, targetReturnMenu = MenuType.OPTIONS) constructor 
{
    type = targetType
    anchor = targetAnchor
    padX = targetPadX
    padY = targetPadY
    alpha = 1
    options = scr_menu_options_init()
    returnMenu = targetReturnMenu
    
    
    /// @param {Struct.Option} option
    static optionAdd = function(option)
    {
        
        array_push(options, option)
        
        return option
    }
    
    /// @param {Real} targetOptionId
    /// @param {String} targetName
    /// @param {Function} targetCallable
    static optionAddPress = function(targetOptionId, targetName, targetCallable)
    {
        var optionPress = new OptionPress(targetOptionId, targetName, targetCallable)
        
        optionAdd(optionPress)
        
        return optionPress
    }
    
    /// @param {Real} targetOptionId
    /// @param {String} targetName
    /// @param {Function} targetOnMove
    /// @param {Function} targetOnChanged
    /// @param {Asset.GMSound} targetSound
    static optionAddSlide = function(targetOptionId, targetName, targetOnMove, targetOnChanged, targetSound)
    {
        var optionSlide = new OptionSlider(targetOptionId, targetName, targetOnMove, targetOnChanged, targetSound)
        
        optionAdd(optionSlide)
        
        return optionSlide
    }
    
    static optionAddToggle = function(targetOptionId, targetName, targetOnChanged)
    {
        var optionToggle = new OptionToggle(targetOptionId, targetName, targetOnChanged)
        
        optionAdd(optionToggle)
        
        return optionToggle
    }
    
    return
}

/// @returns {Array<Struct.Option>}
function scr_menu_options_init()
{
    return []
}

