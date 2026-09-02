staticUse = true
staticIndex = sprite_get_number(staticSprite) - 1
staticDirection = -1
super_sound_oneshot_global(sfx_tvswitch_exit, random_pitch())

with (obj_player)
{
    stateSwitch(PlayerStates.NORMAL)
    moveAndCollide = true
    x = global.roomStartX
    y = global.roomStartY
}