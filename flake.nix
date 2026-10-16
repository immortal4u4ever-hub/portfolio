{
  description = "Arun Philip — Resume, CV, and Portfolio";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;

      # Fonts for Typst output. Kept to plain nixpkgs packages for now.
      #
      # NOTE: if we adopt the `neat-cv` theme from ../portfolio/, it also needs
      # a *static* Noto Sans — nixpkgs ships only the variable font, which Typst
      # cannot use. ../portfolio/flake.nix carries a `noto-sans-static`
      # derivation that fetches the unhinted TTF set; copy it over at that point
      # rather than pre-emptively vendoring it here.
      typstFontPackages =
        pkgs: with pkgs; [
          fira # Fira Sans
          font-awesome # icons
          roboto
          source-sans # Source Sans 3
          source-sans-pro # fallback family name
        ];

      typstFontPaths =
        pkgs: builtins.concatStringsSep ":" (map (p: "${p}/share/fonts") (typstFontPackages pkgs));
    in
    {
      # No `packages.default` yet — there are no Typst sources to build, and a
      # build target that fails is worse than none. Add it (mirroring
      # ../portfolio/flake.nix) once sources/ has produced a document.

      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            packages = [
              pkgs.typst # document compiler
              pkgs.typstyle # Typst formatter
              pkgs.gnumake
              pkgs.poppler-utils # pdftotext / pdfinfo — reading source PDFs
            ]
            ++ typstFontPackages pkgs;

            shellHook = ''
              export TYPST_FONT_PATHS="${typstFontPaths pkgs}"
              echo "Arun Philip — resume environment ready."
              echo ""
              echo "Available:"
              echo "  typst compile <file.typ> <out.pdf>   compile a document"
              echo "  typstyle -i <file.typ>               format in place"
              echo "  pdftotext -layout <in.pdf> -         read a source PDF"
              echo "  pdfinfo <in.pdf>                     page count, metadata"
              echo ""
              echo "Sources:  sources/profile.md   (source of truth)"
              echo "History:  history.md           (applications)"
              echo "Outputs:  outputs/             (generated, gitignored)"
            '';
          };
        }
      );
    };
}
