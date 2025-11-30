{ pkgs, ... }:
{

  programs.nixvim.plugins.dap-virtual-text.enable = true;

  programs.nixvim.plugins.dap-view.enable = true;

  programs.nixvim.plugins.dap = {
    enable = true;
    
    # adapters = {
    #   executables = {
    #     coreclr = {
    #       command = "${pkgs.netcoredbg}/bin/netcoredbg";
    #     };
    #   };
    # };
    #
    # configurations = {
    #   cs = {
    #     type = "coreclr";
    #     name = "launch - netcoredbg";
    #   };
    # };
  };
  programs.nixvim.extraConfigLua = ''
      local dap = require("dap")

      dap.adapters.coreclr = {
        type = 'executable',
        command = '${pkgs.netcoredbg}/bin/netcoredbg',
        args = { '--interpreter=vscode' }
      }

      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "Launch .NET Core",
          request = "launch",
          program = function()
            return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/', 'file')
          end,
        }
      }
    '';
}
