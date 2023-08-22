{ pkgs, ...}: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    });

    settings = {
      mainBar = {
        layer = "top";
	position = "top";
	height = 26;

	modules-left = [ "tray" ];
	modules-center = [ "wlr/workspaces" ];
	modules-right = [ "clock" ];
      };
    };
  };
}
