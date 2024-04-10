-- nmap <leader>gs :G<cr>
-- nmap <leader>gp :Git push<CR>
-- nmap <leader>gc :Git commitf<CR>
-- nmap <leader>gh <Plug>(GitGutterPreviewHunk)
-- nmap <leader>ga <Plug>(GitGutterStageHunk)
-- nmap <leader>gu <Plug>(GitGutterUndoHunk)
-- " Git log
-- nmap <leader>gl :GV<cr>
-- nmap <leader>glf :GV!<cr>
-- nmap <leader>glb :GV --first-parent<cr>
return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gs', '<Cmd>:G<CR>', { desc = '[G]it [S]atus' })
      vim.keymap.set('n', '<leader>gp', '<Cmd>:Git push<CR>', { desc = '[G]it [P]ush' })
      vim.keymap.set('n', '<leader>gc', '<Cmd>:Git commit<CR>', { desc = '[G]it [C]ommit' })
    end,
  },
  {
    'junegunn/gv.vim',
    dependencies = {
      'tpope/vim-fugitive',
    },
    config = function()
      vim.keymap.set('n', '<leader>gl.', '<Cmd>:GV<CR>', { desc = '[G]it [L]og' })
      vim.keymap.set('n', '<leader>glf', '<Cmd>:GV!<CR>', { desc = '[G]it [L]og current [F]ile' })
      vim.keymap.set('n', '<leader>glb', '<Cmd>:GV --first-parent<CR>', { desc = '[G]it [L]og current [B]ranch' })
    end,
    -- nmap <leader>gl :GV<cr>
    -- nmap <leader>glf :GV!<cr>
    -- nmap <leader>glb :GV --first-parent<cr>
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '┃' },
        change = { text = '┃' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '┆' },
      },
      current_line_blame = false,
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end
        -- Navigation

        -- Navigation
        map('n', ']h', function()
          if vim.wo.diff then
            vim.cmd.normal { ']h', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Go to Next [H]unk' })

        map('n', '[h', function()
          if vim.wo.diff then
            vim.cmd.normal { '[h', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Go to Prev [H]unk' })

        map('n', '<leader>ga', gitsigns.stage_hunk)
        map('v', '<leader>ga', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end)
        map('n', '<leader>gA', gitsigns.undo_stage_hunk)
        map('n', '<leader>gu', gitsigns.reset_hunk)
        map('v', '<leader>gu', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end)
        map('n', '<leader>gp', gitsigns.preview_hunk)
        map('n', '<leader>gb', function()
          gitsigns.blame_line { full = true }
        end)
        map('n', '<leader>gd', gitsigns.diffthis)
        -- map('n', '<leader>gS', gitsigns.stage_buffer)
        -- map('n', '<leader>gR', gitsigns.reset_buffer)
        -- map('n', '<leader>gD', function()
        --   gitsigns.diffthis '~'
        -- end)
        -- map('n', '<leader>td', gitsigns.toggle_deleted)
      end,
    },
  },
}
