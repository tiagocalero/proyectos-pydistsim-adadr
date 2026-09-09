{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{

  cachix.enable = false;

  languages.python = {
    enable = true;
    version = "3.11";

    venv = {
      enable = true;
      requirements = ./requirements.txt;
    };

    libraries = with pkgs; [
      stdenv.cc.cc.lib
      zlib
      libxkbcommon
      libGL
      glib
    ];
  };
  env.JUPYTER_DATA_DIR = "${config.env.DEVENV_STATE}/jupyter";
  env.JUPYTER_CONFIG_DIR = "${config.env.DEVENV_STATE}/jupyter-config";
  processes.jupyter.exec = "jupyter notebook --no-browser";
  # https://devenv.sh/basics/
  # env.GREET = "devenv";

  # https://devenv.sh/packages/
  # packages = [ pkgs.git ];

  # https://devenv.sh/languages/
  # languages.rust.enable = true;

  # https://devenv.sh/processes/
  # processes.dev.exec = "${lib.getExe pkgs.watchexec} -n -- ls -la";

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/scripts/
  # scripts.hello.exec = ''
  #   echo hello from $GREET
  # '';

  # https://devenv.sh/basics/
  # enterShell = ''
  #   hello         # Run scripts directly
  #   git --version # Use packages
  # '';

  # https://devenv.sh/tasks/
  # tasks = {
  #   "myproj:setup".exec = "mytool build";
  #   "devenv:enterShell".after = [ "myproj:setup" ];
  # };

  # https://devenv.sh/tests/
  # enterTest = ''
  #   echo "Running tests"
  #   git --version | grep --color=auto "${pkgs.git.version}"
  # '';

  # https://devenv.sh/git-hooks/
  # git-hooks.hooks.shellcheck.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
