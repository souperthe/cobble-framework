sprite_index = gateSprite;

backroundSpriteNumber = sprite_get_number(backroundSprite);
backroundWidth = sprite_get_width(backroundSprite);
backroundHeight = sprite_get_height(backroundSprite);

backroundSpritePosition = array_create(backroundSpriteNumber, 0);
backroundSpritePositionStart = array_create(backroundSpriteNumber, 0);

backroundAlpha = 1;
backroundSurfaceMask = noone;
backroundSurfaceClip = noone;

for (var index = 0; index < backroundSpriteNumber; index++)
{
    if (backroundParallaxEnabled)
    {
        var position = (index < array_length(backroundParallax2)) ? backroundParallax2[index] : 0.1;
        
        var xTarget = x - (x * position);
        var yTarget = y - (y * position);
        
        var positionWidth = (obj_screensizer.currentWidth / 4) * position;
        var positionHeight = (obj_screensizer.currentHeight / 4) * position;
        
        var xStart = xTarget - positionWidth;
        var yStart = yTarget - positionHeight;
        
        backroundSpritePositionStart[index] = [xStart, yStart];
        backroundSpritePosition[index] = [xStart, yStart];
    }
    else
    {
        backroundSpritePositionStart[index] = 0;
        backroundSpritePosition[index] = 0;
    }
}