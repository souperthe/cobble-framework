musicDebris = instance_create_depth(0, 0, depth, obj_music_debris)

musicLibrary = {}
musicSecretLibrary = {}

musicInstanceCurrent = -1
musicInstancePitch = 1
musicInstanceSecretPitch = 1
musicInstanceJohn = -1
musicFadeTime = 800
musicLastPosition = 0
musicLastAsset = -1
musicLastLoop = false
musicInstanceSecret = undefined
musicEmitter = audio_emitter_create()
audio_emitter_bus(musicEmitter, global.busMusic)

secretEntering = false

musicMagnetLibrary = {}
musicMagnetState = 0

volumeJohn = 0
volumeJohnMusic = 1

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
scr_music_magnets_data()

lapMusic = [
    mu_pizzatime,
    mu_chase
]

musicPanicStart = function()
{
    audio_stop_sound(musicInstanceCurrent)
    
    var panicMusic = lapMusic[0]
    
    musicInstanceCurrent = audio_play_sound_on(musicEmitter, panicMusic, true, 0)
    musicMagnetState = 0
    return
}
