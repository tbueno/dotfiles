if vim.g.vscode then
    print("VSCode")
    vim.cmd[[source $HOME/.config/nvim/vscode/settings.vim]]
end
