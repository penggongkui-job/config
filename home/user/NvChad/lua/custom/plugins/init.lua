return {
  ["goolord/alpha-nvim"] = {
    disable = false,
    config = function ()
      require'alpha'.setup(require'alpha.themes.theta'.config)
    end,
  },
  ["Vimjas/vim-python-pep8-indent"] = {},
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
  ["lukas-reineke/lsp-format.nvim"] = {
    config = function ()
      require "custom.plugins.lsp_format"
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
      renderer = {
        symlink_destination = false,
      },
      live_filter = {
        always_show_folders = false,
      },
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
  ["williamboman/mason.nvim"] = {
    override_options = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- shell
        "shfmt",
        "shellcheck",

        --python
        "pyright",
        "black",
        "isort",
      },
    },
  },
}
