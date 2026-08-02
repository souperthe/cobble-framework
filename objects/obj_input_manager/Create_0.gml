scr_globals_keys();
function InputData(targetKey) constructor
{
    pressed = false
    held = false
    key = targetKey
    return
}


inputLibrary = {}
inputLibrary[$ "jump"] = new InputData(global.keyJump)
inputLibrary[$ "dash"] = new InputData(global.keyDash)
inputLibrary[$ "attack"] = new InputData(global.keyAttack)
inputLibrary[$ "up"] = new InputData(global.keyUp)
inputLibrary[$ "down"] = new InputData(global.keyDown)
inputLibrary[$ "left"] = new InputData(global.keyLeft)
inputLibrary[$ "right"] = new InputData(global.keyRight)
inputLibrary[$ "taunt"] = new InputData(global.keyTaunt)


inputCheck = function(inputName, held)
{
    
    var inputTarget = inputLibrary[$ inputName]
    
    if (is_undefined(inputTarget))
        return false
    
    if held
        return inputTarget.held
    
    return inputTarget.pressed
}