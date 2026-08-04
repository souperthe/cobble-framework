audio_play_sound(sfx_killenemy, 0, false)

var deadObject = instance_create_depth(x, y, depth, obj_baddie_dead)
deadObject.sprite_index = spriteDead
deadObject.velocityX = (sign(x - killedFromX) * random_range(10, 15))
obj_camera.shake(6, 6)