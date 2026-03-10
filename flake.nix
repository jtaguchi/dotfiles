{
  description = "Set up common developer environment";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      devPackages = with pkgs; [
        # Core tools
        tmux
        git
        git-credential-manager
        curl
        chezmoi

        # Python
        uv
      ] ++ (with pkgs; pkgs.lib.optionals pkgs.stdenv.isLinux [
        gcc
        stdenv.cc.cc.lib
      ]);
}
