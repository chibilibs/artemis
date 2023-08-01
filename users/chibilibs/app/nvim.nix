{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    
    globals.mapleader = " ";
    options = {
      nu = true;
      tgc = true;
      scs = true;
      ic = true;
      si = true;
      hls = true;
      ts = 4;
      sw = 4;
      bg = "dark";
      scl = "yes";
      cc = "80";
      tm = 300;
      so = 8;
      lz = true;
      wmnu = true;
      wop = "fuzzy";
      hidden = true;
      sol = true;
    };

    plugins.toggleterm = {
      enable = true;
      direction = "horizontal";
    };

    plugins.lualine.enable = true;

    plugins.telescope = {
      enable = true;
      keymaps = { "<leader>ff" = "find_files"; };
    };

    plugins.nix.enable = true;

    plugins.treesitter = {
      enable = true;
      nixGrammars = true;
    };

    plugins.lsp = {
      enable = true;

      keymaps = {
        diagnostic = {
          "<leader>j" = "goto_next";
          "<leader>k" = "goto_prev";
        };
        lspBuf = {
          K = "hover";
          gD = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
        };
      };

      servers = {
        clangd.enable = true;
        cmake.enable = true;
        java-language-server.enable = true;
        rnix-lsp.enable = true;
      };
    };
    plugins.lspkind = {
      enable = true;
      cmp.ellipsisChar = "...";
      cmp.menu = {
        buffer = "[Buffer]";
        nvim_lsp = "[LSP]";
        luasnip = "[LuaSnip]";
        nvim_lua = "[Lua]";
        latex_symbols = "[Latex]";
      };
      cmp.after = ''
        function(entry, vim_item, kind)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })
          kind.kind = " " .. strings[1] .. " "
          kind.menu = "   " .. strings[2]
          return kind
        end
      '';
    };

    plugins.cmp-vim-lsp.enable = true;
    plugins.cmp_luasnip.enable = true;
    plugins.luasnip.enable = true;

    plugins.nvim-cmp = {
      enable = true;
      sources = [{ name = "nvim_lsp"; } { name = "luasnip"; } { name = "buffer"; }];
      mappingPresets = [ "insert" ];
      mapping = { "<CR>" = "cmp.mapping.confirm({ select = true })"; };
      formatting.fields = [ "kind" "abbr" "menu" ];
      snippet.expand = "luasnip";
    };

    plugins.lsp-lines.enable = true;

    # colorschemes
    colorschemes.catppuccin = {
      enable = true;
      flavour = "mocha";
    };

    extraPlugins = with pkgs.vimPlugins; [
      friendly-snippets
      vim-nix
    ];
  };
}
