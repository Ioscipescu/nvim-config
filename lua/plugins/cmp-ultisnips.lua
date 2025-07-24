return {
  {
    "quangnguyen30192/cmp-nvim-ultisnips",
    dependencies = { "SirVer/ultisnips" },
    config = function()
      local cmp = require "cmp"
      local cmp_ultisnips_mappings = require "cmp_nvim_ultisnips.mappings"
      cmp.setup {
        snippet = {
          expand = function(args) vim.fn["UltiSnips#Anon"](args.body) end,
        },
        sources = cmp.config.sources {
          { name = "ultisnips" },
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "buffer" },
          -- other sources like buffer, path, etc.
        },
        mapping = {
          ["<Tab>"] = cmp.mapping(function(fallback) cmp_ultisnips_mappings.expand_or_jump_forwards(fallback) end, {
            "i",
            "s", --[[ "c" (to enable the mapping in command mode) ]]
          }),
          ["<S-Tab>"] = cmp.mapping(function(fallback) cmp_ultisnips_mappings.jump_backwards(fallback) end, {
            "i",
            "s", --[[ "c" (to enable the mapping in command mode) ]]
          }),
        },
      }
    end,
  },
}
