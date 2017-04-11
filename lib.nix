{ pkgs }:

{
  mkDotfiles = files:
    pkgs.writeScriptBin "dotfiles" ''
      function trace() {
        echo "! $@"; $@
      }

      set -o errexit
      set -o nounset

      ${ pkgs.lib.concatMapStringsSep "\n" ({path, target}: ''
           mkdir -p "$HOME/$(dirname ${path})";
         trace ln -sfn "${target}" "$HOME/${path}"
           '')
         files }
    '';

  mkEmacs = epkgs: conf:
    let emacs = epkgs.emacsWithPackages (epkgs:
          [ epkgs.use-package epkgs.benchmark-init ] ++
            builtins.map (i: builtins.getAttr i.package epkgs) conf.packages
        );

        configuration = pkgs.writeText "emacs-el" ''
          ; (require 'benchmark-init)
          ; (benchmark-init/activate)

          (setq user-init-file (or load-file-name (buffer-file-name)))
          (setq user-emacs-directory (file-name-directory user-init-file))

          (package-initialize)

          (eval-when-compile
            (require 'use-package))
          (require 'diminish)
          (require 'bind-key)

          ${conf.config}
          ${pkgs.lib.concatMapStringsSep "\n" renderItem conf.packages}
        '';

        systemPackages = builtins.concatLists (
          pkgs.lib.catAttrs "systemPackages" conf.packages
        );

        # not for performance, mostly because i want to get
        # compile time errors on invalid syntax.
        compiledConfiguration = pkgs.runCommand "emacs-elc" {} ''
          cp ${configuration} emacs.el
          ${emacs}/bin/emacs -Q --batch -f batch-byte-compile emacs.el
          cp emacs.elc $out
          echo ";;Generated from: ${configuration}" >> $out
        '';
        renderItem =
          { package
          , config         ? ""
          , init           ? ""
          , binds          ? ""
          , modes          ? {}
          , commands       ? []
          , diminish       ? ""
          , systemPackages ? null
          , defer          ? false
          }: ''
          (use-package ${package}
            ${pkgs.lib.optionalString
                (init != "")
                ":init\n${init}"}
            ${pkgs.lib.optionalString
                (config != "")
                ":config\n${config}"}
            ${pkgs.lib.optionalString
                (commands != [])
                ":commands\n(${pkgs.lib.concatStringsSep " " commands})"}
            ${pkgs.lib.optionalString
                (binds != "")
                ":bind\n${toAList binds}"}
            ${pkgs.lib.optionalString
                (modes != {})
                ":mode\n${toAList modes}"}
            ${pkgs.lib.optionalString
                (diminish != "")
                ":diminish\n${diminish}"}
            ${pkgs.lib.optionalString
                defer
                ":defer t"}
          )
          '';
        toAList = attrs:
           "(${pkgs.lib.concatStringsSep " " (pkgs.lib.mapAttrsToList (k: v: "(\"${k}\" . ${v})") attrs)})";
    in  pkgs.stdenv.lib.overrideDerivation emacs (super: {
          installPhase = super.installPhase + ''
            wrapProgram $out/bin/emacs \
              --add-flags "-q --load ${compiledConfiguration}" \
              --prefix "PATH" ":" ${pkgs.lib.concatStringsSep ":" systemPackages}
          '';
        });

   ext = ext: "\\\\.${ext}\\\\'";

   mkYaSnippetsDir = snippets:
     let mapped = pkgs.lib.mapAttrsToList (mode: pkgs.lib.mapAttrsToList (name: snippet:
         let file = pkgs.writeText "snippet-${name}" ''
             # -*- mode: snippet -*-
             # name: ${name}
             # key: ${name}
             # --
             ${snippet}
             '';
         in  "mkdir -p $out/${mode}/; ln -s ${file} $out/${mode}/${name};"
       )) snippets;
     in pkgs.runCommand "snippets" {} (
          pkgs.lib.concatStringsSep "\n" (pkgs.lib.concatLists mapped)
        );
}
