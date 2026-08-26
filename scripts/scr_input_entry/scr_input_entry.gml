/// @self obj_input_manager
function scr_input_entry()
{
    inputRegister("jump", [global.keyJump])
    inputRegister("dash", [global.keyDash])
    inputRegister("attack", [global.keyAttack])
    inputRegister("up", [global.keyUp])
    inputRegister("down", [global.keyDown])
    inputRegister("left", [global.keyLeft])
    inputRegister("right", [global.keyRight])
    inputRegister("taunt", [global.keyTaunt])
    inputRegister("pause", [global.keyPause])
    inputRegister("enter", [global.keyEnter, global.keyJump])
    return
}