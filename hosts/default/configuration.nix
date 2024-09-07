# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nixvim/nixvim.nix
      inputs.home-manager.nixosModules.default



    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

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
  
  #hyprland setup

  programs.hyprland.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.desktopManager.plasma5.enable = true;
  
  # enable nixvim

  programs.nixvim.enable = true;

  
  # Configure keymap in X11
  services.xserver = {
   layout = "us,ru";
   xkbVariant = "workman";
   xkbOptions = "grp:alt_shift_toggle";
    
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  # sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  #  If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
  
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
 # nixpkgs.config.pulseaudio = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = with pkgs; [
	(pkgs.waybar.overrideAttrs (oldAttrs: {
		mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
	})
   )
   inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
   #console
   kitty
   pamixer
#app launcher
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
   hyprcursor
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
   curl
   clang
   htop

   virtualbox

   godot_4
 # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  ];
   fonts.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
