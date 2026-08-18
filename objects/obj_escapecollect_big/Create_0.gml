event_inherited()

sprite_index = spr_escapecollect_big
collectSound = sfx_escapecollect_big
collectAmount = 100
collectSoundUseRandomPitch = true
collectSoundPitchRange = .2
collectExpression = spr_tv_exprcollect
image_alpha = 0.35

global.signalPanic.connect(scr_escapecollect_check, true)

