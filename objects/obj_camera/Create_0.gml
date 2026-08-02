stateCurrent = CameraStates.normal
stateLibrary = []
stateLibrary[CameraStates.normal] = scr_camera_state_normal
offsetX = 0;
offsetY = 0;
centerX = 0;
centerY = 0;
audio_falloff_set_model(audio_falloff_exponent_distance_scaled);
audio_listener_orientation(0, -1, 0, 0, 0, -1);