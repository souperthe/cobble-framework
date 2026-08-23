moveSpeed = 8
targetPlayer = obj_player
emitter = super_sound_create_emitter()
freeze = false

image_speed = 0.35
depth = -5
image_alpha = 0
x = targetPlayer.x
y = targetPlayer.y


super_sound_loop_emitter(emitter, sfx_pizzaface_moving)
super_sound_oneshot_emitter(emitter, sfx_pizzaface_laugh)


gotoPlayer = function()
{
    image_alpha = 0
    x = targetPlayer.x
    y = targetPlayer.y
    return
}

targetPlayer.signalPlacedAtDoor.connect(gotoPlayer)