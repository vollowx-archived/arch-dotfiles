# arch-dotfiles

## Softwares

```
desktop      - Hyprland     - paru -S hyprland
wallpaper    - hyprpaper    - paru -S hyprpaper
notification - mako         - paru -S mako
bar          - waybar       - paru -S waybar-hyprland-git
idle         - swayidle     - paru -S swayidle
locker       - swaylock     - paru -S swaylock
editor       - Neovim       - paru -S neovim-nightly-bin lazygit zoxide ripgrep sqlite fd yarn nerd-fonts-jetbrains-mono lldb nvm make unzip
             - VSCode       - paru -S visual-studio-code-bin
node pkg mgr - pnpm         - paru -S npm && sudo npm i -g pnpm && pnpm i -g pnpm && npm uninstall -g pnpm
music        - MPD          - paru -S mpd mpc ncmpcpp cava mpdscribble && systemctl enable --user --now mpdscribble.service mpd.service
               // if you're using mpdscribble to connect to last.fm or other similar service, don't upload the config (password in config file)
             - yesplaymusic - paru -S yesplaymusic
               // a 3rd party netease music which can connect to last.fm inside and looks beautiful
shell        - zsh          - paru -S zsh && chsh -s /bin/zsh
color        - hyprpicker   - paru -S hyprpicker
screenshot   - grimblast    - paru -S grimblast
launcher     - rofi         - paru -S rofi-lbonn-wayland-git rofi-calc rofi-emoji
  & log manager & some applets
control      - light        - paru -S light && sudo chmod +s /bin/light
             - pamixer      - paru -S pamixer
ime          - fcitx5       - paru -S fcitx5 fcitx5-gtk
             - fcitx5 (zh)  - paru -S fcitx5-chinese-addons
             - fcitx5 (jp)  - paru -S fcitx5-anthy
file manager - ranger       - paru -S ranger python-pillow
               // pillow for image preview in kitty
               nemo         - paru -S nemo
```

## Others

```
cursor       - Catppuccin   - paru -S catppuccin-cursors-mocha
gtk          - Catppuccin   - paru -S catppuccin-gtk-theme-mocha
icons        - WhiteSur     - paru -S whitesur-icon-theme
qt           - lightly      - paru -S qt5ct qt5-wayland qt6-wayland lightly-qt
               // lightly sometimes can not work... but looks nice
dark mode    - gtk4         - gsettings set org.gnome.desktop.interface color-scheme prefer-dark
```
