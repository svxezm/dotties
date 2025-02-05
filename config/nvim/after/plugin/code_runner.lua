require('code_runner').setup({
    filetype = {
        python = "python3 -u",
        typescript = "bun run",
        javascript = "bun run",
        cs = "dotnet run",
        c = {
            "cd $dir &&",
            "gcc $fileName -o $fileNameWithoutExt &&",
            "$dir/$fileNameWithoutExt",
        },
        cpp = {
            "cd $dir &&",
            "/usr/bin/g++ -std=c++23 -o $dir/$fileNameWithoutExt $fileName &&",
            "$dir/$fileNameWithoutExt",
        },
        sh = "bash",
        ruby = "ruby",
        rust = {
            "cd $dir &&",
            "cargo $fileName &&",
            "$dir/$fileNameWithoutExt",
        },
    },
})

-- Add your key mappings
vim.keymap.set('n', '<leader>r', ':w<CR>:RunCode<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })
-- Run rust project
vim.keymap.set('n', '<leader>cr', ':w<CR>:botright split | resize 10 | terminal cd $(dirname $(find . -name Cargo.toml)) && cargo run<CR>', { noremap = true, silent = true })
