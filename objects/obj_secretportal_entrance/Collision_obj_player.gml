if !active
    exit

if scr_save_room_contains(id)
    exit

if touched
    exit

if sprite_index != spriteClose
{
    sprite_index = spriteClose
    image_index = 0
    super_sound_oneshot(x, y, sfx_secretenter)
}

obj_camera.lock = true

touchedPlayer = other.id
other.stateSwitch(PlayerStates.UNINITIALIZED)
other.sprite_index = other.spriteGet("hurt")
other.velocityX = 0
other.velocityY = 0
other.moveSpeed = 0

global.warpDoor = "SECRET"

if !secret
{
    global.warpSecretLastRoom = room
    global.warpSecretId = id
}
else
{
    targetRoom = global.warpSecretLastRoom
}

trace(global.warpSecretLastRoom)


global.warpRoom = targetRoom

touched = true