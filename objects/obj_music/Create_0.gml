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
    mu_lap2,
    mu_tarragon
]

musicPanicStart = function()
{
    audio_stop_sound(musicInstanceCurrent)
    
    var panicMusic = lapMusic[0]
    
    musicInstanceCurrent = audio_play_sound_on(musicEmitter, panicMusic, true, 0)
    musicMagnetState = 0
    return
}

musicPanicStartLap = function()
{
    
    var lapIndex = global.panicLap
    var lapMusicLength = array_length(lapMusic)
    
    if lapIndex >= lapMusicLength
    {
        return
    }
    
    var lapSong = lapMusic[lapIndex]
    
    var musicInstanceOld = musicInstanceCurrent
    
    audio_sound_gain(musicInstanceOld, 0, 500)
    musicDebris.add(musicInstanceOld)
    
    musicInstanceCurrent = audio_play_sound_on(musicEmitter, lapSong, true, 0, 0)
    audio_sound_gain(musicInstanceCurrent, 1, 500)
    
    return
}
