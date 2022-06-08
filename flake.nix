{
  inputs.dream2nix.url = "github:nix-community/dream2nix";
  outputs = {
    self,
    dream2nix,
  }:
    dream2nix.lib.makeFlakeOutputs {
      systems = ["x86_64-linux"];
      config.projectRoot = ./.;
      source = ./.;

      inject = {
        "@devcontainers/cli"."0.5.1" = [
          ["vscode-dev-containers" "0.238.0"]
        ];
      };

      sourceOverrides = _: {
        "vscode-dev-containers"."0.238.0" = builtins.fetchTarball {
          url = "https://github.com/microsoft/vscode-dev-containers/releases/download/v0.238.0/vscode-dev-containers-0.238.0.tgz";
          sha256 = "sha256:1g689z6c3nksmbn8rh6fz710m1bs632smsr3kqwklhh64qmzgh5z";
        };
      };
    };
}
