musicLibrary = {}
musicSecretLibrary = {}

musicInstanceCurrent = -1
musicInstancePitch = 1
musicFadeTime = 800
musicLastPosition = 0
musicInstanceSecret = undefined

secretEntering = false

musicMagnetLibrary = {}
musicMagnetState = 0

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


musicMagnetLibrary[$ mu_pizzatime] = [
    new Magnet(0, 171.25, 1000),
    new Magnet(171.25, infinity, 5000)
]

trace(musicMagnetLibrary)

lapMusic = []
lapMusic[0] = mu_pizzatime
lapMusic[1] = mu_chase

musicPanicStart = function()
{
    audio_stop_sound(musicInstanceCurrent)
    
    var panicMusic = lapMusic[0]
    
    musicInstanceCurrent = audio_play_sound(panicMusic, 0, false)
    musicMagnetState = 0
    return
}