{ pkgs, ...}: {
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # Nerd Fonts
    ( nerdfonts.override {
        fonts = [ "IBMPlexMono" ];
      }
    )

    # Sans
    ibm-plex
  ];
}
