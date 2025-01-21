{ config, lib, pkgs, home, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      colors.draw_bold_text_with_bright_colors = true;
      env.TERM = "xterm-256color";
      font = {
        size = 12;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };
}
