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
        
        audio_play_sound(targetSong, 0, false)
        music = true
    }
    
}