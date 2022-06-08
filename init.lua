local config = {

  -- Set colorscheme
  colorscheme = "default_theme",
  -- colorscheme = "nightfox",
  -- colorscheme = "dayfox",
  -- colorscheme = "catppuccin",

  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
      relativenumber = false, -- sets vim.opt.relativenumber
      cursorcolumn = true,
      -- guifontwide = "Microsoft Yahei:h12:cANSI",
      -- guifontwide = "Microsoft Yahei Mono:h12:cANSI",
      guifont = "FiraCode Nerd Font Mono:h11:cANSI",
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader

      -- for neovide
      neovide_transparency = 0.95,
      -- neovide_cursor_vfx_mode = "wireframe"
      -- neovide_cursor_vfx_mode = "ripple"
      -- neovide_cursor_vfx_mode = "sonicboom"
      -- neovide_cursor_vfx_mode = "pixiedust"
      -- neovide_cursor_vfx_mode = "torpedo"
      neovide_cursor_vfx_mode = "railgun",
      neovide_cursor_vfx_particle_density = 10,

    },
  },

  -- Default theme configuration
  default_theme = {
    diagnostics_style = { italic = true },
    -- Modify the color table
    colors = {
      fg = "#abb2bf",
    },
    -- Modify the highlight groups
    highlights = function(highlights)
      local C = require "default_theme.colors"

      highlights.Normal = { fg = C.fg, bg = C.bg }
      return highlights
    end,
  },

  -- NvChad Telescope Theme on default_theme
  -- default_theme = {
  --     colors = function(C)
  --       C.telescope_green = C.green
  --       C.telescope_red = C.red
  --       C.telescope_fg = C.fg
  --       C.telescope_bg = C.black_1
  --       C.telescope_bg_alt = C.bg_1
  --       return C
  --     end,
  --     highlights = function(hl)
  --       local C = require "default_theme.colors"
  --       hl.TelescopeBorder = { fg = C.telescope_bg_alt, bg = C.telescope_bg }
  --       hl.TelescopeNormal = { bg = C.telescope_bg }
  --       hl.TelescopePreviewBorder = { fg = C.telescope_bg, bg = C.telescope_bg }
  --       hl.TelescopePreviewNormal = { bg = C.telescope_bg }
  --       hl.TelescopePreviewTitle = { fg = C.telescope_bg, bg = C.telescope_green }
  --       hl.TelescopePromptBorder = { fg = C.telescope_bg_alt, bg = C.telescope_bg_alt }
  --       hl.TelescopePromptNormal = { fg = C.telescope_fg, bg = C.telescope_bg_alt }
  --       hl.TelescopePromptPrefix = { fg = C.telescope_red, bg = C.telescope_bg_alt }
  --       hl.TelescopePromptTitle = { fg = C.telescope_bg, bg = C.telescope_red }
  --       hl.TelescopeResultsBorder = { fg = C.telescope_bg, bg = C.telescope_bg }
  --       hl.TelescopeResultsNormal = { bg = C.telescope_bg }
  --       hl.TelescopeResultsTitle = { fg = C.telescope_bg, bg = C.telescope_bg }
  --       return hl
  --     end,
  --   },

  -- Disable AstroNvim ui features
  ui = {
    nui_input = true,
    telescope_select = true,
  },

  -- Configure plugins
  plugins = {
    -- Add plugins, the packer syntax without the "use"
    init = {
      -- You can disable default plugins as follows:
      -- ["goolord/alpha-nvim"] = { disable = false },

      -- You can also add new plugins here as well:
      -- { "andweeb/presence.nvim" },
      -- {
      --   "ray-x/lsp_signature.nvim",
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },

      {
        "EdenEast/nightfox.nvim",
        config = function()
          require("nightfox").setup {
                      -- disable extra plugins that AstroNvim doesn't use (this is optional)
                      modules = { 
                        barbar = false,
                        dashboard = false,
                        fern = false,
                        fidget = false,
                        gitgutter = false,
                        glyph_palette = false,
                        illuminate = false,
                        lightspeed = false,
                        lsp_saga = false,
                        lsp_trouble = false,
                        modes = false,
                        neogit = false,
                        nvimtree = false,
                        pounce = false,
                        sneak = false,
                        symbols_outline = false,
                      },
                      groups = {
                        all = {
                          -- add highlight group for AstroNvim's built in URL highlighting
                          HighlightURL = { style = "underline" },
                        },
                      },
                    }
        end,
      },
      {
        "catppuccin/nvim",
	      as = "catppuccin",
	      config = function ()
          -- vim.opt.background = "dark"
	      end,
      },

      -- status line

      -- {
      --   "windwp/windline.nvim",
      --   config = function()
      --     require("user.windline")
      --   end,
      -- },

    },

    -- All other entries override the setup() call for default plugins
    treesitter = {
      ensure_installed = { "lua" },
    },
    ["nvim-lsp-installer"] = {
      ensure_installed = { "sumneko_lua" },
    },
    packer = {
      compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    },
  },

  -- LuaSnip Options
  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    -- Extend filetypes
    filetype_extend = {
      javascript = { "javascriptreact" },
    },
  },

  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings
    register_mappings = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- which-key registration table for normal mode, leader prefix
          -- ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
        },
      },
    },
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without lsp-installer
    servers = {
      -- "pyright"
    },
    -- add to the server on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the lsp installer server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server.name].setup(opts)
    -- end

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = {
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({}))
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  -- null-ls configuration
  ["null-ls"] = function()
    -- Formatting and linting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim
    local status_ok, null_ls = pcall(require, "null-ls")
    if not status_ok then
      return
    end

    -- Check supported formatters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    local formatting = null_ls.builtins.formatting

    -- Check supported linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup {
      debug = false,
      sources = {
        -- Set a formatter
        formatting.rufo,
        -- Set a linter
        diagnostics.rubocop,
      },
      -- NOTE: You can remove this on attach function to disable format on save
      on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = vim.lsp.buf.formatting_sync,
          })
        end
      end,
    }
  end,

  -- This function is run last
  -- good place to configure mappings and vim options
  polish = function()
    -- Set key bindings
    vim.keymap.set("n", "<C-s>", ":w!<CR>")

    -- Set autocommands
    vim.api.nvim_create_augroup("packer_conf", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Sync packer after modifying plugins.lua",
      group = "packer_conf",
      pattern = "plugins.lua",
      command = "source <afile> | PackerSync",
    })

    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }

  end,
}

return config
