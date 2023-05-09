_zsh_pyenv_load() {
    eval "$(pyenv init --path)"
    eval "$(pyenv init - --no-rehash zsh)"
    eval "$(pyenv virtualenv-init - zsh)"
}

# load pyenv if it is installed
if command -v pyenv &>/dev/null; then
    _zsh_pyenv_load
fi