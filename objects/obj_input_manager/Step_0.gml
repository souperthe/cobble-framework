var inputLibraryNames = variable_struct_get_names(inputLibrary)
var inputLibraryNamesLength = array_length(inputLibraryNames)

for (var index = 0; index < inputLibraryNamesLength; index++)
{
    var inputName = inputLibraryNames[index]
    var inputData = inputLibrary[$ inputName]
    var inputKey = inputData.key
    
    inputData.held = keyboard_check(inputKey)
    inputData.pressed = keyboard_check_pressed(inputKey)
    inputData.released = keyboard_check_released(inputKey)
    
    if inputData.pressed
        inputData.signalPressed.fire()
    
    if inputData.released
        inputData.signalReleased.fire()
    
    continue;
}
