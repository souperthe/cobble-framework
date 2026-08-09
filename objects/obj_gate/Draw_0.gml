if (backroundAlpha < 1)
{
    var spriteWidth = sprite_get_width(sprite_index);
    var spriteHeight = sprite_get_height(sprite_index);
    var spriteOffsetX = sprite_get_xoffset(sprite_index);
    var spriteOffsetY = sprite_get_yoffset(sprite_index);

    if (!surface_exists(backroundSurfaceMask))
    {
        backroundSurfaceMask = surface_create(spriteWidth, spriteHeight);
        surface_set_target(backroundSurfaceMask);
        
        draw_clear(c_black);
        
        gpu_set_blendmode(bm_subtract);
        draw_sprite(sprite_index, 1, spriteOffsetX, spriteOffsetY);
        gpu_set_blendmode(bm_normal);
        
        surface_reset_target();
    }
    
    if (!surface_exists(backroundSurfaceClip))
    {
        backroundSurfaceClip = surface_create(spriteWidth, spriteHeight);
    }
    
    surface_set_target(backroundSurfaceClip);
    draw_clear(c_black);
    
    for (var index = 0; index < backroundSpriteNumber; index++)
    {
        if (!backroundParallaxEnabled)
        {
            var position = is_numeric(backroundSpritePosition[index]) ? backroundSpritePosition[index] : 0;
            draw_sprite_tiled(backroundSprite, index, position, spriteHeight); 
        }
        else
        {
            if (is_array(backroundSpritePosition[index]))
            {
                var backroundX = backroundSpritePosition[index][0];
                var backroundY = backroundSpritePosition[index][1];
                draw_sprite_tiled(backroundSprite, index, backroundX - x, (backroundY + spriteHeight) - y);
            }
        }
    }
    
    gpu_set_blendmode(bm_subtract);
    draw_surface(backroundSurfaceMask, 0, 0);
    gpu_set_blendmode(bm_normal);
    
    surface_reset_target();

    draw_surface(backroundSurfaceClip, x - spriteOffsetX, y - spriteOffsetY);
}

if (backroundAlpha > 0)
{
    draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, backroundAlpha);
}

draw_sprite(sprite_index, 0, x, y)

var player = instance_place(x, y, obj_player)

if player != noone && playerCanEnter(player)
    draw_sprite(spr_doorarrow, 0, player.x, player.y - 40)