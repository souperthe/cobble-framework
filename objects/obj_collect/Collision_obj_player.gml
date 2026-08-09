
audio_stop_sound(collectSound)

var soundPitch = 1

if collectSoundUseRandomPitch
    soundPitch = random_pitch()

audio_play_sound(collectSound, 0, false, 0.5, 0, soundPitch)

global.collect += collectAmount

if global.combo > 0
    global.comboTime += collectAmount
    global.comboTime = clamp(global.comboTime, 0, global.comboTimeMax)

obj_hud_score.collectCreate(x, y, sprite_index, collectAmount)
obj_hud_score.smallNumber(x, y, collectAmount)

if collectExpression != undefined
    obj_hud_tv.tvForceExpression(collectExpression, 100)


scr_save_room_register(id)
instance_destroy()
