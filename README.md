# arch-dotfiles

## Desktop

| ~                      | name       | installing command                                                      |
| ---------------------- | ---------- | ----------------------------------------------------------------------- |
| desktop                | Hyprland   | `paru -S hyprland`                                                      |
| wallpaper              | hyprpaper  | `paru -S hyprpaper`                                                     |
| launcher               | rofi       | `paru -S rofi-lbonn-wayland-git rofi-calc rofi-emoji`                   |
| notification           | mako       | `paru -S mako`                                                          |
| bar                    | waybar     | `paru -S waybar-hyprland-git`                                           |
| idle                   | swayidle   | `paru -S swayidle`                                                      |
| locker                 | swaylock   | `paru -S swaylock`                                                      |
| screenshot             | grimblast  | `paru -S grimblast`                                                     |
| color picker           | hyprpicker | `paru -S hyprpicker`                                                    |
| controllers            | light      | `paru -S light && sudo chmod +s /bin/light - pamixer - paru -S pamixer` |
| blue light proctection | sunset     | `paru -S wlsunset`                                                      |

## Desktop / Selectable

| ~   | name   | installing command              |
| --- | ------ | ------------------------------- |
| ime | fcitx5 | `paru -S fcitx5 fcitx5-gtk`     |
|     | zh     | `paru -S fcitx5-chinese-addons` |
|     | jp     | `paru -S fcitx5-anthy`          |

## Softwares

| ~            | name         | installing command                                                                                          |
| ------------ | ------------ | ----------------------------------------------------------------------------------------------------------- |
| editor       | NeoVim       | `paru -S neovim-nightly-bin lazygit zoxide ripgrep sqlite fd yarn lldb make unzip`                          |
|              | VSCode       | `paru -S code-transparent code-features`                                                                    |
| NPM          | pnpm         | `paru -S npm && sudo npm i -g pnpm && pnpm i -g pnpm && npm uninstall -g pnpm`                              |
| music player | MPD          | `paru -S mpd mpc ncmpcpp cava mpdscribble && systemctl enable --user --now mpdscribble.service mpd.service` |
|              | yesplaymusic | `paru -S yesplaymusic`                                                                                      |
| shell        | zsh          | `paru -S zsh && chsh -s /bin/zsh`                                                                           |
| file manager | ranger       | `paru -S ranger python-pillow`                                                                              |
|              | xplr         | `paru -S xplr`                                                                                              |
|              | nemo         | `paru -S nemo`                                                                                              |

## Theme

| ~      | name       | installing command                                 |
| ------ | ---------- | -------------------------------------------------- |
| cursor | Catppuccin | `paru -S catppuccin-cursors-mocha`                 |
| gtk    | Catppuccin | `paru -S catppuccin-gtk-theme-mocha`               |
| icons  | WhiteSur   | `paru -S whitesur-icon-theme`                      |
| qt     | lightly    | `paru -S qt5ct qt5-wayland qt6-wayland lightly-qt` |

## Others

| ~         | name | command                                                              |
| --------- | ---- | -------------------------------------------------------------------- |
| dark mode | gtk4 | `gsettings set org.gnome.desktop.interface color-scheme prefer-dark` |
