# init this project with flake-parts
{
  description = "Nix templates for start to live with Nix Universe";
  outputs = inputs: inputs.parts.lib.mkFlake { inherit inputs; } {
    systems = [
      # nix was defined kind of system:
      # x86_64-darwin
      # aarch64-linux
      # aarch64-darwin
      # i686-linux
      # x86_64-linux
      "aarch64-darwin"
      "x86_64-linux"
    ];

    imports = [
      ./overlays
      ./hosts
      ./users
      ./modules/parts
    ];
  };

  inputs = {
    nix.url = "github:nixos/nix";
    nix.inputs.nixpkgs.follows = "nixpkgs";

    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    parts.url = "github:hercules-ci/flake-parts";

    ## -- nixpkgs
    master.url = "github:nixos/nixpkgs/master";
    stable.url = "github:nixos/nixpkgs/release-23.11";
    unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs.follows = "master";

    ## -- Platform

    #### ---- MacOS
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    #### ---- Home
    home.url = "github:nix-community/home-manager";
    home.inputs.nixpkgs.follows = "nixpkgs";
  };
}
