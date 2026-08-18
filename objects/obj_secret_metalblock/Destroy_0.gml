if scr_save_room_contains(id)
    exit

var imageScaleX = abs(image_xscale)
var imageScaleY = abs(image_yscale)
var debrisMultipler = max(imageScaleX, imageScaleY)
var debrisAmount = 8 * debrisMultipler

repeat debrisAmount
{
    var debris = scr_debris_create(x, y, debrisSprite)
    var debrisX = x + random_range(0, sprite_width)
    var debrisY = y + random_range(0, sprite_height)
    
    debris.x = debrisX
    debris.y = debrisY
    debris.spriteFrame = random_range(0, debris.spriteNumber - 1)
    debris.velocityX = random_range(-5, 5)
    debris.velocityY = random_range(-10, 10)
    continue
}

super_sound_oneshot(x, y, sfx_breakmetal, random_pitch())
obj_camera.shake(20, 1)
scr_save_room_register(id)