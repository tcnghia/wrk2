-- Emit time, latency (seconds) data points prefixed with "===" (for grepping)

local start
local stop

math.randomseed(os.time())

-- Keep track of when clients come online so total concurrent clients can be calculated.
setup =  function(thread)
   thread:set("id", "client-" .. math.floor(math.random() * 1000000))
   io.write("===CLIENT_ONLINE=== " .. os.time() .. " " .. thread:get("id") .. " "  .. "\n")
end

request = function()
   start = os.clock()
   return wrk.format()
end

-- Emit each request as a time, latency data point.
response = function(status, headers, body)
   stop = os.clock()
   io.write("===DATA_POINT=== " .. os.time() .. " " .. stop*1000-start*1000 .. " " .. status .. "\n")
end
