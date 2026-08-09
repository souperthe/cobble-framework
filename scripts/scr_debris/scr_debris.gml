
/// @param {Asset.GMSprite} targetSpriteIndex
function Debris(targetSpriteIndex) constructor 
{
    spriteIndex = targetSpriteIndex
    spriteNumber = sprite_get_number(spriteIndex)
    spriteFrame = irandom(spriteNumber - 1)
    spriteWidth = sprite_get_width(spriteIndex)
    spriteHeight = sprite_get_height(spriteIndex)
    x = 0
    y = 0
    velocityX = 0
    velocityY = 0
    angle = random_range(1, 270)
    grav = 0.4
    animate = false
    animateSpeed = 0.35
    return
}

/// @param {Real} targetX
/// @param {Real} targetY
/// @param {Asset.GMSprite} targetSprite
/// @return {Struct.Debris}
function scr_debris_create(targetX, targetY, targetSprite)
{
    var debrisManager = obj_debris_manager
    var debrisNew = new Debris(targetSprite)
    debrisNew.x = targetX
    debrisNew.y = targetY
    
    array_push(debrisManager.debrisActive, debrisNew)
    
    return debrisNew
}

/// @param {Real} targetAmount
/// @param {Real} targetX
/// @param {Real} targetY
/// @param {Asset.GMSprite} targetSprite
/// @param {Real} targetVelocityRangeX
/// @param {Real} targetVelocityRangeY
function scr_debris_explosion(targetAmount, targetX, targetY, targetSprite, targetVelocityRangeX, targetVelocityRangeY)
{
    var debris = []
    
    repeat (targetAmount)
    {
        var debrisNew = scr_debris_create(targetX, targetY, targetSprite)
        var velocityX = random_range(-targetVelocityRangeX, targetVelocityRangeX)
        var velocityY = random_range(-targetVelocityRangeY, targetVelocityRangeY)
        
        debrisNew.velocityX = velocityX
        debrisNew.velocityY = velocityY
        
        array_push(debris, debrisNew)
        continue
    }
    
    return debris
}