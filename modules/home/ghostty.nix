{ pkgs, ... }:

let
  # nvim-bg: open nvim in its own Ghostty window with a random background image.
  # Only this window gets the image; the normal Ghostty config is untouched.
  imageDir = "/Users/phillychi3/Pictures/vscode";
  nvimBg = pkgs.writeShellScriptBin "nvim-bg" ''
    img=$(find "${imageDir}" -maxdepth 1 -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) | sort -R | head -n 1)
    if [ -z "$img" ]; then
      echo "nvim-bg: no images found in ${imageDir}" >&2
      exit 1
    fi
    exec /usr/bin/open -na Ghostty --args \
      --background-image="$img" \
      --background-image-opacity=0.2 \
      --background-image-fit=cover \
      -e nvim "$@"
  '';
in
{
  home.packages = [ nvimBg ];

  home.file.".config/ghostty/config".text = ''
    # Default shell
    command = /etc/profiles/per-user/phillychi3/bin/fish

    # Theme
    theme = TokyoNight

    # Background
    background-opacity = 0.85
    background-blur-radius = 16

    # Shell integration
    shell-integration-features = true
  '';
}
