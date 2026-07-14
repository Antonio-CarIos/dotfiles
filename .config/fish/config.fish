# Environment
set -gx EDITOR nvim
set -gx LANG pt_BR.UTF-8

# PATH
fish_add_path $HOME/.local/bin

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

# ABREVIATIONS
if status is-interactive
    # Commands to run in interactive sessions can go here

    # GIT
    abbr -a g git
    abbr -a ga "git add"
    abbr -a gc "git commit"
    abbr -a gs "git status"
    abbr -a gl "git pull"
    abbr -a gp "git push"
    abbr -a gpo "git push origin"

    # Ruby on Rails
    abbr -a bi "bundle install"
    abbr -a r bin/rails
    abbr -a rs "bin/rails server"
    abbr -a rc "bin/rails console"
    abbr -a rg "bin/rails generate"
    abbr -a rgm "bin/rails generate model"
    abbr -a rgc "bin/rails generate controller"
    abbr -a rgs "bin/rails generate scaffold"
    abbr -a rd "bin/rails destroy"
    abbr -a rdc "bin/rails db:create"
    abbr -a rdm "bin/rails db:migrate"
    abbr -a rdd "bin/rails db:drop"
    abbr -a rdr "bin/rails db:rollback"

    # Python 
    abbr -a pipupgrade "python -m pip install --upgrade pip"

    abbr -a c clear

    abbr -a ps "sudo pacman -S"
    abbr -a psyu "sudo pacman -Syu"
    abbr -a pr "sudo pacman -Rns"
    abbr -a ys "yay -S"
    abbr -a ysyu "yay -Syu"
    abbr -a yr "yay -Rns"
end
