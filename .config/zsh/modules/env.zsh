# Vulkan
export WLR_RENDERER=vulkan

# Wayland
export QT_QPA_PLATFORM=wayland
export CLUTTER_BACKEND=wayland
export SDL_VIDEODRIVER=wayland
export MOZ_ENABLE_WAYLAND=1
export MOZ_WEBRENDER=1
export KITTY_ENABLE_WAYLAND=1

# Desktop
export WLR_NO_HARDWARE_CURSORS=1
export XDG_SESSION_TYPE=wayland

# QT
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_QPA_PLATFORMTHEME=qt6ct
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

# X
export XCURSOR_THEME=Catppuccin-Mocha-Dark-Cursors
export XCURSOR_SIZE=32

# Java
export _JAVA_AWT_WM_NONREPARENTING=1

# FCITX
export GLFW_IM_MODULE=fcitx
export GTK_IM_MODULE=fcitx
export INPUT_METHOD=fcitx
export XMODIFIERS=@im=fcitx
export IMSETTINGS_MODULE=fcitx
export QT_IM_MODULE=fcitx

# Paths
export PNPM_HOME="/home/pancak/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# Others
export EDITOR="nvim"
export BROWSER="firefox-developer-edition"
export TERMINAL="foot"
export LANG="en_US.UTF-8"

export BAT_THEME="Catppuccin-mocha"
export EXA_ICON_SPACING=2
