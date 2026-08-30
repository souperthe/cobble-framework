pause = false

gamepadsLost = []
inputStartListener = -1
depth = -500

pauseExit = function()
{
    gamepadsLost = []
    
    if !obj_pause.paused
    {
        instance_activate_all()
    }
    
    pause = false
    inputStartListener.disconnect()
    return
}

gamepadLost = function(gamepadIndex)
{
    instance_deactivate_all(true)
    instance_activate_object(obj_screensizer)
    instance_activate_object(obj_input_manager)
    instance_activate_object(obj_pause)
    
    var inputStart = obj_input_manager.inputGet("start")
    
    inputStartListener = inputStart.signalPressed.connect(pauseExit)
    pause = true
    array_push(gamepadsLost, gamepadIndex + 1)
    return
}