var inputLibraryNames = variable_struct_get_names(inputLibrary)
var inputLibraryNamesLength = array_length(inputLibraryNames)

for (var index = 0; index < inputLibraryNamesLength; index++)
{
    var inputName = inputLibraryNames[index]
    var inputData = inputLibrary[$ inputName]
    var inputKeys = inputData.keys
    var inputButtons = inputData.buttons
    var inputIndex = inputData.buttonIndex
    
    var heldKeyboard = keyboard_check_array(inputKeys, keyboard_check)
    var heldGamepad = gamepad_check_array(inputIndex, inputButtons, gamepad_button_check_ext)
    
    var pressedKeyboard = keyboard_check_array(inputKeys, keyboard_check_pressed)
    var pressedGamepad = gamepad_check_array(inputIndex, inputButtons, gamepad_button_check_ext_pressed)
    
    var releasedKeyboard = keyboard_check_array(inputKeys, keyboard_check_released)
    var releasedGamepad = gamepad_check_array(inputIndex, inputButtons, gamepad_button_check_ext_released)
    
    
    inputData.held = heldKeyboard || heldGamepad
    inputData.pressed = pressedKeyboard || pressedGamepad
    inputData.released = releasedKeyboard || releasedGamepad
    
    if inputData.pressed
        inputData.signalPressed.fire()
    
    if inputData.released
        inputData.signalReleased.fire()
    
    continue;
}

var inputGamepadDevicesLength = array_length(inputGamepadDevices)

for (var deviceIndex = 0; deviceIndex < inputGamepadDevicesLength; deviceIndex++)
{
    var device = inputGamepadDevices[deviceIndex]
    
    for (var stickIndex = 0; stickIndex < inputStickButtonsLength; stickIndex++)
    {
        var button = inputStickButtons[stickIndex]
        var buttonKey = string(device) + string(button)
        
        inputStickPrevious[$ buttonKey] = gamepad_stick_check(device, button)
        continue
    }
    
    continue
}
