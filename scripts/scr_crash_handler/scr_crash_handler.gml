function scr_crash_handler(expection)
{
    audio_play_sound(sfx_pephurt, 10, false)
    
    show_error(expection, false)
    trace(expection)
    
    var startTime = current_time
    while (current_time - startTime < 500) {
    }
    
    return 1
}