audio_stop_sound(collectSound)

var soundPitch = 1

if collectSoundUseRandomPitch
    soundPitch = random_pitch()

audio_play_sound(collectSound, 0, false, 0.5, 0, soundPitch)

global.collect += collectAmount

global.comboTime += collectAmount
global.comboTime = clamp(global.comboTime, 0, global.comboTimeMax)

obj_hud_score.collectCreate(x, y, sprite_index, collectAmount)

if collectExpression != undefined
    obj_hud_tv.tvForceExpression(collectExpression, 100)


instance_destroy()
