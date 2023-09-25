-- open as vsplit on current node
local function vsplit_preview()
  local api = require "nvim-tree.api"
  local node = api.tree.get_node_under_cursor()

  if node.nodes ~= nil then
    -- expand or collapse folder
    api.node.open.edit()
  else
    -- open file as vsplit
    api.node.open.vertical()
  end

  -- Finally refocus on tree if it was lost
  api.tree.focus()
end

local function nvim_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,  opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,            opts('Help'))
  vim.keymap.set("n", "h",     api.tree.close,                  opts("Close"))
  vim.keymap.set("n", "v",     vsplit_preview,                  opts("Close"))
end


require("nvim-tree").setup({
  sort_by = "case_sensitive",
  on_attach = nvim_attach,
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
