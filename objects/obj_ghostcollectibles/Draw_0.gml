var collectedLength = array_length(collected)

for (var index = 0; index < collectedLength; index++)
{
    var collect = collected[index]
    
    draw_sprite_ext(collect.sprite, collect.spriteFrame, collect.x, collect.y, 1, 1, 0, c_white, 0.5)
    continue
}