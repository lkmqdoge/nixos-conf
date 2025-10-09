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
        highlightDefinitions = {
          enable = true;
          clearOnCursorMove = false;
        };
      };

      # highlight homemanager files
      hmts.enable = true;

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
          jdtls.enable = true;
          tailwindcss.enable = true;
          omnisharp.enable = true;
          pyright.enable = true;
          protols.enable = true;
          nil_ls.enable = true;
          svelte.enable = true;
          clangd.enable = true;
          jsonls.enable = true;
          cssls.enable = true;
          html.enable = true;
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

          asm_lsp = {
            enable = true;
            filetypes = [
              "asm"
              "s"
              "S"
            ];
          };

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

  xdg.configFile."asm-lsp/.asm-lsp.toml".text = ''
    [default_config]
    assembler = "nasm"
    instruction_set = "x86/x86-64"

    [opts]
    compiler = "nasm"
    diagnostics = true
    default_diagnostics = false
  '';
}
