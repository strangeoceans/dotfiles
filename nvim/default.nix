{
  nixosConfig,
  lib,
  pkgs-unstable,
  inputs,
  ...
}:
with lib;

{
  disabledModules = [
    "programs/neovim.nix"
  ];
  imports = [
    "${inputs.home-manager-unstable}/modules/programs/neovim.nix"
  ];

  config = mkIf nixosConfig.programs.neovim.enable {
    home.packages = with pkgs-unstable; [
      nixd
      lua-language-server
      pyright
      gopls
      ccls
    ];

    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      plugins =
        with pkgs-unstable.vimPlugins;
        let
          alabaster = pkgs-unstable.vimUtils.buildVimPlugin {
            name = "alabaster";
            src = pkgs-unstable.fetchFromSourcehut {
              owner = "~p00f";
              repo = "alabaster.nvim";
              rev = "1fc9e29f";
              sha256 = "Xng+shYT7BtrD6ZSnCGgt01lm9ZALfYwivYRGRjNpUo=";
            };
          };
        in
        [
          alabaster
          vim-sneak
          luasnip
          cmp-nvim-lsp
          nvim-jdtls
          nvim-treesitter.withAllGrammars
          nvim-web-devicons
          persistence-nvim
          nvim-lspconfig
          lualine-nvim
          telescope-nvim
          neo-tree-nvim
          nvim-cmp
          nvim-highlight-colors
          barbar-nvim
        ];
    };

    home.sessionVariables = {
      NVIM_USE_SYSTEM_PLUGINS = "1";
    };
    xdg.configFile."nvim".source = ./.;
  };
}
