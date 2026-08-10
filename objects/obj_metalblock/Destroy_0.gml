if scr_save_room_contains(id)
    exit


repeat (8)
{
    var debrisPositionX = x + random_range(0, 64)
    var debrisPositionY = y + random_range(0, 64)
    var debris = scr_debris_create(debrisPositionX, debrisPositionY, spr_debris_metalblock)
    
    debris.velocityY = random_range(-5, -10)
    debris.velocityX = random_range(-5, 5)
}

sleep(5)

scr_effect_create("bangeffect", x + 32, y + 32)
super_sound_oneshot(x, y, sfx_breakmetal, random_pitch())
obj_camera.shake(20, 1)
scr_save_room_register(id)