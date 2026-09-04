scr_rigid_body_step()
scr_baddie_step()


if stateCurrent != BaddieStates.WALK
    exit;


var forkX = x + (21 * scaleX)
var forkY = y + 28
var forkPlayer = collision_circle(x, y, 40, obj_player, false, true)

if !forkPlayer
    exit;

with forkPlayer
    scr_player_hurt(other.id)