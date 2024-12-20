{ config, pkgs, ... }:

{
  home.stateVersion = "24.11"; # Ensure this matches the Home Manager version
  home.packages = with pkgs; [ git zsh ];

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell"; # Changed to a valid Oh My Zsh theme
    };
  };

  # You can add more Home Manager configurations here
}