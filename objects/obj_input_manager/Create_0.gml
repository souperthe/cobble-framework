scr_globals_keys();

/// @param {Array<Constant.VirtualKey|Real>} targetKeys
/// @param {Array<Constant.GamepadButton>} targetButtons
/// @param {Real} targetIndex
function InputData(targetKeys, targetButtons = [], targetIndex = 0) constructor
{
    pressed = false
    held = false
    released = false
    keys = targetKeys
    buttons = targetButtons
    buttonIndex = targetIndex
    
    signalPressed = new Signal()
    signalReleased = new Signal()
    return
}



inputLibrary = {}

/// @param {String} name
/// @param {Array<Constant.VirtualKey>} inputs
inputRegister = function(name, inputs)
{
    var inputData = new InputData(inputs)
    
    inputLibrary[$ name] = inputData
    return
}

scr_input_entry()

inputCheck = function(inputName, held)
{
    
    var inputTarget = inputLibrary[$ inputName]
    
    if (is_undefined(inputTarget))
        return false
    
    if held
        return inputTarget.held
    
    return inputTarget.pressed
}