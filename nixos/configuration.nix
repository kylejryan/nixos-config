{ config, pkgs, ... }:

{
  # Enable experimental features for Nix
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  imports = [
    ./hardware-configuration.nix
  ];

  # Rest of your configuration
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
  };

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
  };

  services.printing.enable = true;

  users.users.kyle = {
    isNormalUser = true;
    description = "kyle";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
    extraConfig = ''
      kyle ALL=(ALL) NOPASSWD: ALL
    '';
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    kitty
    neovim
    git
    gcc
    python3
  ];

  programs.tmux.enable = true;

  virtualisation.vmware.guest.enable = true;

  system.stateVersion = "24.11"; # Ensure this matches your NixOS version
}