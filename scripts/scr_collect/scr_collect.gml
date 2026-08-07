
function Collect(positionX, positionY, sprite, value) constructor 
{
    x = positionX
    y = positionY
    spriteIndex = sprite
    imageIndex = 0
    imageNumber = sprite_get_number(sprite)
    velocityX = 0
    velocityY = 0
    collectValue = value
    return
}