{ pkgs, ... }:
{

  programs.nixvim.plugins.dap-virtual-text.enable = true;

  programs.nixvim.plugins.dap-view.enable = true;

  programs.nixvim.plugins.dap = {
    enable = true;
  };

  programs.nixvim.extraConfigLua = ''
    local dap = require("dap")

    dap.adapters.coreclr = {
      type = 'executable',
      command = '${pkgs.netcoredbg}/bin/netcoredbg',
      args = { '--interpreter=vscode' }
    }

    dap.adapters.godot = {
      type = "server",
      host = '127.0.0.1',
      port = 6006,
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


    dap.configurations.gdscript = {
      {
        type = "godot",
        request = "launch",
        name = "Launch scene",
        project = "\$\{workspaceFolder\}",
      }
    }
  '';
}
