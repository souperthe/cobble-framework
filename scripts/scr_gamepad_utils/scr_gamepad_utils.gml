/// @param {Real} index
/// @param {Array<Constant.GamepadButton>} buttons
/// @param {Function} gamepadFuncton
/// @return {Bool}
function gamepad_check_array(deviceIndex, buttons, gamepadFuncton)
{
    
    if !is_array(buttons)
    {
        return gamepadFuncton(deviceIndex, buttons)
    }
    
    
    var buttonsLength = array_length(buttons)
    
    for (var index = 0; index < buttonsLength; index++)
    {
        var button = buttons[index]
        
        if gamepadFuncton(deviceIndex, button)
        {
            return true
        }
        
        continue
    }

    return false
}

/// @param {Real} deviceIndex
/// @param {Real} button
/// @return {Bool}
function gamepad_stick_check(deviceIndex, button)
{
    static inputData = gamepad_stick_data()
    var inputDeadzone = obj_input_manager.inputStickDeadzone
    
    var stickData = inputData[$ button]
    
    if is_undefined(stickData)
    {
        return
    }
    
    var axisValue = gamepad_axis_value(deviceIndex, stickData.axis)
    
    return (axisValue * stickData.direction) > inputDeadzone
}


/// @param {Real} button
/// @return {Bool}
function gamepad_button_is_stick(button)
{
    static inputData = gamepad_stick_data()
    return variable_struct_exists(inputData, button)
}

/// @param {Real} deviceIndex
/// @param {Real} button
function gamepad_button_check_ext(deviceIndex, button)
{
    
    if gamepad_button_is_stick(button)
        return gamepad_stick_check(deviceIndex, button)
    
    return gamepad_button_check(deviceIndex, button)
}

/// @param {Real} deviceIndex
/// @param {Real} button
function gamepad_button_check_ext_pressed(deviceIndex, button)
{
    if !gamepad_button_is_stick(button)
        return gamepad_button_check_pressed(deviceIndex, button)
    
    static inputManager = obj_input_manager
    
    var buttonHeld = gamepad_stick_check(deviceIndex, button)
    var buttonKey = string(deviceIndex) + string(button)
    var buttonWasHeld = inputManager.inputStickPrevious[$ buttonKey] ?? false
    
    return buttonHeld && !buttonWasHeld
}

/// @param {Real} deviceIndex
/// @param {Real} button
function gamepad_button_check_ext_released(deviceIndex, button)
{
    if !gamepad_button_is_stick(button)
        return gamepad_button_check_released(deviceIndex, button)
    
    static inputManager = obj_input_manager
    
    var buttonHeld = gamepad_stick_check(deviceIndex, button)
    var buttonKey = string(deviceIndex) + string(button)
    var buttonWasHeld = inputManager.inputStickPrevious[$ buttonKey] ?? false
    
    return !buttonHeld && buttonWasHeld
}