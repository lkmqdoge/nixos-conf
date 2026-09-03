{
  programs.nixvim = {
    plugins = {
      treesitter = {
        enable = true;
        folding.enable = true;
        settings = {
          indent.enable = true;
          highlight = {
            enable = true;
            additional_vim_regex_highlighting = true;
          };
        };
      };

      lsp-signature = {
        enable = true;
        settings = {
          hint_prefix = "";
        };
      };

      lsp = {
        inlayHints = false; # is fucking hate it
        enable = true;

        keymaps.lspBuf = {
          K = "hover";
          gD = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
        };

        servers = {
          roslyn_ls.enable = false;
          just.enable = true;
          cmake.enable = true;
          clangd.enable = true;
          jdtls.enable = true;   # java
          pyright.enable = true;
          protols.enable = true; # protobuf
          nil_ls.enable = true;  # nix
          svelte.enable = true;
          jsonls.enable = true;
          cssls.enable = true;
          html.enable = true;
          tailwindcss.enable = true;
          gopls.enable = true;
          zls.enable = true;
          ts_ls.enable = true;

          gdscript = {
            enable = true;
            package = null;
            extraOptions.cmd.__raw = ''
                  vim.lsp.rpc.connect("127.0.0.1", 6005)
                  '';
          };
        };
      };
    };
  };
}
