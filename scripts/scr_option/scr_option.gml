/// @param {Enum.OptionType} targetType
/// @param {Real} targetOptionId
/// @param {String} targetName
function Option(targetType, targetOptionId, targetName) constructor
{
    type = targetType
    optionId = targetOptionId
    name = targetName
    
    static step = function()
    {
        return
    }
    
    return
}

/// @param {Real} targetOptionId
/// @param {String} targetName
/// @param {Function} targetCallable
function OptionPress(targetOptionId, targetName, targetCallable) : Option(OptionType.PRESS, targetOptionId, targetName) constructor 
{
    callable = targetCallable
    
    static step = function()
    {
        
        if callable == -4
        {
            return
        }
        
        if !check_input("enter", false)
        {
            return
        }
        
        obj_option.soundSelectPlay()
        callable()
        return
    }
    return
}

/// @param {Real} targetOptionId
/// @param {String} targetName
/// @param {Function} targetOnChanged
function OptionToggle(targetOptionId, targetName, targetOnChanged): Option(OptionType.TOGGLE, targetOptionId, targetName) constructor 
{
    value = false
    onChanged = targetOnChanged
    
    static step = function()
    {
        if !check_input("enter", false)
        {
            return
        }
        
        value = !value
        obj_option.soundSelectPlay()
        onChanged(value)
        return
    }
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
    slideBuffer = 0
    moving = false
    moved = false
    
    onMove = targetOnMove
    onChanged = targetOnChanged
    
    
    static step = function()
    {
        
        var move = check_input("right", true) - check_input("left", true)
        
        slideBuffer--
        
        if move != 0 && slideBuffer <= 0
        {
            moved = true
            value += move
            slideBuffer = 1
            
            value = clamp(value, 0, 100)
            onMove(value)
        }
        
        if move != 0
        {
            moving = true
            obj_option.optionDisabled = true
        }
        else 
        {
        	moving = false
            obj_option.optionDisabled = false
            onChanged(value)
        }
        return
    }
    return
}
