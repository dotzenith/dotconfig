local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"

    indicator_icon = "▎",
    buffer_close_icon = "",
    -- buffer_close_icon = '',
    modified_icon = "●",
    close_icon = " ",
    -- close_icon = '',
    left_trunc_marker = "",
    right_trunc_marker = "",

    max_name_length = 30,
    max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
    tab_size = 21,
    diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
    diagnostics_update_in_insert = false,

    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = {'', ''}, -- | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    -- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
    --   -- add custom logic
    --   return buffer_a.modified > buffer_b.modified
    -- end
  },
  highlights = {
    fill = {
      guifg = "NONE",
      guibg = "NONE",
    },
    background = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = "NONE",
    },

    buffer_visible = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = "NONE",
    },

    close_button = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = "NONE",
    },
    close_button_visible = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = "NONE",
    },

    tab_selected = {
      guifg = { attribute = "fg", highlight = "Normal" },
      guibg = "NONE",
    },
    tab = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = "NONE",
    },
    tab_close = {
      guifg = { attribute = "fg", highlight = "TabLineSel" },
      guibg = "NONE",
    },

    duplicate_selected = {
      guifg = { attribute = "fg", highlight = "TabLineSel" },
      guibg = "NONE",
      gui = "italic",
    },
    duplicate_visible = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = "NONE",
      gui = "italic",
    },
    duplicate = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = "NONE",
      gui = "italic",
    },

    modified = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = "NONE",
    },
    modified_selected = {
      guifg = { attribute = "fg", highlight = "Normal" },
      guibg = "NONE",
    },
    modified_visible = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = "NONE",
    },

    separator = {
      guifg = { attribute = "bg", highlight = "Normal" },
      guibg = "NONE",
    },
    separator_selected = {
      guifg = { attribute = "bg", highlight = "Normal" },
      guibg = "NONE",
    },
    indicator_selected = {
      guifg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
      guibg = "NONE",
    },
  },
}

