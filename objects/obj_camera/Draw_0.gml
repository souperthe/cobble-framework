var camera = view_camera[0]
var cameraX = camera_get_view_x(camera);
var cameraY = camera_get_view_y(camera);
var viewWidth = camera_get_view_width(camera);
var viewHeight = camera_get_view_height(camera);
var centerX = cameraX + (viewWidth / 2);
var centerY = cameraY + (viewHeight / 2);

draw_sprite(spr_baddie, 0, centerX - 16, centerY - 16)