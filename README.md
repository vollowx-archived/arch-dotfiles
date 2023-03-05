# arch-dotfiles

## Softwares

```
desktop      - Hyprland     - paru -S hyprland hyprpaper swayidle swaylock
notification - mako         - paru -S mako
bar          - waybar       - paru -S waybar-hyprland-git
locker       - swaylock     - paru -S swaylock
editor       - Neovim       - paru -S neovim go npm unzip ripgrep fd
               // you probably also need to install something like wget, npm, etc, see the error log and install them if you need
             - VSCode       - paru -S visual-studio-code-bin
music        - MPD          - paru -S mpd mpc ncmpcpp cava mpdscribble && systemctl enable --user mpdscribble.service mpd.service
               // if you're using mpdscribble to connect to last.fm or other similar service, don't upload the config (password in config file)
             - yesplaymusic - paru -S yesplaymusic
               // a 3rd party netease music which can connect to last.fm inside and looks beautiful
shell        - zsh          - paru -S zsh && chsh -s /bin/zsh
hot reload   - inotify      - paru -S inotify-tools
color        - hyprpicker   - paru -S hyprpicker
screenshot   - grimblast    - paru -S grimblast
launcher     - rofi         - paru -S rofi-lbonn-wayland-git rofi-calc rofi-emoji
  & log manager & some applet
control      - light        - paru -S light && sudo chmod +s /bin/light
             - pamixer      - paru -S pamixer
ime          - fcitx5       - paru -S fcitx5 fcitx5-gtk
             - fcitx5 (zh)  - paru -S fcitx5-chinese-addons
file manager - ranger       - paru -S ranger python-pillow
               // pillow for image preview in kitty
```

## Others

```
cursor       - apple_cursor - paru -S apple_cursor
gtk          - Catppuccin   - paru -S catppuccin-gtk-theme-mocha
icons        - WhiteSur     - paru -S whitesur-icon-theme
qt           - lightly      - paru -S qt5ct qt5-wayland qt6-wayland lightly-qt
               // lightly sometimes can not work... but looks nice
dark mode    - gtk4         - gsettings set org.gnome.desktop.interface color-scheme prefer-dark
```
