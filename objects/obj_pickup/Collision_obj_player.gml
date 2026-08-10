if !array_contains(grabStates, other.stateCurrentEnum)
    exit

if !grabAllow
    exit

grabFunction(other)
instance_destroy()