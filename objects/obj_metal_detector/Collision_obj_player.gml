if other.transformationCurrent == "chainsaw"
{
    var debris = scr_debris_create(x, y, other.transformationDebris)
    debris.velocityY = random_range(-5, -10)
    debris.velocityX = random_range(-5, 5)
    super_sound_oneshot_emitter(other.emitter, sfx_transform_exit, random_pitch())
    scr_effect_create("genericpoof", other.x, other.y)
    other.transformationDebris = undefined
    other.transformationCurrent = ""
    other.stateSwitch(PlayerStates.NORMAL)
}