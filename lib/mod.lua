local DEBUG = true
local mod = require 'core/mods'

local jack = require 'mono-input/lib/jack'

local WIDTH  = 128
local HEIGHT = 64

local state = {
   jack_connections = nil,
   mono = false
}

-- Define menu

local m = {}

m.init = function()
   log("mod init")
end

m.key = function(n, z)
   if n == 2 and z == 1 then
      mod.menu.exit()
   end
end

m.enc = function(n, d)
   if n == 3 then
      if d > 0 and not state.mono then
	 log(n.." CW")
	 jack.to_mono("system:capture")
	 state.mono = true
      elseif d < 0 and state.mono then
	 log(n.." CCW")
	 jack.to_stereo("system:capture")
	 state.mono = false
      end
      mod.menu.redraw()
   end
end

m.redraw = function()
   screen.clear()
   screen.font_face(22)
   screen.font_size(22)
   --    screen.move(11, 33)
   -- if state.jack_connections ~= nil then
   --    screen.text(tab.count(state.jack_connections))
   -- else
   --    screen.text("nil")
   -- end

   if state.mono then
      screen.move(WIDTH/2, HEIGHT/2+3)
      screen.level(6)
      screen.text_center("mono")
   else
      screen.move(WIDTH/2-5, HEIGHT/2)
      screen.level(2)
      screen.text_center("stereo")
      screen.move(WIDTH/2+5, HEIGHT/2+6)
      screen.level(4)
      screen.text_center("stereo")
   end
   screen.update()
end

m.init = function()
   state.jack_connections = jack.get_connections()
end

m.deinit = function ()
   log("mod deinit")
   screen.font_face(1)
   screen.font_size(8)
end

mod.menu.register(mod.this_name, m)

-- End of menu

-- Utilities

function log(s)
   if DEBUG then print(s) end
end
