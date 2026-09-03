var playerKey = string(other.id)

if array_contains(playerStateBlacklist, other.stateCurrentEnum)
    exit;


if struct_exists(playerBuffers, playerKey)
    exit;


audio_stop_sound(sfx_dashpad)
super_sound_oneshot(x, y, sfx_dashpad)

other.scaleX = sign(image_xscale)
other.dir = other.scaleX
other.stateSwitch(PlayerStates.MACH3, "dashpad")


playerBuffers[$ playerKey] = playerBufferTime