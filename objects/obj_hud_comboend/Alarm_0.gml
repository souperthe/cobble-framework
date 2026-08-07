global.collect += 1
comboAmount -= 1

var collectSprite = choose(
    spr_shroomcollect, 
    spr_tomatocollect, 
    spr_cheesecollect, 
    spr_sausagecollect, 
    spr_pineapplecollect
)
var collectXOffset = random_range(-60, 60)
var collectYOffset = random_range(-60, 60)

obj_hud_score.collectCreate(
    obj_hud_combo.playerTarget.x + collectXOffset,
    obj_hud_combo.playerTarget.y + collectXOffset,
    collectSprite,
    1
)

//var volume = random_range(0.3, 0.5)
//
//audio_stop_sound(sfx_collect)
//audio_play_sound(sfx_collect, 0, false, volume, 0, random_pitch())

if comboAmount >= 0
    alarm[0] = 2
else
{
    global.comboScore = 0
    comboDelete = true
}