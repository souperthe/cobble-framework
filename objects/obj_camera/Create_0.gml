stateCurrent = CameraStates.normal
stateLibrary = []
stateLibrary[CameraStates.normal] = scr_camera_state_normal
offsetX = 0;
offsetY = 0;
offsetSpeed = 4
centerX = 0;
centerY = 0;
audio_falloff_set_model(audio_falloff_exponent_distance_scaled);
audio_listener_orientation(0, -1, 0, 0, 0, -1);


runStates = function()
{
    var stateFunction = stateLibrary[stateCurrent]

    if !is_undefined(stateFunction)
        stateFunction()
    return
}