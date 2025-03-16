source /usr/share/cachyos-fish-config/cachyos-config.fish

#Alias
alias c='clear'
alias lzg='lazygit'
alias l='ll'
alias chz='chezmoi'

#Yazi
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

#Starship
starship init fish | source

#Add rust
fish_add_path $HOME/.cargo/bin

#GitHub Sign commit
set -gx GPG_TTY (tty)

# overwrite greeting
function fish_greeting
end

#Binds
function fish_user_key_bindings
	bind ctrl-g 'stty sane; lazygit' repaint
	bind ctrl-q 'exit'
end
