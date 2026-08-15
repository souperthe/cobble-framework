var realX = (x - sprite_xoffset)
var realY = (y - sprite_yoffset)

var centerX = realX + (sprite_width / 2)
var centerY = realY + (sprite_height / 2)

audio_emitter_position(emitter, centerX, centerY, 0)

if !audio_is_playing(sniffSound)
    sniffSound = super_sound_loop_emitter(emitter, sfx_rat_sniff)