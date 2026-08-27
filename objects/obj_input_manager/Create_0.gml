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
inputStickDeadzone = 0.6
inputStickPrevious = {}
inputStickButtons = [gp_stick_left_left, gp_stick_left_right, gp_stick_left_down, gp_stick_left_up]
inputStickButtonsLength = array_length(inputStickButtons)

inputGamepadDevices = [0]

/// @param {String} name
/// @param {Array<Constant.VirtualKey>} inputsKeyboard
/// @param {Array<Constant.GamepadButton>} inputsController
/// @param {Real} inputIndex
inputRegister = function(name, inputsKeyboard, inputsController = [], inputIndex = 0)
{
    var inputData = new InputData(inputsKeyboard, inputsController, inputIndex)
    
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