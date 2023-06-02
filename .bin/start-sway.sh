# Vulkan
export WLR_RENDERER=vulkan

# XDG
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=Hyprland

# Wayland
export GDK_BACKEND=wayland,x11
export QT_QPA_PLATFORM="wayland;xcb"
export SDL_VIDEODRIVER=wayland
export CLUTTER_BACKEND=wayland

# Firefox
export MOZ_ENABLE_WAYLAND=1
export MOZ_WEBRENDER=1

# Desktop
export WLR_NO_HARDWARE_CURSORS=1

# QT
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export QT_QPA_PLATFORMTHEME=qt6ct

# Java
export _JAVA_AWT_WM_NONREPARENTING=1

# FCITX
export GLFW_IM_MODULE=fcitx
export GTK_IM_MODULE=fcitx
export INPUT_METHOD=fcitx
export XMODIFIERS=@im=fcitx
export IMSETTINGS_MODULE=fcitx
export QT_IM_MODULE=fcitx

sway
