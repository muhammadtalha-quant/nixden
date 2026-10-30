set -U fish_greeting

status is-login; and begin
 # login shell init
end

status is-interactive; and begin
 # interactive shell init 
    starship init fish | source 

    abbr --add -- 000 'chmod 000'
    abbr --add -- 000r 'chmod -R 000'
    abbr --add -- 644 'chmod 644'
    abbr --add -- 644r 'chmod -R 644'
    abbr --add -- 666 'chmod 666'
    abbr --add -- 666r 'chmod -R 666'
    abbr --add -- 755 'chmod 755'
    abbr --add -- 755r 'chmod -R 755'
    abbr --add -- 777 'chmod 777'
    abbr --add -- 777r 'chmod -R 777'
    abbr --add -- cls clear
    abbr --add -- codels 'eza --code'
    abbr --add -- cp 'cp -rv'
    abbr --add -- la 'eza -ah --icons'
    abbr --add -- ladir 'eza -gaoh --icons --only-dirs --show-symlinks --git'
    abbr --add -- laf 'eza -gaoh --icons --only-files --show-symlinks --git'
    abbr --add -- ldir 'eza -goh --icons --only-dirs --show-symlinks --git'
    abbr --add -- less 'less -R'
    abbr --add -- lf 'eza -goh --icons --only-files --show-symlinks --git'
    abbr --add -- ll 'eza -lgoh --icons --git'
    abbr --add -- lla 'eza -lgaoh --icons --git'
    abbr --add -- lladir 'eza -lgaoh --icons --only-dirs --show-symlinks --git'
    abbr --add -- llaf 'eza -lgaoh --icons --only-files --show-symlinks --git'
    abbr --add -- lldir 'eza -lgoh --icons --only-dirs --show-symlinks --git'
    abbr --add -- llf 'eza -lgoh --icons --only-files --show-symlinks --git'
    abbr --add -- ls 'eza --icons'
    abbr --add -- lt 'eza --tree --git'
    abbr --add -- mkdir 'mkdir -p'
    abbr --add -- mv 'mv -v'
    abbr --add -- rm 'rm -frv'
    abbr --add -- snano 'sudo nano'
    abbr --add -- sucp 'sudo cp -rv'
    abbr --add -- sumkdir 'sudo mkdir -p'
    abbr --add -- sumv 'sudo mv -v'
    abbr --add -- surm 'sudo rm -frv'

    alias .. 'cd ..'
    alias ... 'cd ../..'
    alias .... 'cd ../../..'
    alias cat bat
    alias home 'cd ~'
    alias matrix 'cmatrix -rsbu5'
    alias pipes 'pipes.sh -p4 -r4000 -R'
    alias v nvim
    alias vi nvim
    alias vim nvim
end
