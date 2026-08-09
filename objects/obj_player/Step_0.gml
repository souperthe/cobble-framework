audio_emitter_position(emitter, x, y, 0);
if stateCurrent != undefined
{
    script_execute(stateCurrent.stateStep)
}


if grounded && velocityY > 0
    coyoteTime = 8;

if velocityY < 0
    coyoteTime = 0

if coyoteTime > 0
    coyoteTime--

if bufferVertical > 0
    bufferVertical--

jumpAllow = (grounded && velocityY > 0) || (coyoteTime && velocityY > 0)

scr_collide()
scr_player_destructibles()

if chargeActive
    chargeFrame += 0.5
else
    chargeFrame = 0

if speedlinesActive
    speedlinesFrame += 0.5
else
    speedlinesFrame = 0