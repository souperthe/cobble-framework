collectList = []
collectShake = 0
collectVisual = string(global.collect)
collectPrevious = collectVisual
collectReceived = new Signal()
collectOffsets = []

scoreX = 0
scoreY = 0
scoreYOffset = 0


collectCreate = function(positionX, positionY, sprite, value)
{
    var camera = view_camera[0]
    var cameraViewX = camera_get_view_x(camera)
    var cameraViewY = camera_get_view_y(camera)
    
    positionX -= cameraViewX
    positionY -= cameraViewY
    
    var collect = new Collect(positionX, positionY, sprite, value)
    
    array_push(collectList, collect)
    
    return collect
}

/// @param {Struct.Collect} collect
collectProcess = function(collect)
{
    
    var dir = point_direction(collect.x, collect.y, 110, 60)
    var floatSpeed = 25
    var outOfX = collect.x < 140
    var outOfY = collect.y < 120
    
    collect.velocityX = lengthdir_x(floatSpeed, dir)
    collect.velocityY = lengthdir_y(floatSpeed, dir)
    
    collect.x += collect.velocityX
    collect.y += collect.velocityY
    collect.imageIndex += 0.35
    
    if collect.imageIndex > collect.imageNumber - 1
        collect.imageIndex = frac(collect.imageIndex)
    
    if !(outOfX && outOfY)
        return
    
    var collectIndex = array_get_index(collectList, collect)
    
    collectReceived.fire(collect)
    
    array_delete(collectList, collectIndex, 1)
    collectShake += 10
    
    if collectShake > 30
        collectShake = 30
    
    return
}


smallNumber = function(targetX, targetY, targetAmount)
{
    
    var smallNumber = instance_create_depth(targetX + 16, targetY, 0, obj_smallnumber)
    smallNumber.number = targetAmount
    
    return
}

