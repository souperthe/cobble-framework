var inputLibraryNames = variable_struct_get_names(inputLibrary)
var inputLibraryNamesLength = array_length(inputLibraryNames)

for (var index = 0; index < inputLibraryNamesLength; index++)
{
    var inputName = inputLibraryNames[index]
    var inputData = inputLibrary[$ inputName]
    var inputKeys = inputData.keys
    
    inputData.held = keyboard_check_array(inputKeys, keyboard_check)
    inputData.pressed = keyboard_check_array(inputKeys, keyboard_check_pressed)
    inputData.released = keyboard_check_array(inputKeys, keyboard_check_released)
    
    if inputData.pressed
        inputData.signalPressed.fire()
    
    if inputData.released
        inputData.signalReleased.fire()
    
    continue;
}
