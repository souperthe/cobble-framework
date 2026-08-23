var used = false


if global.warpDoor == "LAP"
{
    used = true
    
    global.roomStartX = x
    global.roomStartY = y
    
    obj_camera.lock = false
    image_index = 0
    
    
    with obj_player
    {
        x = other.x
        y = other.y
        other.player = id
        other.paletteSprite = paletteSprite
        other.paletteIndex = paletteIndex
        signalPlacedAtDoor.fire()
    }
}


if !used
{
    instance_destroy()
    exit
}