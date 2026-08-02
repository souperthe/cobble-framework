var stateFunction = stateLibrary[stateCurrent]

if !is_undefined(stateFunction)
    stateFunction()
