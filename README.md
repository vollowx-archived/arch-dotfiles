# arch-dotfiles

## Showcase

| music                                                                                                           | neovim                                                                                                          | something                                                                                                       | waybar themes                                                                                                   |
| --------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| ![image](https://user-images.githubusercontent.com/73375859/235141782-d715aadd-b9ec-46b8-ac48-8116c1280bad.png) | ![image](https://user-images.githubusercontent.com/73375859/235141863-79ae2da5-be11-489f-9a15-f8e40e0dbb14.png) | ![image](https://user-images.githubusercontent.com/73375859/235142039-8b2a77da-af5b-4d2c-9cd2-04389adc5f06.png) | ![image](https://user-images.githubusercontent.com/73375859/235142126-cadcece8-522d-4d58-86fb-27b12820ccea.png) |

## Desktop

| ~            | name       | installing command                                    |
| ------------ | ---------- | ----------------------------------------------------- |
| desktop      | Hyprland   | `paru -S hyprland`                                    |
| wallpaper    | hyprpaper  | `paru -S hyprpaper`                                   |
| launcher     | rofi       | `paru -S rofi-lbonn-wayland-git rofi-calc rofi-emoji` |
| notification | mako       | `paru -S mako`                                        |
| bar          | waybar     | `paru -S waybar-hyprland-git`                         |
| idle         | swayidle   | `paru -S swayidle`                                    |
| locker       | swaylock   | `paru -S swaylock`                                    |
| screenshot   | grimblast  | `paru -S grimblast`                                   |
| color picker | hyprpicker | `paru -S hyprpicker`                                  |
| controllers  | light      | `paru -S light && sudo chmod +s /bin/light`           |
|              | pamixer    | `paru -S pamixer`                                     |
| blue light   | sunset     | `paru -S wlsunset`                                    |

## Desktop / Selectable

| ~   | name   | installing command              |
| --- | ------ | ------------------------------- |
| IME | fcitx5 | `paru -S fcitx5 fcitx5-gtk`     |
|     | zh     | `paru -S fcitx5-chinese-addons` |
|     | jp     | `paru -S fcitx5-anthy`          |

## Softwares

| ~            | name         | installing command                                                                                          |
| ------------ | ------------ | ----------------------------------------------------------------------------------------------------------- |
| shell        | zsh          | `paru -S zsh starship && chsh -s /bin/zsh`                                                                  |
| terminal     | Foot         | `paru -S foot libsixel`                                                                                     |
| editor       | NeoVim       | `paru -S neovim-nightly-bin lazygit zoxide ripgrep sqlite fd yarn lldb make unzip`                          |
|              | VSCode       | `paru -S code-transparent code-features`                                                                    |
| NPM          | pnpm         | `paru -S npm && sudo npm i -g pnpm && pnpm i -g pnpm && npm uninstall -g pnpm`                              |
| music player | MPD          | `paru -S mpd mpc ncmpcpp cava mpdscribble && systemctl enable --user --now mpdscribble.service mpd.service` |
|              | yesplaymusic | `paru -S yesplaymusic`                                                                                      |
| file manager | ranger (tui) | `paru -S ranger-git`                                                                                        |
|              | nemo (gui)   | `paru -S nemo`                                                                                              |
| fetch        | fastfetch    | `paru -S fastfetch`                                                                                         |

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
