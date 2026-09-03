targetDoor = ""
used = false

statesDown = [
    PlayerStates.NORMAL,
    PlayerStates.FREEFALL, 
    PlayerStates.FREEFALLLAND, 
    PlayerStates.MACHROLL
]
statesDownForce = [PlayerStates.FREEFALL, PlayerStates.FREEFALLLAND]

statesUp = [
    PlayerStates.NORMAL, 
    PlayerStates.JUMP, 
    PlayerStates.SJUMP, 
    PlayerStates.SJUMPLAND,
    PlayerStates.UPPERCUT,
    PlayerStates.MACH2, 
    PlayerStates.MACH3
]
statesUpForce = [PlayerStates.SJUMP, PlayerStates.SJUMPLAND]