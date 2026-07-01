{
  nixosConfig,
  lib,
  pkgs,
  clib,
  ...
}:
{
  config = lib.mkIf (clib.shouldInclude "neovim" nixosConfig.host) {
    home.packages = with pkgs; [
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
        with pkgs.vimPlugins;
        let
          alabaster = pkgs.vimUtils.buildVimPlugin {
            pname = "alabaster";
            version = "0.0.1";
            src = pkgs.fetchFromSourcehut {
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
          claude-code-nvim
          plenary-nvim
        ];
    };

    home.sessionVariables = {
      NVIM_USE_SYSTEM_PLUGINS = "1";
    };
    xdg.configFile."nvim".source = ./.;
  };
}
