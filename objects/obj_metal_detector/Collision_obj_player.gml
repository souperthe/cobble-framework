if other.transformationCurrent = "chainsaw"
{
    other.signalTransformationExit.fire()
    other.stateSwitch(PlayerStates.NORMAL)
}
