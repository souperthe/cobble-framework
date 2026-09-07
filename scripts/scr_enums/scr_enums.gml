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
        TRICKJUMP,
        NOCLIP,
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
        THROWN,
        CHASE,
        ATTACK,
        ESCAPESPAWN
    }
    
    enum BackgroundType {
        BACKGROUND,
        FOREGROUND,
        BACKROUNDZIGZAG,
        BACKROUNDSTILL,
        BACKGROUNDSCROLL,
        UNDEFINED,
        _length
    }
    
    enum AfterImageType {
        MACH,
        SUPERTAUNT,
        BLUR,
        COLOR,
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
    
    enum OptionType {
        TOGGLE,
        MULTIPLE,
        PRESS,
        SLIDE,
        NEWLINE,
        HEADER,
        _length
    }
    
    enum MenuType {
        OPTIONS,
        AUDIO,
        VIDEO,
        GAME,
        CONTROLS
    }
    
    enum MenuAnchor {
        CENTER,
        LEFT
    }

    return;
}