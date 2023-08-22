{
  programs.kitty = {
    enable = true;

    settings = {
      # Remove close window confirmation
      confirm_os_window_close = 0;

      # Font config
      font_family = "BlexMono Nerd Font Mono";
      bold_font = "BlexMono Nerd Font Mono Bold";
      italic_font = "BlexMono Nerd Font Mono Italic";
      bold_italic = "BlexMono Nerd Font Mono Bold Italic";
      font_size = 11;

      # Window layout
      window_padding_width = 4;
      placement_stategy = "center";

      # Color scheme
      background_opacity = "0.8";

      # Disable audio bell
      enable_audio_bell = "no";
    };

    theme = "Rosé Pine";
  };
}
