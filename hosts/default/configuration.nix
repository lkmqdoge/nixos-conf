# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./../../nixos-modules/sound.nix
      ./../../nixos-modules/power-managment.nix
      ./../../nixos-modules/nixvim/nixvim.nix
      ./../../nixos-modules/hyprland.nix
      ./../../nixos-modules/bluetooth.nix
      inputs.home-manager.nixosModules.default
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "ru_RU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };
   
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver = {
   layout = "us,ru";
   xkbVariant = "workman";
   xkbOptions = "grp:alt_shift_toggle";
    
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  #fish shell
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish; 
  
  # Virbox
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.draganddrop = true;

  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lkmqdoge = {
    isNormalUser = true;
    description = "Алексей Кизин";
    extraGroups = [ "networkmanager" "wheel" "audio" "input" ];
    packages = with pkgs; [
      kate
    #  thunderbird
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "lkmqdoge" = import ./../../home.nix;
    };
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "lkmqdoge";

  #flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.gc.automatic = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  
  environment.systemPackages = with pkgs; [
	(pkgs.waybar.overrideAttrs (oldAttrs: {
		mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
	})
   )
   inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
   kitty
   pamixer
   rofi-wayland
   brightnessctl   
   pwvucontrol
   pkgs.discord
   alacritty   
   xfce.thunar 
   firefox
   swww
   vim
   telegram-desktop
   pkgs.waybar
   pkgs.dunst
   pkgs.networkmanagerapplet

   glib
   libnotify
   font-manager
   font-awesome
   cmake
   lua
   unzip
   vlc
   feh
   git   
   wttrbar
   pkgs.grim
   pkgs.slurp
   pkgs.wl-clipboard
   neovim
   clang
   htop

   virtualbox

   godot_4
  ];
   fonts.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
];
  system.stateVersion = "23.11"; # Did you read the comment?
}
