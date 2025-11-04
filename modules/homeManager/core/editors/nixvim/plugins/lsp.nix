{
  programs.nixvim = {
    plugins = {
      treesitter-context = {
        enable = true;
        settings = {
          mode = "topline";
        };
      };

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

      # csharp lsp 
      roslyn.enable = true;

      # i hate this >:(
      # lsp-signature = {
      #   enable = true;
      # };

      # i hate this even MORE
      # lsp-lines.enable = true;
      lsp = {
        inlayHints = false; # is fucking hate it
        enable = true;
        servers = {

          cmake.enable = true;
          clangd.enable = true;
          
          # java
          jdtls.enable = true;

          # c#

          pyright.enable = true;

          # protobuf
          protols.enable = true;

          # nix
          nil_ls.enable = true;

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

          # gdshader_lsp.enable = true; не работает
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
