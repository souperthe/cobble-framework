/// @self obj_baddie
function scr_baddie_state_stun()
{
    sprite_index = spriteStun
    x = stunX + random_range(-global.hitstunShake, global.hitstunShake)
    y = stunY + random_range(-global.hitstunShake, global.hitstunShake)
    return
}