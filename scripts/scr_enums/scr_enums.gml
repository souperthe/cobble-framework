function scr_enums()
{
    
    enum PlayerStates {
        UNINITIALIZED,
        NORMAL,
        JUMP,
        CLIMB,
        SUPLEXDASH,
        MACHROLL,
        MACHSLIDE,
        MACH2,
        MACH3,
        SLIPBANAN,
        SJUMP,
        SJUMPPREP,
        SJUMPLAND,
        TAUNT,
        WALLCLIMB,
        UPPERCUT,
        BUMP,
        FREEFALL,
        FREEFALLLAND,
        HITSUN,
        _length
    }
    
    enum BaddieStates {
        IDLE,
        TURN,
        WALK,
        LAND,
        HIT,
        STUN,
        THROWOBJECT,
        GRABBED,
        PUMMEL,
        STAGGERED,
        RAGE
    }
    
    enum TvStates {
        off,
        enter,
        normal,
        transition
    }
    
    enum CameraStates {
        normal
    }

    return;
}