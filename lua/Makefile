install-lsp:
	# brew install lua-language-server
	[ -x $(command -v nvim) ] && nvim +"LspInstall sumneko_lua" ||true


install-lua:
	brew install lua luarocks
	arch -x86_64 /usr/local/bin/brew install luajit
	luarocks path


install-lib:
	luarocks install inspect
	luarocks install penlight
	#luarocks install --server=https://luarocks.org/dev ldt
	luarocks install debugger
	luarocks install lua-cjson 2.0.0


install: install-lsp install-lua install-lib
	print('OK.')
