if status is-interactive
    # Commands to run in interactive sessions can go here
end

# 设置Starship Promot
set -Ux STARSHIP_CONFIG $HOME/.config/starship/starship.toml
starship init fish | source
