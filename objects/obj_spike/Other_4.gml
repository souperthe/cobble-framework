var columns = image_xscale;
var rows = image_yscale;
var cellWidth = sprite_get_width(sprite_index)
var cellHeight = sprite_get_height(sprite_index)

for (var indexX = 0; indexX < columns; indexX++)
{
    
    for (var indexY = 0; indexY < rows; indexY++)
    {
        var drawData = {
            drawX: x + (indexX * cellWidth),
            drawY: y + (indexY * cellHeight)
        }
        
        array_push(drawPoints, drawData)
        continue
    }
    
    continue
}