var camera = view_camera[0]
var windowWidth = window_get_width()
var windowHeight = window_get_height()

if !(windowHeight > 0 && windowWidth > 0)
    exit


var scale = ((windowWidth / baseWidth) + (windowHeight / baseHeight)) / 2
var viewWidth = windowWidth / scale
var viewHeight =  windowHeight / scale

currentWidth = windowWidth
currentHeight = windowHeight

camera_set_view_size(camera, viewWidth, viewHeight)
display_set_gui_size(viewWidth, viewHeight);
view_wport[0] = windowWidth
view_hport[0] = windowHeight

hudWidth = display_get_gui_width()
hudHeight = display_get_gui_height()

surface_resize(application_surface, windowWidth, windowHeight);