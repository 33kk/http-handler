#!/bin/sh
DIR=$(dirname "$(readlink -f "$0")")

echo Installing http-handler...

echo Creating directories...
mkdir -p ~/.local/bin ~/.local/share/applications ~/.config/http-handler

echo Linking files...
ln -sf "$DIR/http-handler" ~/.local/bin
ln -sf "$DIR/http-handler.desktop" ~/.local/share/applications

echo Setting http-handler as default web browser...
xdg-settings set default-web-browser http-handler.desktop

echo Creating default config...

[ ! -f ~/.config/http-handler/config ] && cat > ~/.config/http-handler/config << EOF
BROWSER="firefox"
M3U="vlc"
IMAGE="gwenview"
VIDEO="mpv"
EOF

echo Edit ~/.config/http-handler/config to change default apps for video/image/m3u links and default web browser
