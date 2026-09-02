event_inherited();
depth = -10;
stateLibrary = []
stateCurrentEnum = PlayerStates.UNINITIALIZED
stateCurrent = undefined

scr_player_get_state_library()

signalStateChanged = new Signal()
signalPlacedAtDoor = new Signal()


moveSpeed = 0;
scaleX = 1;
scaleY = 1;
angle = 0;
dir = 1;
momemtum = false;
emitter = super_sound_create_emitter();
stepTime = 0;
jumpStop = false;
jumpAllow = true;
velocitySuperJump = 0;

gravMax = 20

tauntState = PlayerStates.UNINITIALIZED
tauntVelocityX = 0;
tauntVelocityY = 0;
tauntMoveSpeed = 0;
tauntSprite = 0;
tauntImageSpeed = 0;
tauntImageIndex = 0;
tauntTimer = 0;
machCrazy = false;
mach4Capped = true;

coyoteTime = 0;

soundMach = 0;
soundMachIndex = sfx_mach3

wallSpeed = 0;
bufferVertical = 0;
uppercutAllow = true;
freeFallProgress = 0

hitstunX = 0
hitstunY = 0
hitstunTime = 0
hitstunBaddie = -1

grabbedBaddie = -1

paletteSprite = spr_peppalette
paletteIndex = 1

chargeActive = false
chargeFrame = 0

speedlinesActive = false
speedlinesFrame = 0

superslamActive = false
superslamFrame = 0

machAfterImageTime = 6
machAfterImageStates = [PlayerStates.MACH2, PlayerStates.MACH3, PlayerStates.SJUMP, PlayerStates.UPPERCUT]

blurAfterImageTime = 6
blurAfterImageStates = [
    PlayerStates.SUPLEXDASH, 
    PlayerStates.MACHROLL, 
    PlayerStates.CHAINSAWDASH,
    PlayerStates.CHAINSAWATTACK,
    PlayerStates.CHAINSAWPOGO,
    PlayerStates.FREEFALL,
    PlayerStates.TRICKJUMP
]

transformationDebris = undefined
transformationCurrent = ""

invincibleTimer = 0
invincibleFlash = false


scaleVisual = 1

followers = []

        
idleAnimations = [
    "idledance",
    "idlefrown",
    "handgesture1",
    "handgesture2", 
    "handgesture3", 
    "handgesture4"
]
idleAnimationsPity = variable_clone(idleAnimations)
idleAnimationCurrent = undefined
idleTimer = 0

voiceOk = [sfx_pep_ok1, sfx_pep_ok2, sfx_pep_ok3]
voiceHurt = [sfx_pep_hurt1, sfx_pep_hurt2]
voiceIdle = [sfx_pep_ok1, sfx_pep_ok2, sfx_pep_ok3]
voiceTransfoOut = [sfx_pep_outtransfo1, sfx_pep_outtransfo1, sfx_pep_outtransfo3]
voiceTransfoIn = [sfx_pep_transfo1, sfx_pep_transfo1, sfx_pep_transfo1]

/// @param {enum.PlayerStates} targetState
/// @param {string} enterMessage
stateSwitch = function(targetState, enterMessage = "")
{
    var stateOld = stateCurrent
    var stateNew = stateLibrary[targetState]
    
    if (is_undefined(stateNew))
    {
        return
    }
    
    if stateOld != undefined
        script_execute(stateOld.stateExit)
    
    
    script_execute(stateNew.stateEnter, enterMessage)
    stateCurrent = stateNew
    stateCurrentEnum = targetState
    
    signalStateChanged.fire(stateCurrent)
    
    return
}


spriteCharacter = ""
spriteGet = function(targetSpriteName)
{
    var spritePrefix = "spr_player" + spriteCharacter + "_"
    var spritePath = spritePrefix + targetSpriteName
    var spriteIndex = asset_get_index(spritePath)
    
    if spriteIndex == -1
        return spr_baddie
    
    return spriteIndex
}


stateSwitch(PlayerStates.NORMAL)