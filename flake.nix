{
  description = "Set up common developer environment";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      systems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      makeShell = system:
        let
          pkgs = import nixpkgs { inherit system; };
        in pkgs.mkShell {
          buildInputs = [
            pkgs.git
            pkgs.git-credential-manager
            pkgs.tmux
            pkgs.chezmoi
            pkgs.curl
            pkgs.uv
          ];
        };
    in {
      defaultPackage = builtins.listToAttrs (map (system:
        { name = system; value = makeShell system; }
      ) systems);
    };
}