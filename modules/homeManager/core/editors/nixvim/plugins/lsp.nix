{
  programs.nixvim = {
    plugins = {
      # i HATe thiS
      # treesitter-context = {
      #   enable = false;
      #   settings = {
      #     mode = "topline";
      #   };
      # };
      # i hate this >:(
      # lsp-signature = {
      #   enable = true;
      # };

      # i hate this even MORE
      # lsp-lines.enable = true;

      treesitter = {
        folding = true;
        enable = true;
        settings = {
          indent.enable = true;
          highlight = {
            enable = true;
            additional_vim_regex_highlighting = true;
          };
        };
      };

      treesitter-refactor = {
        enable = true;
        settings = {
          highlightDefinitions = {
            enable = true;
            clearOnCursorMove = false;
          };
        };
      };

      # roslyn.enable = true; # use easy-dotnet instead

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

          # go
          gopls = {
            enable = true;
            extraOptions = {
              init_options = {
                semanticTokens = true;
                hints = {
                  functionTypeParameters = false;
                  assignVariableTypes = false;
                  rangeVariableTypes = false;
                  parameterNames = false;
                  constantValues = true;
                };
              };
            };
          };

          # gdshader_lsp.enable = true;
          gdscript = {
            enable = true;
            package = null;
            extraOptions = {
              cmd = {
                __raw = ''
                  vim.lsp.rpc.connect("127.0.0.1", 6005)
                '';
              };
            };
          };

          # typescript
          ts_ls = {
            enable = true;
            extraOptions = {
              init_options = {
                preferences = {
                  importModuleSpecifierPreference = "non-relative";
                  includeCompletionsForImportStatements = true;
                  includeCompletionsForModuleExports = true;
                };
              };
            };

            settings = {
              init_options = {
                preferences = {
                  importModuleSpecifierPreference = "non-relative";
                };
              };
              typescript = {
                preferences = {
                  includeCompletionsForModuleExports = true;
                  includeCompletionsForImportStatements = true;
                  importModuleSpecifier = "non-relative";
                };
                inlayHints = {
                  includeInlayParameterNameHints = "all"; # -- 'none' | 'literals' | 'all'
                  includeInlayParameterNameHintsWhenArgumentMatchesName = true;
                  includeInlayVariableTypeHints = true;
                  includeInlayFunctionParameterTypeHints = true;
                  includeInlayVariableTypeHintsWhenTypeMatchesName = true;
                  includeInlayPropertyDeclarationTypeHints = true;
                  includeInlayFunctionLikeReturnTypeHints = true;
                  includeInlayEnumMemberValueHints = true;
                };
              };
              javascript = {
                preferences = {
                  includeCompletionsForModuleExports = true;
                  includeCompletionsForImportStatements = true;
                  importModuleSpecifier = "non-relative";
                };
                inlayHints = {
                  includeInlayParameterNameHints = "all"; # -- 'none' | 'literals' | 'all'
                  includeInlayParameterNameHintsWhenArgumentMatchesName = true;
                  includeInlayVariableTypeHints = true;
                  includeInlayFunctionParameterTypeHints = true;
                  includeInlayVariableTypeHintsWhenTypeMatchesName = true;
                  includeInlayPropertyDeclarationTypeHints = true;
                  includeInlayFunctionLikeReturnTypeHints = true;
                  includeInlayEnumMemberValueHints = true;
                };
              };
            };
          };
        };
      };
    };
  };
}
