scr_globals_keys();

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

/// @param {String} inputName
/// @return {Struct.InputData}
inputGet = function(inputName)
{
    return inputLibrary[$ inputName]
}

inputCheck = function(inputName, held)
{
    
    var inputTarget = inputLibrary[$ inputName]
    
    if (is_undefined(inputTarget))
        return false
    
    if held
        return inputTarget.held
    
    return inputTarget.pressed
}