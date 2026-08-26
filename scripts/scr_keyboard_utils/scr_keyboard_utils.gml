function check_input(inputName, held)
{
    return obj_input_manager.inputCheck(inputName, held)
}

/// @param {Array<Constant.VirtualKey | Real>} keys
/// @param {Function} keyboardFunction
/// @return {Bool}
function keyboard_check_array(keys, keyboardFunction)
{
    
    if !is_array(keys)
    {
        return keyboardFunction(keys)
    }
    
    var keysLength = array_length(keys)
    
    for (var index = 0; index < keysLength; index++)
    {
        var key = keys[index]
        
        if keyboardFunction(key)
        {
            return true
        }
        
        continue
    }

    return false
}
