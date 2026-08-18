/// @param {Id.Layer} targetLayer
function Background(targetLayer) constructor 
{
    layerCurrent = targetLayer
    layerNumber = 0
    layerType = BackgroundType.UNDEFINED
    scrollX = 0
    scrollY = 0
    offsetX = 0
    offsetY = 0
    
    factorX = 0.25
    factorY = 0.25
    
    x = 0
    y = 0
    
    speedX = 0
    speedY = 0
    return
}

/// @return {Enum.BackgroundType}
function scr_background_get_type(layerPrefix)
{
    layerPrefix = string_lower(layerPrefix)
    
    static typeLibrary = {
        foreground : BackgroundType.FOREGROUND,
        background : BackgroundType.BACKGROUND,
        backgroundstill: BackgroundType.BACKROUNDSTILL,
        backgroundzigzag: BackgroundType.BACKROUNDZIGZAG,
        backgroundscroll: BackgroundType.BACKGROUNDSCROLL
    }
    
    if !struct_exists(typeLibrary, layerPrefix)
        return BackgroundType.UNDEFINED
    
    return struct_get(typeLibrary, layerPrefix)
}

/// @self obj_parrallax
/// @param {Struct.Background} background
function scr_background_init(background)
{
    var layerName = layer_get_name(background.layerCurrent)
    var layerNameSplit = string_split(layerName, "_")
    
    if array_length(layerNameSplit) == 1
        return
    
    trace(layerNameSplit)
    
    background.layerNumber = real(layerNameSplit[1])
    background.layerType = scr_background_get_type(layerNameSplit[0])
    background.offsetX = layer_get_x(background.layerCurrent)
    background.offsetY = layer_get_y(background.layerCurrent)
    background.speedX = layer_get_hspeed(background.layerCurrent)
    background.speedY = layer_get_vspeed(background.layerCurrent)
    
    
    var depthStart = 700
    var depthDirection = -1
    
    var factorBase = 0.30 - (background.layerNumber * 0.05)
    
    background.factorX = max(0.05, factorBase)
    background.factorY = max(0.05, factorBase)
    
    if background.layerType == BackgroundType.FOREGROUND
    {
        depthStart = -700
        depthDirection = 1
        factorBase = -(0.30 - (background.layerNumber * 0.10))
        
        background.factorX = factorBase
        background.factorY = factorBase
    }
    
        
    
    var depthStep = 10 * background.layerNumber
    var depthTarget = depthStart + (depthDirection * depthStep)
    
    layer_depth(background.layerCurrent, depthTarget)
    
    return
}