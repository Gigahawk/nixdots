#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

function trace() {
    echo "!" "$@" >&2; "$@"
}

function usage() {
cat << EOF
Usage:
  ./make.sh build
  ./make.sh switch
  ./make.sh update
  ./make.sh info
  ./make.sh cleanup
  ./make.sh help
EOF
}

function invalid_syntax() {
    echo "Invalid syntax." 2>&1
    usage 2>&1
    return 1
}

cd "$( dirname "${BASH_SOURCE[0]}" )"

[[ $# -lt 1 ]] && invalid_syntax

mode="$1"
shift

case "$mode" in
    "build")
        trace sudo nixos-rebuild build --flake . "${@}"
        echo "Drv: " "$(readlink ./result)"
        nix-shell -p python3 --run "./nix/diff /var/run/current-system result >&2"
        ;;
    "switch")
        trace sudo nixos-rebuild switch --flake . "${@}"
        ;;
    "update")
        trace nix flake update
        "$0" build
        ;;
    "info")
        drv="$(realpath /var/run/current-system)"

        echo "> Derivation:"
        echo "$drv"
        echo

        echo "> Biggest dependencies:"
        du -shc $(nix-store -qR "$drv") | sort -hr | head -n 21 || true
        echo

        echo "> Auto GC roots:"
        roots=""
        for i in /nix/var/nix/gcroots/auto/*; do
          p="$(readlink "$i")"
          if [[ -e "$p" ]]; then
            s="$(du -sch $(nix-store -qR "$p") | tail -n 1 | grep -Po "^[^\t]*")"
            roots="$roots$s $p\n"
          fi
        done
        if [[ -n "$roots" ]];
        then echo -e "$roots" | sort -hr
        else echo "None."
        fi
        ;;
    "cleanup")
        trace sudo nix-collect-garbage --delete-older-than 7d
        trace sudo nix optimise-store
        ;;
    "help")
        [[ $# -gt 0 ]] && invalid_syntax
        usage
        ;;
    *)
        invalid_syntax
esac
