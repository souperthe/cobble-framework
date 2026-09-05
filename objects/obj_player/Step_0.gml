audio_emitter_position(emitter, x, y, 0);
if stateCurrent != undefined
{
    script_execute(stateCurrent.stateStep)
}

scr_player_destructibles()


if grounded && velocityY > 0
    coyoteTime = 8;

if velocityY < 0
    coyoteTime = 0

if coyoteTime > 0
    coyoteTime--

if bufferVertical > 0
    bufferVertical--

jumpAllow = (grounded && velocityY > 0) || (coyoteTime && velocityY > 0)

scr_player_ratblock()
scr_player_metalblock()
scr_player_spikecheck()
scr_player_technicaldifficulty()
scr_player_supercharge()

if chargeActive
    chargeFrame += 0.5
else
    chargeFrame = 0

if speedlinesActive
    speedlinesFrame += 0.5
else
    speedlinesFrame = 0

if superslamActive
    superslamFrame += 0.5
else
    superslamFrame = 0

if invincibleTimer > 0
{
    invincibleTimer--
    invincibleFlash = !invincibleFlash
}

if array_contains(machAfterImageStates, stateCurrentEnum)
{
    machAfterImageTime -= 1
    
    if machAfterImageTime < 0
    {
        scr_afterimage_mach()
        machAfterImageTime = 4.5
    }
}

if array_contains(blurAfterImageStates, stateCurrentEnum)
{
    blurAfterImageTime -= 1
    
    if blurAfterImageTime < 0
    {
        scr_afterimage_blur()
        blurAfterImageTime = 2
    }
}

audio_emitter_position(obj_music.musicEmitter, obj_camera.centerX, obj_camera.centerY, 0)