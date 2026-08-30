
/// @param {Real} targetFrame
/// @param {Asset.GMSprite} targetSprite
/// @param {Real} targetOffsetX
/// @param {Real} targetOffsetY
function OptionIcon(targetFrame, targetSprite = spr_pause_icons, targetOffsetX = 0, targetOffsetY = 0) constructor 
{
    spriteIndex = targetSprite
    spriteFrame = targetFrame
    
    alpha = 0
    
    offsetX = targetOffsetX
    offsetY = targetOffsetY
    
    shakeX = 0
    shakeY = 0

    return
}