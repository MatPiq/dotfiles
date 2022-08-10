# if status is-interactive
#     # Commands to run in interactive sessions can go here
# end

#export PATH="$HOME/.cargo/bin:$PATH"
# set LD_LIBRARY_PATH "/opt/homebrew/bin/R"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/matiaspiqueras/opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

#
# #powerline fonts
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
set -g fish_key_bindings fish_vi_key_bindings
#set -Ux TERM xterm-256color
# #set kterm

#alias for ll
if type -q exa
 alias ll "exa -l -g --icons"
 alias lla "ll -a"
end

# #remove greeting
set fish_greeting

# rust path
set -gx PATH "$HOME/.cargo/bin" $PATH;

# #alias
command -qv nvim && alias vim nvim
alias cat="bat"
# #setup vpn
export VPN_HOST="vpn.ku.dk"
export VPN_USER="bvj349"

function vpn-up
 sudo openconnect --background --user=$VPN_USER $VPN_HOST
end

function vpn-down
 sudo killall openconnect
end

# #connect to sodas server
function sodas -a localhost
 if test (count -l $argv) -eq 0
  ssh bvj349@sodascomp01fl.unicph.domain
 else
  ssh -L 8855:localhost:8855 bvj349@sodascomp01fl.unicph.domain
 end
end
#
export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"

starship init fish | source
alias dotfiles='/usr/bin/git --git-dir=/Users/matiaspiqueras/.dotfiles/ --work-tree=/Users/matiaspiqueras'
