-- Emit a few stats prefixed with "===" (for grepping)

math.randomseed(os.time())

-- Emit a stat with unique client ID each time a thread comes online.
setup =  function(thread)
   io.write("===CLIENT=== " .. os.time() .. " " .. math.floor(math.random() * 1000000) .. " "  .. "\n")
end

-- Emit the HTTP status for each request.
response = function(status, headers, body)
   io.write("===STATUS=== " .. os.time() .. " " .. status .. "\n")
end
