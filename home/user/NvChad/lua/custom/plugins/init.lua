return {
  ["Vimjas/vim-python-pep8-indent"] = {},
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
  ["lukas-reineke/lsp-format.nvim"] = {
    config = function ()
      require "custom.plugins.lsp-format"
    end
  },
  ["neovim/nvim-lspconfig"] = {
    after = "lsp-format.nvim",
    config = function()
      require "custom.plugins.lspconfig"
    end,
  },
  ["NvChad/ui"] = {
  override_options = {
    statusline = {
        separator_style = "arrow",
      },
    },
  },
  ["kyazdani42/nvim-tree.lua"] = {
    event = "VimEnter",
    override_options = {
      filters = {
        dotfiles = true,
        custom = {"__pycache__"},
      },
      open_on_setup = true,
    }
  },
  ["tpope/vim-fugitive"] = {},
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = {
      indent = {
        disable = {"python"},
      },
    },
  },
}
