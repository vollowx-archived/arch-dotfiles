# arch-dotfiles

```
cursor       - Catppuccin   - paru -S catppuccin-cursors-mocha
gtk          - Catppuccin   - paru -S catppuccin-gtk-theme-mocha
qt           - lightly      - paru -S lightly-qt
               // this sometimes can not work... but looks nice
desktop      - Hyprland     - paru -S hyprland hyprpaper-git hyprpicker-git waybar-hyprland-git mako swayidle wlogout grimblast
             - sway         - paru -S sway swaybg swayidle mako waybar-hyprland-git hyprpicker-git
               // I am not using sway, the config for it may be broken, try Hyprland!
notification - mako         - paru -S mako
bar          - waybar       - paru -S waybar-hyprland-git
editor       - Neovim       - paru -S neovim
               // you probably also need to install something like wget, npm, etc, see the error log and install them if you need
             - VSCode       - paru -S visual-studio-code-bin
               // if you want to use the Microsoft-branded release that support settings sync (important for me)
             - Code - OSS   - paru -S code
               // if you want to use the official open-source build of VSCode for Arch
music        - MPD          - paru -S mpd mpc ncmpcpp cava mpdscribble && systemctl enable --user mpdscribble.service mpd.service
               // if you're using mpdscribble to connect to last.fm or other similar service, don't upload the config (password in config file)
             - yesplaymusic - paru -S yesplaymusic
               // a 3rd party netease music which can connect to last.fm inside and looks beautiful
shell        - Fish         - paru -S fish && chsh -s /bin/fish
               // a easy and powerful shell
control      - light        - paru -S light && sudo chmod +s /bin/light
             - pamixer      - paru -S pamixer
```
