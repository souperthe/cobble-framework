if scr_save_room_contains(id)
    exit

var killedPitch = global.combo / 250

super_sound_oneshot(x, y, sfx_killenemy, 1 + killedPitch)

var deadObject = instance_create_depth(x, y, depth, obj_baddie_dead)
var deadDirection = sign(x - killedFromX)
deadObject.sprite_index = spriteDead
deadObject.velocityX = deadDirection * random_range(10, 15)
obj_camera.shake(6, 6)

audio_stop_sound(screamSound)

obj_hud_combo.comboAdd(60)
scr_effect_create("bangeffect", x, y)

scr_debris_explosion(6, x, y, spr_debris_baddie, 5, 10)
scr_debris_explosion(6, x, y, spr_debris_slapstar, 10, 10)

global.levelBaddiesKilled++

scr_save_room_register(id, escape)