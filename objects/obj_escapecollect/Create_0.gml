event_inherited()

sprite_index = spr_escapecollect_small
collectSound = sfx_escapecollect_small
collectSoundUseRandomPitch = true
collectSoundPitchRange = 0.25
collectSoundAddition = -0.15
image_alpha = 0.35

global.signalPanic.connect(scr_escapecollect_check, true)

