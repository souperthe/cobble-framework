/// @self obj_rigid_body
function scr_rigid_body_create()
{
    velocityX = 0;
    velocityY = 0;
    velocityXCarry = 0;
    velocityYCarry = 0;
    grounded = false;
    grav = 0.5
    gravMax = 20;
    moveAndCollide = true
    collide = true
    ignoreObjects = []
    return
}

/// @self obj_rigid_body
function scr_rigid_body_step()
{
    if moveAndCollide
        scr_collide()
    return
}

