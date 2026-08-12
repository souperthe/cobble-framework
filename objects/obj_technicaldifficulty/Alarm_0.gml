staticUse = true
staticIndex = sprite_get_number(staticSprite) - 1
staticDirection = -1
audio_play_sound(sfx_tvswitch_exit, 0, false, 1, 0, random_pitch())

with (obj_player)
{
    stateSwitch(PlayerStates.NORMAL)
    x = global.roomStartX
    y = global.roomStartY
}