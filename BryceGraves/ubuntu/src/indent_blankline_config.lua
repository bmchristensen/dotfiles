-- https://github.com/navarasu/onedark.nvim

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#30465d guibg=#14262b gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#30465d guibg=#09262e gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#30465d guibg=#161e37 gui=nocombine]]

require("indent_blankline").setup {
--      Not sure if I like the space only indent or the left centered line... I kinda like the left line since it accurately shows the character that exist
        char = "▎",
--        char = "",
        context_char = "│",
        char_highlight_list = {
                "IndentBlanklineIndent1",
                "IndentBlanklineIndent2",
                "IndentBlanklineIndent3",
        },
        space_char_highlight_list = {
                "IndentBlanklineIndent1",
                "IndentBlanklineIndent2",
                "IndentBlanklineIndent3",
        },
        show_trailing_blankline_indent = false,
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
}
