return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local harpoon = require("harpoon")
    local key = vim.keymap.set

    harpoon:setup()

    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        })
        :find()
    end

    key("n", "<leader>hh", function()
      toggle_telescope(harpoon:list())
    end, { desc = "Open harpoon window" })
    key("n", "<leader>ha", function()
      harpoon:list():append()
    end, { desc = "Add mark to file" })
    key("n", "<leader>hj", function()
      harpoon:list():select(1)
    end, { desc = "Select first file in harpoon" })
    key("n", "<leader>hk", function()
      harpoon:list():select(2)
    end, { desc = "Select second file in harpoon" })
    key("n", "<C-S-P>", function()
      harpoon:list():prev()
    end)
    key("n", "<C-S-N>", function()
      harpoon:list():next()
    end)
  end,
}
