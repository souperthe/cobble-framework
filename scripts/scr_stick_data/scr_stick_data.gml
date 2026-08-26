/// @param {Constant.GamepadAxis} targetAxis
/// @param {Real} targetDirection
function StickData(targetAxis, targetDirection) constructor 
{
    axis = targetAxis
    direction = clamp(targetDirection, -1, 1)
    return
}


function gamepad_stick_data()
{
    var stickData = {}
    
    stickData[$ gp_stick_left_left] = new StickData(gp_axislh, -1)
    stickData[$ gp_stick_left_right] = new StickData(gp_axislh, 1)
    
    stickData[$ gp_stick_left_up] = new StickData(gp_axislv, -1)
    stickData[$ gp_stick_left_down] = new StickData(gp_axislv, 1)
    
    return stickData
}