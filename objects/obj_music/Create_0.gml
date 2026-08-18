musicLibrary = {}
musicSecretLibrary = {}

musicInstanceCurrent = -1
musicFadeTime = 800
musicLastPosition = 0
musicInstanceSecret = undefined

/// @param {Asset.GMRoom} targetRoom
/// @param {Asset.GMSound} targetSong
/// @param {bool} songFade
musicLibraryAddEntry = function(targetRoom, targetSong, songFade)
{
    var roomName = room_get_name(targetRoom)
    musicLibrary[$ roomName] = new MusicEntry(targetSong, songFade)
    return
}

/// @param {Asset.GMRoom} targetRoom
/// @param {Asset.GMSound} targetSong
/// @param {bool} songFade
musicLibraryAddSecretEntry = function(targetRoom, targetSong, songFade)
{
    var roomName = room_get_name(targetRoom)
    musicSecretLibrary[$ roomName] = new MusicEntry(targetSong, songFade)
    return
}

scr_music_data()



lapMusic = []
lapMusic[0] = mu_pizzatime
lapMusic[1] = mu_chase

musicPanicStart = function()
{
    audio_stop_sound(musicInstanceCurrent)
    
    musicInstanceCurrent = audio_play_sound(mu_pizzatime, 0, true)
    return
}