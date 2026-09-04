#macro gp_stick_left_left   1001
#macro gp_stick_left_right  1002
#macro gp_stick_left_up     1003
#macro gp_stick_left_down   1004

/// @self obj_input_manager
function scr_input_entry()
{
    
    inputRegister("jump", [global.keyJump], [gp_face1])
    inputRegister("dash", [global.keyDash], [gp_shoulderrb, gp_shoulderlb])
    inputRegister("attack", [global.keyAttack], [gp_face3])
    inputRegister("taunt", [global.keyTaunt], [gp_face4])
    inputRegister("up", [global.keyUp], [gp_padu, gp_stick_left_up])
    inputRegister("down", [global.keyDown], [gp_padd, gp_stick_left_down])
    inputRegister("left", [global.keyLeft], [gp_padl, gp_stick_left_left])
    inputRegister("right", [global.keyRight], [gp_padr, gp_stick_left_right])
    inputRegister("pause", [global.keyPause], [gp_start])
    inputRegister("enter", [global.keyEnter, global.keyJump], [gp_select, gp_face1])
    inputRegister("start", [global.keyEnter], [gp_start]) 
    inputRegister("back", [global.keyPause, global.keyAttack], [gp_face3])
    
    return
}