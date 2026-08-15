if scr_save_room_contains(id)
    exit

var realX = (x - sprite_xoffset)
var realY = (y - sprite_yoffset)

var centerX = realX + (sprite_width / 2)
var centerY = realY + (sprite_height / 2)

super_sound_oneshot(centerX, centerY, sfx_killenemy)

scr_effect_create("bangeffect", centerX, centerY)
scr_debris_explosion(6, centerX, centerY, spr_debris_baddie, 5, 10)

var deadObject = instance_create_depth(centerX, centerY, depth, obj_baddie_dead)
deadObject.sprite_index = spriteDead
deadObject.velocityX = (sign(centerX - hitX) * random_range(10, 15))

super_sound_oneshot_emitter(deadObject.emitter, sfx_rat_dead, random_pitch())

obj_hud_combo.comboAdd(60)
obj_camera.shake(6, 0.3)

scr_save_room_register(id)

audio_stop_sound(sniffSound)

delete emitter