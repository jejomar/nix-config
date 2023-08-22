{ pkgs, ...}: {
  programs.neovim = {
    enable = true;

    extraLuaConfig = ''
      -- Set leader key
      vim.g.mapleader = " "

      -- Better colors
      vim.opt.termguicolors = true;

      -- Line numbers
      vim.opt.number = true
      vim.opt.relativenumber = true;

      -- Indentation
      vim.opt.tabstop = 4
      vim.opt.softtabstop = 4
      vim.opt.shiftwidth = 4
      vim.opt.expandtab = true
      vim.opt.smartindent = true

      -- Searching
      vim.opt.hlsearch = false
      vim.opt.incsearch = true
    '';

    extraConfig = ''
      colorscheme rose-pine
    '';

    plugins = with pkgs.vimPlugins; [
      # Colorscheme
      rose-pine

      # Autodetect indentation
      vim-sleuth

      # Statusline
      {
        plugin = lualine-nvim;
	config = ''
	  lua require 'lualine'.setup()
	'';
      }
    ];
  };
}
