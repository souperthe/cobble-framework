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
        HAULING,
        FINISHINGBLOW,
        PILEDRIVER,
        DOOR,
        ENTERLEVEL,
        CHAINSAWSTART,
        CHAINSAWNORMAL,
        CHAINSAWPOGO,
        CHAINSAWATTACK,
        CHAINSAWDASH,
        CHAINSAWJUMP,
        CHAINSAWBUMP,
        CHAINSAWTURN,
        HURT,
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
        RAGE,
        SCREAM,
        THROWN
    }
    
    enum AfterImageType {
        MACH,
        BLUR,
        _length
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
    
    enum ComboStates {
        DROPIN,
        SETTLE,
        HOLD
    }

    return;
}