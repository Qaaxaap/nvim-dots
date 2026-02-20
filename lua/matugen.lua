 local M = {}

 function M.setup()
   require('base16-colorscheme').setup {
     -- Background tones
     base00 = '#181212', -- Default Background
     base01 = '#251e1e', -- Lighter Background (status bars)
     base02 = '#2f2828', -- Selection Background
     base03 = '#a08c8b', -- Comments, Invisibles
     -- Foreground tones
     base04 = '#d7c1c0', -- Dark Foreground (status bars)
     base05 = '#ede0de', -- Default Foreground
     base06 = '#ede0de', -- Light Foreground
     base07 = '#ede0de', -- Lightest Foreground
     -- Accent colors
     base08 = '#ffb4ab', -- Variables, XML Tags, Errors
     base09 = '#e3c28c', -- Integers, Constants
     base0A = '#e7bdba', -- Classes, Search Background
     base0B = '#ffb3b0', -- Strings, Diff Inserted
     base0C = '#e3c28c', -- Regex, Escape Chars
     base0D = '#ffb3b0', -- Functions, Methods
     base0E = '#e7bdba', -- Keywords, Storage
     base0F = '#93000a', -- Deprecated, Embedded Tags
   }
 end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
