var stateFunction = states[stateCurrent]

if !is_undefined(stateFunction)
    stateFunction()