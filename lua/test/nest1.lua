local shaco = require "shaco"

shaco.start(function()
    shaco.trace("publish...")
    shaco.publish("nest1")
    shaco.trace("uniquemodule...")
    local vhandle = shaco.uniquemodule("nest", true, 
        function(type, handle)
            print ("monitor:", type, handle)
        end)
    shaco.trace("uniquemodule return:", vhandle)

    shaco.dispatch("um", function(session,source, v)
        if v=="ping" then
            shaco.send(vhandle, shaco.pack("pong"))
        end
    end)
end)
