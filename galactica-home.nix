{ ... }:

let pkgs = import ./nixpkgs {};
in

{
  imports = [ ./common-home.nix ];
  home.packages = with pkgs; [
    protobuf3_1
    travis
    slack
    kt
    spark
    mysql
    mysql-workbench
    (kubernetes.override { components = [ "cmd/kubectl" ]; })
  ];

}
