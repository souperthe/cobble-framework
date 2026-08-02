var viewCamera = view_camera[0];
var viewWidth = camera_get_view_width(viewCamera);
var viewHeight = camera_get_view_height(viewCamera);
var cameraX = camera_get_view_x(viewCamera);
var cameraY = camera_get_view_y(viewCamera);
var centerX = cameraX + (viewWidth / 2);
var centerY = cameraY + (viewHeight / 2);

audio_listener_position(centerX, centerY, 0);
audio_listener_orientation(0, 0, 1, 0, -1, 0);