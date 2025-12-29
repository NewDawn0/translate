{
  description = "A cli translator using google translate";

  inputs.utils.url = "github:NewDawn0/nixUtils";

  outputs = { self, utils, ... }:
    let
      hash = "sha256-sKm+AU0TMXBm/OrOYKM6hZVRfJcEqP27O+6WNMoZxSg=";
      toml = with builtins; (fromTOML (readFile ./Cargo.toml));
      package = pkgs: self.packages.${pkgs.system}.default;
      inherit (toml.package) name version;
      src = ./.;
    in {
      overlays.default = final: prev: { translate = package prev; };
      devShells = utils.lib.eachSystem { } (pkgs: {
        default = pkgs.mkShell {
          inherit name;
          buildInputs = [ (package pkgs) ];
          CPATH = "${package pkgs}/include";
          LIBRARY_PATH = "${package pkgs}/lib";
          DYLD_LIBRARY_PATH = "${package pkgs}/lib";
        };
      });
      packages = utils.lib.eachSystem { } (pkgs:
        let
          cargoDeps = pkgs.rustPlatform.fetchCargoVendor {
            inherit hash src;
            useFetchCargoVendor = true;
          };
          cargoConfig = (pkgs.formats.toml { }).generate "config.toml" {
            source = {
              crates-io.replace-with = "vendored-sources";
              vendored-sources.directory = cargoDeps;
            };
          };
          default = pkgs.stdenv.mkDerivation {
            inherit name version src;
            buildInputs = with pkgs;
              [ pkg-config openssl cargo ] ++ lib.optionals pkgs.stdenv.isDarwin [ libiconv ];
            configurePhase = ''
              mkdir -p .cargo
              install ${cargoConfig} .cargo/config.toml
            '';
            buildPhase = ''
              CARGO_HOME=$(pwd)
              cargo build --release --offline
            '';
            installPhase = ''
              mkdir -p $out/lib $out/bin
              install -D target/release/translate $out/bin/translate
              mv target/release/libtranslate.* $out/lib/
              mv target/include $out/
              rm -f $out/lib/libtranslate.d
            '';
            meta = {
              description =
                "CLI translator and dynamic library using Google Translate";
              longDescription = ''
                A fast command-line translator with a C-compatible dynamic library (`libtranslate`) and header (`libtranslate.h`), enabling easy integration into C/C++ projects.
              '';
              homepage = "https://github.com/NewDawn0/translate";
              license = pkgs.lib.licenses.mit;
              maintainers = with pkgs.lib.maintainers; [ NewDawn0 ];
              platforms = pkgs.lib.platforms.all;
            };
          };
          c-example = pkgs.callPackage ./examples {
            pkgs = pkgs // { translate = default; };
          };
        in { inherit default c-example; });
    };
}
