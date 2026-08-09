drawing = place_meeting(x, y, obj_player);

if (!drawing)
{
    var distance = 250;
    backroundAlpha = distance_to_object(obj_player) / distance;
    backroundAlpha -= 0.25;
    backroundAlpha = clamp(backroundAlpha, 0, 1);
}
else 
{
    backroundAlpha = approach(backroundAlpha, 0, 0.1);
}

for (var index = 0; index < backroundSpriteNumber; index++)
{
    if (!backroundParallaxEnabled)
    {
        var scrollSpeed = (index + 1) / 3;
        
        backroundSpritePosition[index] -= scrollSpeed;
        
        if (backroundWidth > 0 && backroundSpritePosition[index] <= -backroundWidth)
        {
            backroundSpritePosition[index] += backroundWidth;
        }

    }
    else
    {
        var camX = camera_get_view_x(view_camera[0]);
        var camY = camera_get_view_y(view_camera[0]);
        
        var parallaxFactor = (index < array_length(backroundParallax2)) ? backroundParallax2[index] : 0.1;
        
        if (is_array(backroundSpritePositionStart[index]))
        {
            var startX = backroundSpritePositionStart[index][0];
            var startY = backroundSpritePositionStart[index][1];
            
            backroundSpritePosition[index] = [startX + (camX * parallaxFactor), startY + (camY * parallaxFactor)];
        }
    }
}