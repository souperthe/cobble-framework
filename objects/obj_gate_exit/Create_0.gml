image_speed = 0
image_index = 1

entering = false

slam = function()
{
    super_sound_oneshot(x, y, sfx_groundpound)
    image_index = 0
    obj_camera.shake(10, 1)
    return
}