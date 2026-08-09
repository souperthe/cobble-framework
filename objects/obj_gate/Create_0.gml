backroundSprite = spr_gate_entranceBG; 

backroundSpriteNumber = 0;
backroundWidth = 0;
backroundHeight = 0;

backroundSpritePosition = [];
backroundSpritePositionStart = [];

backroundAlpha = 1;

backroundSurfaceMask = noone;
backroundSurfaceClip = noone;

backroundParallaxEnabled = false;
backroundParallax = [0.65, 0.75, 0.08];
backroundParallax2 = [0.1, 0.15, 0.2];

playerTouching = obj_player
playerStateWhitelist = [PlayerStates.NORMAL]

onEnter = function()
{
    return
}

playerCanEnter = function(player)
{
    
    if !array_contains(playerStateWhitelist, player.stateCurrentEnum)
        return false
    
    return true
}