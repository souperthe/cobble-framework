if scr_save_room_contains(id)
    exit

repeat (debrisAmount)
{
    var debrisX = x + random_range(0, sprite_width)
    var debrisY = y + random_range(0, sprite_height)
    var debris = scr_debris_create(debrisX, debrisY, debrisSprite)
    
    debris.velocityX = random_range(-5, 5)
    debris.velocityY = random_range(-10, 10)
    debris.animateSpeed = random_range(0.1, 0.7)
    debris.animate = true
    continue
}

if breakEffect != ""
{
    
    repeat (breakEffectAmount)
    {
        var effectX = x + random_range(0, sprite_width)
        var effectY = y + random_range(0, sprite_height)
        scr_effect_create(breakEffect, effectX, effectY)
    }
}

sleep(5)

audio_stop_sound(global.soundBlockBreak)
global.soundBlockBreak = super_sound_oneshot_list(x, y, breakSounds, random_pitch())
scr_save_room_register(id)