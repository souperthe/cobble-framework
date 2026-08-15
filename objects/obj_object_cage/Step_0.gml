
helpIndex += 0.35

if helpIndex > sprite_get_number(helpSprite) - 1
{
    helpIndex = frac(helpIndex)
    helpSound = super_sound_oneshot(x, y, sfx_toppinhelp)
}