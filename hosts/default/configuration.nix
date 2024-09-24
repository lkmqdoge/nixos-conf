# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./../../modules/nixos-modules
    ];
  # Virbox
  # virtualisation.virtualbox.host.enable = true;
  # virtualisation.virtualbox.guest.enable = true;
  # virtualisation.virtualbox.guest.draganddrop = true;

  # users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];
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
}
