var camera = view_camera[0]
var windowWidth = window_get_width()
var windowHeight = window_get_height()

if !(windowHeight > 0 && windowWidth > 0)
    exit


var scale = ((windowWidth / baseWidth) + (windowHeight / baseHeight)) / 2
var viewWidth =  windowWidth / scale
var viewHeight = windowHeight / scale
camera_set_view_size(camera, viewWidth, viewHeight)
view_wport[0] = windowWidth
view_hport[0] = windowHeight

surface_resize(application_surface, windowWidth, windowHeight);