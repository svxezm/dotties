{
  description = "Rust development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
  flake-utils.lib.eachDefaultSystem (system:
  let
    overrides = (builtins.fromTOML (builtins.readFile ./rust-toolchain.toml));
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    devShells.default = pkgs.mkShell rec {
      nativeBuildInputs = [ pkgs.pkg-config ];
      buildInputs = with pkgs; [
        clang
        llvmPackages_21.bintools
        rustup
      ];

      RUSTC_VERSION = overrides.toolchain.channel;

      LIBCLANG_PATH = pkgs.lib.makeLibraryPath [ pkgs.llvmPackages_latest.libclang.lib ];

      shellHook = ''
        export PATH=$PATH:''${CARGO_HOME:-~/.cargo}/bin
        export PATH=$PATH:''${RUSTUP_HOME:-~/.rustup}/toolchains/$RUSTC_VERSION-x86_64-unknown-linux-gnu/bin/
      '';

      RUSTFLAGS = (builtins.map (a: ''-L ${a}/lib'') [
        # pkgs.libvmi
      ]);

      LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath (buildInputs ++ nativeBuildInputs);

      BINDGEN_EXTRA_CLANG_ARGS =
      (builtins.map (a: ''-I${a}/include'') [
        pkgs.glibc.dev
      ])
      ++ [
        ''-I"${pkgs.llvmPackages_latest.libclang.lib}/lib/clang/${pkgs.llvmPackages_latest.libclang.version}/include"''
        ''-I"${pkgs.glib.dev}/include/glib-2.0"''
        ''-I${pkgs.glib.out}/lib/glib-2.0/include/''
      ];
    };
  });
}
