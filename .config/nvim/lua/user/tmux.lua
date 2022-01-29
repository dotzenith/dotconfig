function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

local status_ok = file_exists(os.getenv("HOME").."/.scripts/tmux_enter") and file_exists(os.getenv("HOME").."/.scripts/tmux_leave")

if not status_ok then
  return
end

vim.cmd [[
  augroup _tmux_settings
    autocmd!
    autocmd BufReadPost,BufEnter,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%:t"))
    autocmd VimEnter * :silent !tmux_enter
    autocmd VimLeave * :silent !tmux_leave
  augroup end
]]

