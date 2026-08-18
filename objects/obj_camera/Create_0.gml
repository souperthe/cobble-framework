stateCurrent = CameraStates.normal
stateLibrary = []
stateLibrary[CameraStates.normal] = scr_camera_state_normal
offsetX = 0;
offsetY = 0;
machOffsetX = 0
machOffsetY = 0
offsetSpeed = 4
offsetXTarget = 0
offsetYTarget = 0
centerX = 0;
centerY = 0;
lock = false;

/// @param {Real} amount
/// @param {Real} alpha
shake = function(amount, alpha)
{
    shakeAmount = amount
    shakeAlpha = alpha
    return
}
shakeAmount = 0
shakeAlpha = 0
audio_falloff_set_model(audio_falloff_exponent_distance_scaled);
audio_listener_orientation(0, -1, 0, 0, 0, -1);


runStates = function()
{
    var stateFunction = stateLibrary[stateCurrent]
    
    if lock
        return

    if !is_undefined(stateFunction)
        stateFunction()
    return
}