function Signal() constructor 
{
    
    listeners = []
    
    /// @param {Function} targetCallable
    static connect = function(targetCallable, once = false, context = other)
    {
        var bindedMethod = method(context, targetCallable)
        var listener = new Listener(bindedMethod)
        listener.once = once
        listener.parent = self
        listener.context = context
        
        array_push(listeners, listener)
        
        return listener
    }
    
    static fire = function()
    {
        var arguments = array_create(argument_count)
        
        for (var index = 0; index < argument_count; index++) {
            
            arguments[index] = argument[index]
            
            continue
        }
        
        for (var index = array_length(listeners) - 1; index >= 0; index--)
        {
            var listener = listeners[index]
            
            if !instance_exists(listener.context)
            {
                listener.disconnect()
                continue
            }
            
            method_call(listener.callable, arguments)
            
            if listener.once
                listener.disconnect()
            
            continue
        }
        
        return
    }
    
    return
}

/// @param {Function} targetCallable
function Listener(targetCallable) constructor 
{
    once = false
    parent = undefined
    context = undefined
    callable = targetCallable
    
    static disconnect = function()
    {
        
        if parent == undefined
        {
            return
        }
        
        var listenerIndex = array_get_index(parent.listeners, self)
        var listener = self
        
        array_delete(parent.listeners, listenerIndex, 1)
        delete listener
        return
    }
    
    return
}

