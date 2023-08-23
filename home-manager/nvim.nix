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

      -- Telescope
      vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
      vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>/', function()
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
	  windblend = 10,
	  previewer = false,
	})
      end, { desc = '[/] Fuzzily search in current buffer' })

      vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
      vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

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

      # Telescope
      plenary-nvim
      telescope-fzf-native-nvim
      {
	plugin = telescope-nvim;
	type = "lua";
	config = ''
	'';
      }
    ];
  };
}
