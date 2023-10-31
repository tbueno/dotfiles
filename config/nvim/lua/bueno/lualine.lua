local custom_theme = require'lualine.themes.seoul256'

-- Customize theme by extending it like the example below:
-- custom_theme.normal.c.bg = '#112233'

require('lualine').setup {
  options = {
    theme = custom_theme,
    -- component_separators = '|',
    -- section_separators = { left = '', right = ''},
  },
 }
