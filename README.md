# arch-dotfiles

## Softwares

```
desktop      - Hyprland     - paru -S hyprland hyprpaper swayidle swaylock-effects
notification - mako         - paru -S mako
bar          - waybar       - paru -S waybar-hyprland-git
locker       - swaylock     - paru -S swaylock-effects
editor       - Neovim       - paru -S neovim go npm unzip
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
hot reload   - inotify      - paru -S inotify-tools
color        - hyprpicker   - paru -S hyprpicker
screenshot   - grimblast    - paru -S grimblast
log manager  - wlogout      - paru -S wlogout
control      - light        - paru -S light && sudo chmod +s /bin/light
             - pamixer      - paru -S pamixer
ime          - fcitx5       - paru -S fcitx5
             - fcitx5 (zh)  - paru -S fcitx5-chinese-addons
file manager - ranger       - paru -S ranger python-pillow
               // pillow for image preview in kitty
```

## Others

```
cursor       - apple_cursor - paru -S apple_cursor
gtk          - Catppuccin   - paru -S catppuccin-gtk-theme-mocha
qt           - lightly      - paru -S qt5ct lightly-qt
               // lightly sometimes can not work... but looks nice
dark mode    - gtk4         - gsettings set org.gnome.desktop.interface color-scheme prefer-dark
```
