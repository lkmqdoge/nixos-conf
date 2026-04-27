{ pkgs, ... }:
{

  programs.nixvim.plugins.dap-virtual-text.enable = true;
  programs.nixvim.plugins.dap-view.enable = true;
  programs.nixvim.plugins.dap = {
    enable = true;
    
    adapters.executables = {
      coreclr = {
        command = "${pkgs.netcoredbg}/bin/netcoredbg";
        args = [ "--interpreter=vscode" ];
      };
    };

    configurations = {
      cs = [
        {
          type = "coreclr";
          name = "Launch .NET Core";
          request = "launch";
          program.__raw = ''
            function()
              return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/", "file")
            end
          '';
          cwd = "\${workspaceFolder}";
          stopOnEntry = false;
        }
      ];
    };
  };
}
