var camera = view_camera[0]
var cameraX = camera_get_view_x(camera)
var cameraY = camera_get_view_y(camera)

var backgroundsLength = array_length(backgrounds)

for (var index = 0; index < backgroundsLength; index++)
{
    var background = backgrounds[index]
    var backgroundStep = backgroundSteps[background.layerType]
    
    backgroundStep(background, cameraX, cameraY)
    continue
}