" Load settings
luafile %:p:h/set.lua

" need to learn vim scripts and not just bash or zsh

" Call the underline cursor function
lua require('set').set_underline_cursor()

" Load plugins
luafile %:p:h/plugins.lua

" Other settings...
let g:copilot_filetypes = { 'markdown': v:true }

