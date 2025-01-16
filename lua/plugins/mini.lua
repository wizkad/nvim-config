return {
	-- Surround words plugin
	-- Add/delete/replace surroundings (brackets, quotes, etc.)
	-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
	-- - sd'   - [S]urround [D]elete [']quotes
	-- - sr)'  - [S]urround [R]eplace [)] [']
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.surround").setup()
    end,
  },
}
