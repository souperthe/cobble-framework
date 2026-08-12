audio_play_sound(sfx_tvswitch_enter, 0, false, 1, 0, random_pitch())

staticIndex = 0
staticMax = 15
staticDirection = 1
staticUse = true
staticSprite = spr_tvstatic

backgroundSprite = spr_technicaldifficulty_bg
backgroundColor = make_colour_rgb(216, 104, 160)

characterSprite = spr_technicaldiffculty_pep
characterFrame = irandom(sprite_get_number(characterSprite) - 1)

depth = -100
alarm[0] = 80