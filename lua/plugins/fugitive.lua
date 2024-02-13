return {
	"tpope/vim-fugitive",
	config = function()
		vim.cmd([[
            nnoremap <leader>gs :Git<CR>
            nnoremap <leader>gd :Gdiff<CR>
            nnoremap <leader>gc :Gcommit<CR>
            nnoremap <leader>gb :Gblame<CR>
            nnoremap <leader>gL :Glog<CR>
            nnoremap <leader>gp :Gpush<CR>
            nnoremap <leader>gP :Gpull<CR>
            nnoremap <leader>gS :Gstatus<CR>
            nnoremap <leader>gR :Gread<CR>
            nnoremap <leader>gW :Gwrite<CR>
            nnoremap <leader>gB :Gbrowse<CR>
            nnoremap <leader>gC :Gcommit --amend<CR>
            nnoremap <leader>gD :Gdiffsplit<CR>
            nnoremap <leader>gA :Gwrite \| Gcommit<CR>
            nnoremap <leader>gX :Gvsplit<CR>
            nnoremap <leader>gY :Gsplit<CR>
            nnoremap <leader>gZ :Gvdiffsplit<CR>
            nnoremap <leader>gF :Gfetch<CR>
            nnoremap <leader>gT :Gpull --rebase<CR>
            nnoremap <leader>gU :Gpush --force<CR>
            nnoremap <leader>gI :Gpush<CR>
            nnoremap <leader>gO :Gpop<CR>
            nnoremap <leader>gQ :Gquit<CR>
            nnoremap <leader>gV :GV<CR>
            nnoremap <leader>gM :Gmove<CR>
            nnoremap <leader>gE :Gedit<CR>
            nnoremap <leader>gH :Gedit HEAD<CR>
            nnoremap <leader>gJ :Gedit <C-r><C-w><CR>
        ]])
	end,
}
