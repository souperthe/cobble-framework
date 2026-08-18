backgrounds = []
backgroundSteps = array_create(BackgroundType._length, scr_background_step_still)

backgroundSteps[BackgroundType.BACKGROUND] = scr_background_step_background
backgroundSteps[BackgroundType.FOREGROUND] = scr_background_step_foreground
backgroundSteps[BackgroundType.BACKROUNDSTILL] = scr_background_step_still
backgroundSteps[BackgroundType.BACKROUNDZIGZAG] = scr_background_step_zigzag
backgroundSteps[BackgroundType.BACKGROUNDSCROLL] = scr_background_step_scroll