return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "yaml" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "b0o/SchemaStore.nvim",
      version = false, -- last release is way too old
    },
    opts = {
      -- make sure mason installs the server
      ---@type lspconfig.options
      servers = {
        yamlls = {
          capabilities = {
            textDocument = {
              foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
              },
            },
          },
          -- lazy-load schemastore when needed
          on_new_config = function(new_config)
            new_config.settings.yaml.schemas = new_config.settings.yaml.schemas or {}
            vim.list_extend(new_config.settings.yaml.schemas, require("schemastore").yaml.schemas())
          end,
          settings = {
            yaml = {
              format = {
                enable = true,
                singleQuote = false,
              },
              hover = true,
              validate = true,
              keyOrdering = false,
              customTags = {
                "!And scalar",
                "!If scalar",
                "!If sequence",
                "!Not",
                "!Not sequence",
                "!Equals scalar",
                "!Equals sequence",
                "!Or scalar",
                "!FindInMap scalar",
                "!FindInMap sequence",
                "!Base64",
                "!Cidr",
                "!Ref",
                "!Sub",
                "!GetAtt scalar",
                "!GetAtt sequence",
                "!GetAZs",
                "!ImportValue sequence",
                "!Select sequence",
                "!Split sequence",
                "!Join sequence",
              },
              schemas = {
                ["https://s3.amazonaws.com/cfn-resource-specifications-us-east-1-prod/schemas/2.15.0/all-spec.json"] = "*-cfn.{yml,yaml}",
              },
            },
          },
        },
      },
    },
  },
}
