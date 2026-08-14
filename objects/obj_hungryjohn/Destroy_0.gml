if scr_save_room_contains(id)
    exit


if global.levelCurrent != undefined
    scr_level_panic()

obj_hud_combo.comboAdd(60)

var centerX = x + sprite_get_xoffset(spriteDead)
var centerY = y + sprite_get_yoffset(spriteDead)
var deadObject = instance_create_depth(centerX, centerY, depth, obj_baddie_dead)
deadObject.sprite_index = spriteDead
deadObject.velocityX = (sign(centerX - playerX) * random_range(10, 15))
deadObject.angle = 0

scr_effect_create("bangeffect", centerX, centerY)
scr_debris_explosion(6 * 3, centerX, centerY, spr_debris_baddie, 5, 10)
scr_debris_explosion(5 * 3, centerX, centerY, spr_debris_slapstar, 5, 10)

super_sound_oneshot(centerX, centerY, sfx_killenemy)
audio_play_sound(sfx_escaperumble, 0, false)
audio_play_sound(sfx_johnimpact, 0, false)

instance_create_depth(0, 0, depth, obj_hud_pillarflash)
obj_camera.shake(8, 0.2)


scr_save_room_register(id)