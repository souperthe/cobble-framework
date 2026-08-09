playerTouching = other

if !playerCanEnter(playerTouching)
    exit

if !check_input("up", false)
    exit

playerTouching.stateSwitch(PlayerStates.ENTERLEVEL)
audio_sound_gain(obj_music.musicInstanceCurrent, 0, 2000)
global.hubRoom = room
global.hubX = playerTouching.x
global.hubY = playerTouching.y