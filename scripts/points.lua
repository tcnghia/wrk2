-- Emit time, latency (seconds) data points prefixed with "===" (for grepping)

local start
local stop

request = function()
   start = os.clock()
   return wrk.format()
end

response = function(status, headers, body)
   stop = os.clock()
   io.write("===" .. os.time() .. "," .. stop*1000-start*1000 .. "\n")
end
