-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'ThePrimeagen/vim-be-good' },
  { 'github/copilot.vim' },
  { 'janko-m/vim-test' },
  { 'alx741/vim-rustfmt' },
  { 'tpope/vim-abolish' },
  { 'adelarsq/vim-matchit' },
  { 'AndrewRadev/tagalong.vim' },
  { 'kburdett/vim-nuuid' },
  { 'vim-scripts/ReplaceWithRegister' },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    opts = {
      enable_check_bracket_line = true,
    },
  },
}
