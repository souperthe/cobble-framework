

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
    
    
    /// @param {Struct.MenuOption} option
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
        return
    }
    return
}

/// @param {Enum.OptionType} targetType
/// @param {Real} targetOptionId
/// @param {String} targetName
function Option(targetType, targetOptionId, targetName) constructor
{
    type = targetType
    optionId = targetOptionId
    name = targetName
    return
}

/// @param {Real} targetOptionId
/// @param {String} targetName
/// @param {Function} targetCallable
function OptionPress(targetOptionId, targetName, targetCallable) : Option(OptionType.PRESS, targetOptionId, targetName) constructor 
{
    callable = targetCallable
    return
}

/// @param {Real} targetOptionId
/// @param {String} targetName
/// @param {Asset.GMSprite} targetIcon
function OptionHeader(targetOptionId, targetName, targetIcon): Option(OptionType.HEADER, targetOptionId, targetName) constructor 
{
    icon = targetIcon
    return
}

/// @param {Real} targetOptionId
/// @param {String} targetName
/// @param {Function} targetOnChanged
function OptionToggle(targetOptionId, targetName, targetOnChanged): Option(OptionType.TOGGLE, targetOptionId, targetName) constructor 
{
    value = false
    onChanged = targetOnChanged
    return
}

/// @param {Real} targetOptionId
/// @param {String} targetName
/// @param {Function} targetOnChanged
/// @param {Array} targetValues
function OptionMultiple(targetOptionId, targetName, targetOnChanged, targetValues): Option(OptionType.MULTIPLE, targetOptionId, targetName) constructor 
{
    value = 0
    values = targetValues
    onChanged = targetOnChanged
    return
}

/// @param {Real} targetOptionId
/// @param {String} targetName
/// @param {Function} targetOnMove
/// @param {Function} targetOnChanged
/// @param {Asset.GMSound} targetSound
function OptionSlider(targetOptionId, targetName, targetOnMove, targetOnChanged, targetSound): Option(OptionType.SLIDE, targetOptionId, targetName) constructor 
{
    value = 100
    sound = targetSound
    slideCount = 0
    moving = false
    
    onMove = targetOnMove
    onChanged = targetOnChanged
    return
}

/// @returns {Array<Struct.Option>}
function scr_menu_options_init()
{
    return []
}
