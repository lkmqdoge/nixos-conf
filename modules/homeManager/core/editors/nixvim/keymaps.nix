{
  config,
  lib,
  ...
}: {
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps = let
      normal =
        lib.mapAttrsToList
        (key: action: {
          mode = "n";
          inherit action key;
        })
        {
          # Open Neotree
          "<leader>n" = ":Neotree<CR>";

          # Open Vifm
          "<leader>p" = ":Vifm<CR>";

          # Esc to clear search results
          "<esc>" = ":noh<CR>";

          # fix Y behaviour
          Y = "y$";

          # show diagnosis
          "<leader>sd" = ":lua vim.diagnostic.open_float()<CR>";

          # back and fourth between the two most recent files
          "<C-c>" = ":b#<CR>";

          # navigate windows
          "<leader>h" = "<C-w>h";
          "<leader>j" = "<C-w>j";
          "<leader>k" = "<C-w>k";
          "<leader>l" = "<C-w>l";

          # resize with arrows
          "<C-Up>" = ":resize -2<CR>";
          "<C-Down>" = ":resize +2<CR>";
          "<C-Left>" = ":vertical resize +2<CR>";
          "<C-Right>" = ":vertical resize -2<CR>";
          
          # dap
          # "<F5>" =  ":lua require'dap'.continue()<CR>";
          # "<F10>" = ":lua require'dap'.step_over()<CR>";
          # "<F11>" = ":lua require'dap'.step_into()<CR>";
          # "<F12>" = ":lua require'dap'.step_out()<CR>";
          # "<Leader>b" = ":lua require'dap'.toggle_breakpoint()<CR>";
          # "<Leader>B" = ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>";
          # "<Leader>lp" = ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>";
          # "<Leader>dr" = ":lua require'dap'.repl.open()<CR>";
          # "<Leader>dl" = ":lua require'dap'.run_last()<CR>";

          # picker
          "<leader>ff" = ":lua Snacks.picker.files()<CR>";
          "<leader>fg" = ":lua Snacks.picker.grep()<CR>";
          "<leader>fm" = ":lua Snacks.picker.marks()<CR>";
          "<leader>cc" = ":lua Snacks.picker.colorschemes()<CR>";

        };
      visual =
        lib.mapAttrsToList
        (key: action: {
          mode = "v";
          inherit action key;
        })
        {
          # move selected line / block of text in visual mode
          "K" = ":m '<-2<CR>gv=gv";
          "J" = ":m '>+1<CR>gv=gv";
        };
    in
      config.lib.nixvim.keymaps.mkKeymaps
      {options.silent = true;}
      (normal ++ visual);
  };
}
