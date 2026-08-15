musicLibrary = {}
musicInstanceCurrent = -1
musicFadeTime = 800

/// @param {Asset.GMRoom} targetRoom
/// @param {Asset.GMSound} targetSong
/// @param {bool} songFade
musicLibraryAddEntry = function(targetRoom, targetSong, songFade)
{
    var roomName = room_get_name(targetRoom)
    musicLibrary[$ roomName] = new MusicEntry(targetSong, songFade)
    return
}

musicLibraryAddEntry(rm_example_1, mu_solidhouse, true)
//musicLibraryAddEntry(rm_test, mu_hub, true)


musicPanicStart = function()
{
    audio_stop_sound(musicInstanceCurrent)
    
    musicInstanceCurrent = audio_play_sound(mu_pizzatime, 0, true)
    return
}