if fake
{
    draw_self()
    exit
}

var drawPointsLength = array_length(drawPoints)

for (var index = 0; index < drawPointsLength; index++)
{
    var drawData = drawPoints[index]
    
    draw_sprite(sprite_index, image_index, drawData.drawX, drawData.drawY)
    
    continue
}