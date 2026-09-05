
/// @param {String} targetStateName
function PlayerState(targetStateName) constructor 
{
    var statePrefix = "scr_player_state_" + targetStateName
    var stateEnterPath = statePrefix + "_enter"
    var stateStepPath = statePrefix + "_step"
    var stateExitPath = statePrefix + "_exit"
    
    stateEnter = asset_get_index(stateEnterPath);
    stateStep = asset_get_index(stateStepPath);
    stateExit = asset_get_index(stateExitPath);
    stateName = targetStateName
    
    if stateEnter == -1
        show_error(stateEnterPath + " is not a valid script!", true)
    
    if stateStep == -1
        show_error(stateStepPath + " is not a valid script!", true)
    
    if stateExit == -1
        show_error(stateExitPath + " is not a valid script!", true)
    
    return
}

/// @param {enum.PlayerStates} stateEnum
/// @param {string} stateName
/// @self obj_player
function scr_player_register_state(stateEnum, stateName)
{
    stateLibrary[stateEnum] = new PlayerState(stateName)
    
    array_push(global.playerStateNames, stateName)
    struct_set(global.playerStateNamesEnum, stateName, stateEnum)
    return
}

/// @self obj_player
function scr_player_get_state_library()
{
    /// @param {enum.PlayerStates} stateEnum
    /// @param {string} stateName
    var stateRegister = scr_player_register_state
    
    stateRegister(PlayerStates.UNINITIALIZED, "blank")
    stateRegister(PlayerStates.NORMAL, "normal")
    stateRegister(PlayerStates.JUMP, "jump")
    stateRegister(PlayerStates.CLIMB, "climb")
    stateRegister(PlayerStates.SUPLEXDASH, "suplexdash")
    stateRegister(PlayerStates.TAUNT, "taunt")
    stateRegister(PlayerStates.MACH2, "mach2")
    stateRegister(PlayerStates.MACH3, "mach3")
    stateRegister(PlayerStates.MACHROLL, "machroll")
    stateRegister(PlayerStates.MACHSLIDE, "machslide")
    stateRegister(PlayerStates.WALLCLIMB, "wallclimb")
    stateRegister(PlayerStates.UPPERCUT, "uppercut")
    stateRegister(PlayerStates.BUMP, "bump")
    stateRegister(PlayerStates.SJUMPPREP, "sjumpprep")
    stateRegister(PlayerStates.SJUMPLAND, "sjumpland")
    stateRegister(PlayerStates.SJUMP, "sjump")
    stateRegister(PlayerStates.FREEFALL, "freefall")
    stateRegister(PlayerStates.FREEFALLLAND, "freefallland")
    stateRegister(PlayerStates.HITSUN, "hitstun")
    stateRegister(PlayerStates.HAULING, "hauling")
    stateRegister(PlayerStates.FINISHINGBLOW, "finishingblow")
    stateRegister(PlayerStates.PILEDRIVER, "piledriver")
    stateRegister(PlayerStates.DOOR, "door")
    stateRegister(PlayerStates.ENTERLEVEL, "enterlevel")
    stateRegister(PlayerStates.CHAINSAWSTART, "chainsawstart")
    stateRegister(PlayerStates.CHAINSAWNORMAL, "chainsawnormal")
    stateRegister(PlayerStates.CHAINSAWPOGO, "chainsawpogo")
    stateRegister(PlayerStates.CHAINSAWATTACK, "chainsawattack")
    stateRegister(PlayerStates.CHAINSAWDASH, "chainsawdash")
    stateRegister(PlayerStates.CHAINSAWJUMP, "chainsawjump")
    stateRegister(PlayerStates.CHAINSAWBUMP, "chainsawbump")
    stateRegister(PlayerStates.CHAINSAWTURN, "chainsawturn")
    stateRegister(PlayerStates.HURT, "hurt")
    stateRegister(PlayerStates.TRICKJUMP, "trickjump")
    
    return;
}