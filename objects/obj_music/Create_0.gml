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

musicLibraryAddEntry(rm_test, mu_examplelevel, true)
musicLibraryAddEntry(rm_example_1, mu_dragonslair, true)