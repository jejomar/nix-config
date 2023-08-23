# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    ./bash.nix
    ./fonts.nix
    ./waybar.nix
    ./nvim.nix
    ./theme.nix

    ./programs/kitty.nix
    ./programs/rofi.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    username = "jejomar";
    homeDirectory = "/home/jejomar";
  };

  # Generate user directories
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [
    
    # base
    kitty
    firefox
    rofi
    networkmanagerapplet

    # system info
    neofetch
    
    # docs
    obsidian
    zathura
    masterpdfeditor4

    # internet
    brave
    ungoogled-chromium

    # media
    mpv
    spotify
    feh
    pavucontrol

    # notifications
    dunst

    # tools
    isoimagewriter

  ];

  # Enable home-manager
  programs.home-manager.enable = true;

  # Git
  programs.git = {
    enable = true;
    userEmail = "jejomarcariaga.jc@gmail.com";
    userName = "Jejomar Cariaga";
    extraConfig = {
      credential.helper = "${
        pkgs.git.override { withLibsecret = true; }
      }/bin/git-credential-libsecret";
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
