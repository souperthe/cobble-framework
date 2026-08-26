var event = async_load[? "event_type"]
var padIndex = async_load[? "pad_index"]

if event == "gamepad lost"
    gamepadLost(padIndex)