{
  programs.bash = {
    enable = true;
    historyControl = [ "erasedups" "ignoredups" "ignorespace" ];
    historyFile = "$HOME/.bash_history";

    shellAliases = {
      nx = "nvim ~/nix-config/nixos/configuration.nix";
      rb = "sudo nixos-rebuild switch --flake ~/nix-config/#benihime";
      hm = "nvim ~/nix-config/home-manager/home.nix";
      hs = "home-manager switch --flake ~/nix-config/#jejomar@benihime";

      ll = "ls -l";
      la = "ls -al";

      nv = "nvim";

      hl = "nvim ~/.config/hypr/hyprland.conf";
      restartnm = "sudo systemctl restart NetworkManager";
    };
  };
}
