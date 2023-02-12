# arch-dotfiles

```
cursor  - Catppuccin - paru -S catppuccin-cursors-mocha
gtk     - Catppuccin - paru -S catppuccin-gtk-theme-mocha
qt      - lightly    - paru -S lightly-qt
desktop - Hyprland   - sudo pacman -S mako swayidle && paru -S hyprland hyprpaper-git hyprpicker-git waybar-hyprland-git
editor  - Neovim     - sudo pacman -S neovim unzip wget
music   - MPD        - sudo pacman -S mpd mpc ncmpcpp cava && paru -S mpdscribble && systemctl enable --user mpdscribble.service mpd.service
// if you're using mpdscribble to connect to last.fm or other similar service, don't upload the config (password in config file)
shell   - Fish       - sudo pacman -S fish && chsh -s /bin/fish
```
