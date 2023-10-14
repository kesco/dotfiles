if status is-interactive
    # Commands to run in interactive sessions can go here
end

# 设置XMake
if test -e $XMAKE_PROGRAM_DIR/scripts/profile-unix.fish
  source $XMAKE_PROGRAM_DIR/scripts/profile-unix.fish
end

# 设置Starship Promot
if test -e $HOME/.config/starship/starship.toml
  set -Ux STARSHIP_CONFIG $HOME/.config/starship/starship.toml
  starship init fish | source
end
