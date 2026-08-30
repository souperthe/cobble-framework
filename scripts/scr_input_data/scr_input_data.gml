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