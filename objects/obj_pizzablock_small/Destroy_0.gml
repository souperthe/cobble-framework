if scr_save_room_contains(id)
    exit

var effectPositionX = x + (sprite_width / 2)
var effectPositionY = y + (sprite_height / 2)

scr_effect_create(pizzaBlockEffect, effectPositionX, effectPositionY)

sleep(5)

audio_stop_sound(sfx_collect)
var soundPitchRange = 0.1
var soundPitch = random_range(1 - soundPitchRange, 1 + soundPitchRange)
super_sound_oneshot(effectPositionX, effectPositionY, sfx_collect, soundPitch)
audio_sound_gain(sfx_collect, 0.5)

global.comboTime += pizzaBlockCombo
global.comboTime = clamp(global.comboTime, 0, global.comboTimeMax);

global.collect += pizzaBlockAmount
obj_hud_score.smallNumber(effectPositionX, y, pizzaBlockAmount)


audio_stop_sound(global.soundBlockBreak)
global.soundBlockBreak = super_sound_oneshot_list(x, y, breakSounds, random_pitch())

repeat (debrisAmount)
{
    var debrisX = x + random_range(0, sprite_width)
    var debrisY = y + random_range(0, sprite_height)
    var debris = scr_debris_create(debrisX, debrisY, debrisSprite)
    
    debris.velocityX = random_range(-5, 5)
    debris.velocityY = random_range(-10, 10)
    continue
}

scr_save_room_register(id)