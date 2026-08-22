sounds = [sfx_comboup_1, sfx_comboup_2, sfx_comboup_3]
combo = 5

titleSize = 4
titleIndex = 0
titleAlpha = 1
titleOffset = 60
titleDelete = false
titleShake = 15

titleGetShake = function()
{
    return random_range(-titleShake, titleShake)
}


audio_play_sound(
    array_random(sounds),
    0,
    false,
    0.5,
    0,
    1
)

alarm[0] = 60 * 3