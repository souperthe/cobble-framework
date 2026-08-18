var layers = layer_get_all()
var layersLength = array_length(layers)

backgrounds = []


for (var index = 0; index < layersLength; index++)
{
    var layerCurrent = layers[index]
    var layerBackroundId = layer_background_get_id(layerCurrent)
    
    if layerBackroundId == -1
        continue
    
    var layerBackround = new Background(layerCurrent)
    
    array_push(backgrounds, layerBackround)
    
    scr_background_init(layerBackround)
    
    continue
}