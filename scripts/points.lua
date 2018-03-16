-- Emit a few stats prefixed with "===" (for grepping)

local thread_count = 0

-- Emit a stat each time a thread comes online
setup =  function(thread)
   thread_count = thread_count + 1
   io.write("===CLIENT=== " .. os.time() .. " 1"  .. "\n")
end

-- Emit the HTTP status for each request.
response = function(status, headers, body)
   io.write("===STATUS=== " .. os.time() .. " " .. status .. "\n")
end

-- Emit a stat after all threads go offline
done = function()
   io.write("===CLIENT=== " .. os.time() .. " -" .. thread_count .. "\n")
end
