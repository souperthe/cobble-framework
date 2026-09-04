scr_rigid_body_create()
scr_baddie_create()



stateCurrent = BaddieStates.CHASE
stateNormal = stateCurrent

spriteIdle = spr_minijohn_stun
spriteWalk = spr_minijohn_charge
spriteDead = spr_minijohn_dead
spriteGrabbed = spr_minijohn_stun
spriteStun = spr_minijohn_stun

moveSpeed = 5
punchSpeed = 8
punchCooldown = 0
punchAfterimage = 0



image_speed = 0.3

scr_baddie_define_states()

stateLibrary[BaddieStates.CHASE] = function() 
{
    scr_baddie_state_chase()
    
    punchCooldown--
    
    if punchCooldown > 0
        exit;
    
    var playerTarget = instance_nearest(x, y, obj_player)
    var playerDirection = -sign(x - playerTarget.x)
    var playerDistanceX = abs(playerTarget.x - x)
    var playerDistanceY = abs(playerTarget.y - y)
    
    if (playerDistanceX > 400 || playerDistanceY > 60)
        exit;
    
    image_index = 0
    sprite_index = spr_minijohn_punchstart
    stateCurrent = BaddieStates.ATTACK
    scaleX = playerDirection
    return
}
stateLibrary[BaddieStates.ATTACK] = function() 
{
    
    if sprite_index == spr_minijohn_punchstart
    {
        image_speed = 0.35
        velocityX = approach(velocityX, 0, 1)
        
        if !is_sprite_finished()
            return;
        
        punchSpeed = 8
        
        velocityX = punchSpeed * scaleX
        sprite_index = spr_minijohn_punch
        image_index = 0
        image_speed = 0.25
        super_sound_oneshot_emitter(emitter, sfx_swing)
        return
    }
    
    punchSpeed = approach(punchSpeed, 0, 0.25)
    velocityX = punchSpeed * scaleX
    
    scr_baddie_hurtbox(30, 28, 40)
    
    var touchingDestructible = instance_place(x + velocityX, y, obj_destructible)
    
    if touchingDestructible
        instance_destroy(touchingDestructible)
    
    punchAfterimage--
    
    if punchAfterimage < 0
    {
        var afterimage = scr_afterimage_blur()
        afterimage.shader = undefined
        punchAfterimage = 5
    }
    
    if is_sprite_finished()
    {
        punchCooldown = 60
        stateCurrent = BaddieStates.CHASE
    }
    return
} 