local DEBUG = true

local jack = {}

jack.get_connections = function()
   local LIST_CONNECTIONS = "jack_lsp -c"
   local output = os.capture(LIST_CONNECTIONS, true)
   print("got jack connections")
   local connections = jack.parse_connection_list(output)
   return connections
end

jack.parse_connection_list = function(s)
   local work_t = tab.lines(s)
   local t = {}
   local previce = nil
   for i, v in ipairs(work_t) do
      if v == "" then
      elseif util.string_starts(v, " ") then
	 table.insert(t[previce], v:match("%S+"))
      else
	 t[v:match("%S+")] = {}
	 previce = v
      end
   end
   return t
end

jack.to_mono = function(input)
   log(">> to mono >")
   local connections = jack.get_connections()
   local input_l = input.."_1"
   local input_r = input.."_2"
   local JACK_DISCONNECT_CMD = "jack_disconnect "..input_r.." ".."crone:input_2"
   log(JACK_DISCONNECT_CMD)
   os.capture(JACK_DISCONNECT_CMD)
   local JACK_CONNECT_CMD = "jack_connect "..input_l.." ".."crone:input_2"
   log(JACK_CONNECT_CMD)
   os.capture(JACK_CONNECT_CMD)
   
   -- for i, v in pairs(connections[input_r]) do
   --    local JACK_DISCONNECT_CMD = "jack_disconnect "..input_r.." "..v
   --    log(JACK_DISCONNECT_CMD)
   --    local JACK_CONNECT_CMD = "jack_connect "..input_l.." ".."crone:input_2"
   --    log(JACK_CONNECT_CMD)
   --  end
end

jack.to_stereo = function(input)
   log("> to stereo >>")
   local connections = jack.get_connections()
   local input_l = input.."_1"
   local input_r = input.."_2"
   local JACK_DISCONNECT_CMD = "jack_disconnect "..input_l.." ".."crone:input_2"
   log(JACK_DISCONNECT_CMD)
   os.capture(JACK_DISCONNECT_CMD)
   local JACK_CONNECT_CMD = "jack_connect "..input_r.." ".."crone:input_2"
   log(JACK_CONNECT_CMD)
   os.capture(JACK_CONNECT_CMD)
   
   -- for i, v in pairs(connections[input_r]) do
   --    local JACK_DISCONNECT_CMD = "jack_disconnect "..input_r.." ".."crone:input_1"
   --    log(JACK_DISCONNECT_CMD)
   --    local JACK_CONNECT_CMD = "jack_connect "..input_r.." ".."crone:input_2"
   --    log(JACK_CONNECT_CMD)
   -- end
end

local log = function(s)
   if DEBUG then print(s) end
end

return jack
