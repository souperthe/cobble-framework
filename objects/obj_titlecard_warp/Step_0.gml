if !fadeIn
{
    
    fadeAlpha = approach(fadeAlpha, 1, 0.1)
    
    if fadeAlpha >= 1
    {
        fadeIn = true
        start = true
        alarm[0] = 180
    }
    
    
}
else { 
    fadeAlpha = approach(fadeAlpha, 0, 0.1)
    
    if (fadeAlpha <= 0 && !music)
    {
        var targetSong = songs[$ global.levelName]
        
        audio_play_sound_on(obj_music.musicEmitter, targetSong, 0, false)
        music = true
    }
    
}

if fadeOut
{
    fadeOutAlpha = approach(fadeOutAlpha, 1, 0.03)
    
    if !ending && fadeOutAlpha == 1
    {
        alarm[1] = 10
        ending = true
    }
}