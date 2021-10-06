#! zsh
# Important key bindings
bindkey -e  # Emacs style bindings!!
bindkey '^R' history-incremental-search-backward

bindkey '^p' up-line-or-search # Up arrow
bindkey '^n' down-line-or-search # Down arrow
# [autosuggestions] (history conflict with zsh hints, not recommanded)
# bindkey '^e' autosuggest-accept # [Essential] Ctrl+e to confirm hint
bindkey "^[[1;5D" backward-word  # ctrl-left
bindkey "^[[1;5C" forward-word  # ctrl-right
bindkey "^A" vi-beginning-of-line
bindkey "^e" vi-end-of-line
bindkey "^k" backward-kill-line
# Conflict with fzf ---> (Allow ctrl-a ctrl-e to jump to the head/tail of the line)
# bindkey -e

# my_script_widget() {history 1000 |fzf}
# zle -N my_script_widget
# bindkey '^R' my_script_widget

# =========BACKWARD DELETE WORD============
# my-backward-delete-word() {
#     #REF: https://unix.stackexchange.com/questions/48577/modifying-the-zsh-shell-word-split
#     local WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'  # without /
#     zle backward-delete-word
# }
# zle -N my-backward-delete-word
# bindkey '^W' my-backward-delete-word
# REF: https://unix.stackexchange.com/questions/258656/how-can-i-have-two-keystrokes-to-delete-to-either-a-slash-or-a-word-in-zsh/258661#258661?newreg=88e4a4681c1c41e382f07df47688f34f
autoload -U select-word-style
select-word-style bash


# REF: https://newbedev.com/list-of-zsh-bindkey-commands
# LIST OF ALL "zle" commands to be binded
# $ zle -al
#   .accept-and-hold
#   .accept-and-infer-next-history
#   .accept-and-menu-complete
#   .accept-line
#   .accept-line-and-down-history
#   .accept-search
#   .argument-base
#   .auto-suffix-remove
#   .auto-suffix-retain
#   .backward-char
#   .backward-delete-char
#   .backward-delete-word
#   .backward-kill-line
#   .backward-kill-word
#   .backward-word
#   .beep
#   .beginning-of-buffer-or-history
#   .beginning-of-history
#   .beginning-of-line
#   .beginning-of-line-hist
#   .bracketed-paste
#   .capitalize-word
#   .clear-screen
#   .complete-word
#   .copy-prev-shell-word
#   .copy-prev-word
#   .copy-region-as-kill
#   .deactivate-region
#   .delete-char
#   .delete-char-or-list
#   .delete-word
#   .describe-key-briefly
#   .digit-argument
#   .down-case-word
#   .down-history
#   .down-line
#   .down-line-or-history
#   .down-line-or-search
#   .emacs-backward-word
#   .emacs-forward-word
#   .end-of-buffer-or-history
#   .end-of-history
#   .end-of-line
#   .end-of-line-hist
#   .end-of-list
#   .exchange-point-and-mark
#   .execute-last-named-cmd
#   .execute-named-cmd
#   .expand-cmd-path
#   .expand-history
#   .expand-or-complete
#   .expand-or-complete-prefix
#   .expand-word
#   .forward-char
#   .forward-word
#   .get-line
#   .gosmacs-transpose-chars
#   .history-beginning-search-backward
#   .history-beginning-search-forward
#   .history-incremental-pattern-search-backward
#   .history-incremental-pattern-search-forward
#   .history-incremental-search-backward
#   .history-incremental-search-forward
#   .history-search-backward
#   .history-search-forward
#   .infer-next-history
#   .insert-last-word
#   .kill-buffer
#   .kill-line
#   .kill-region
#   .kill-whole-line
#   .kill-word
#   .list-choices
#   .list-expand
#   .magic-space
#   .menu-complete
#   .menu-expand-or-complete
#   .neg-argument
#   .overwrite-mode
#   .pound-insert
#   .push-input
#   .push-line
#   .push-line-or-edit
#   .put-replace-selection
#   .quote-line
#   .quote-region
#   .quoted-insert
#   .read-command
#   .recursive-edit
#   .redisplay
#   .redo
#   .reset-prompt
#   .reverse-menu-complete
#   .run-help
#   .select-a-blank-word
#   .select-a-shell-word
#   .select-a-word
#   .select-in-blank-word
#   .select-in-shell-word
#   .select-in-word
#   .self-insert
#   .self-insert-unmeta
#   .send-break
#   .set-local-history
#   .set-mark-command
#   .spell-word
#   .split-undo
#   .transpose-chars
#   .transpose-words
#   .undefined-key
#   .undo
#   .universal-argument
#   .up-case-word
#   .up-history
#   .up-line
#   .up-line-or-history
#   .up-line-or-search
#   .vi-add-eol
#   .vi-add-next
#   .vi-backward-blank-word
#   .vi-backward-blank-word-end
#   .vi-backward-char
#   .vi-backward-delete-char
#   .vi-backward-kill-word
#   .vi-backward-word
#   .vi-backward-word-end
#   .vi-beginning-of-line
#   .vi-caps-lock-panic
#   .vi-change
#   .vi-change-eol
#   .vi-change-whole-line
#   .vi-cmd-mode
#   .vi-delete
#   .vi-delete-char
#   .vi-digit-or-beginning-of-line
#   .vi-down-case
#   .vi-down-line-or-history
#   .vi-end-of-line
#   .vi-fetch-history
#   .vi-find-next-char
#   .vi-find-next-char-skip
#   .vi-find-prev-char
#   .vi-find-prev-char-skip
#   .vi-first-non-blank
#   .vi-forward-blank-word
#   .vi-forward-blank-word-end
#   .vi-forward-char
#   .vi-forward-word
#   .vi-forward-word-end
#   .vi-goto-column
#   .vi-goto-mark
#   .vi-goto-mark-line
#   .vi-history-search-backward
#   .vi-history-search-forward
#   .vi-indent
#   .vi-insert
#   .vi-insert-bol
#   .vi-join
#   .vi-kill-eol
#   .vi-kill-line
#   .vi-match-bracket
#   .vi-open-line-above
#   .vi-open-line-below
#   .vi-oper-swap-case
#   .vi-pound-insert
#   .vi-put-after
#   .vi-put-before
#   .vi-quoted-insert
#   .vi-repeat-change
#   .vi-repeat-find
#   .vi-repeat-search
#   .vi-replace
#   .vi-replace-chars
#   .vi-rev-repeat-find
#   .vi-rev-repeat-search
#   .vi-set-buffer
#   .vi-set-mark
#   .vi-substitute
#   .vi-swap-case
#   .vi-undo-change
#   .vi-unindent
#   .vi-up-case
#   .vi-up-line-or-history
#   .vi-yank
#   .vi-yank-eol
#   .vi-yank-whole-line
#   .visual-line-mode
#   .visual-mode
#   .what-cursor-position
#   .where-is
#   .which-command
#   .yank
#   .yank-pop
#   accept-and-hold
#   accept-and-infer-next-history
#   accept-and-menu-complete
#   accept-line
#   accept-line-and-down-history
#   accept-search
#   argument-base
#   auto-suffix-remove
#   auto-suffix-retain
#   autosuggest-accept
#   autosuggest-clear
#   autosuggest-disable
#   autosuggest-enable
#   autosuggest-execute
#   autosuggest-fetch
#   autosuggest-orig-1-accept-and-hold
#   autosuggest-orig-1-accept-and-infer-next-history
#   autosuggest-orig-1-accept-and-menu-complete
#   autosuggest-orig-1-accept-line
#   autosuggest-orig-1-accept-line-and-down-history
#   autosuggest-orig-1-accept-search
#   autosuggest-orig-1-argument-base
#   autosuggest-orig-1-auto-suffix-remove
#   autosuggest-orig-1-auto-suffix-retain
#   autosuggest-orig-1-backward-char
#   autosuggest-orig-1-backward-delete-char
#   autosuggest-orig-1-backward-delete-word
#   autosuggest-orig-1-backward-kill-line
#   autosuggest-orig-1-backward-kill-word
#   autosuggest-orig-1-backward-word
#   autosuggest-orig-1-beginning-of-buffer-or-history
#   autosuggest-orig-1-beginning-of-history
#   autosuggest-orig-1-beginning-of-line
#   autosuggest-orig-1-beginning-of-line-hist
#   autosuggest-orig-1-bracketed-paste
#   autosuggest-orig-1-capitalize-word
#   autosuggest-orig-1-clear-screen
#   autosuggest-orig-1-complete-word
#   autosuggest-orig-1-copy-prev-shell-word
#   autosuggest-orig-1-copy-prev-word
#   autosuggest-orig-1-copy-region-as-kill
#   autosuggest-orig-1-deactivate-region
#   autosuggest-orig-1-delete-char
#   autosuggest-orig-1-delete-char-or-list
#   autosuggest-orig-1-delete-word
#   autosuggest-orig-1-describe-key-briefly
#   autosuggest-orig-1-digit-argument
#   autosuggest-orig-1-down-case-word
#   autosuggest-orig-1-down-history
#   autosuggest-orig-1-down-line
#   autosuggest-orig-1-down-line-or-history
#   autosuggest-orig-1-down-line-or-search
#   autosuggest-orig-1-emacs-backward-word
#   autosuggest-orig-1-emacs-forward-word
#   autosuggest-orig-1-end-of-buffer-or-history
#   autosuggest-orig-1-end-of-history
#   autosuggest-orig-1-end-of-line
#   autosuggest-orig-1-end-of-line-hist
#   autosuggest-orig-1-end-of-list
#   autosuggest-orig-1-exchange-point-and-mark
#   autosuggest-orig-1-execute-last-named-cmd
#   autosuggest-orig-1-execute-named-cmd
#   autosuggest-orig-1-expand-cmd-path
#   autosuggest-orig-1-expand-history
#   autosuggest-orig-1-expand-or-complete
#   autosuggest-orig-1-expand-or-complete-prefix
#   autosuggest-orig-1-expand-word
#   autosuggest-orig-1-forward-char
#   autosuggest-orig-1-forward-word
#   autosuggest-orig-1-fzf-cd-widget
#   autosuggest-orig-1-fzf-completion
#   autosuggest-orig-1-fzf-file-widget
#   autosuggest-orig-1-fzf-history-widget
#   autosuggest-orig-1-get-line
#   autosuggest-orig-1-gosmacs-transpose-chars
#   autosuggest-orig-1-history-beginning-search-backward
#   autosuggest-orig-1-history-beginning-search-forward
#   autosuggest-orig-1-history-incremental-pattern-search-backward
#   autosuggest-orig-1-history-incremental-pattern-search-forward
#   autosuggest-orig-1-history-incremental-search-backward
#   autosuggest-orig-1-history-incremental-search-forward
#   autosuggest-orig-1-history-search-backward
#   autosuggest-orig-1-history-search-forward
#   autosuggest-orig-1-infer-next-history
#   autosuggest-orig-1-insert-last-word
#   autosuggest-orig-1-kill-buffer
#   autosuggest-orig-1-kill-line
#   autosuggest-orig-1-kill-region
#   autosuggest-orig-1-kill-whole-line
#   autosuggest-orig-1-kill-word
#   autosuggest-orig-1-list-choices
#   autosuggest-orig-1-list-expand
#   autosuggest-orig-1-magic-space
#   autosuggest-orig-1-menu-complete
#   autosuggest-orig-1-menu-expand-or-complete
#   autosuggest-orig-1-neg-argument
#   autosuggest-orig-1-overwrite-mode
#   autosuggest-orig-1-pound-insert
#   autosuggest-orig-1-push-input
#   autosuggest-orig-1-push-line
#   autosuggest-orig-1-push-line-or-edit
#   autosuggest-orig-1-put-replace-selection
#   autosuggest-orig-1-quote-line
#   autosuggest-orig-1-quote-region
#   autosuggest-orig-1-quoted-insert
#   autosuggest-orig-1-read-command
#   autosuggest-orig-1-recursive-edit
#   autosuggest-orig-1-redisplay
#   autosuggest-orig-1-redo
#   autosuggest-orig-1-reset-prompt
#   autosuggest-orig-1-reverse-menu-complete
#   autosuggest-orig-1-select-a-blank-word
#   autosuggest-orig-1-select-a-shell-word
#   autosuggest-orig-1-select-a-word
#   autosuggest-orig-1-select-in-blank-word
#   autosuggest-orig-1-select-in-shell-word
#   autosuggest-orig-1-select-in-word
#   autosuggest-orig-1-self-insert
#   autosuggest-orig-1-self-insert-unmeta
#   autosuggest-orig-1-send-break
#   autosuggest-orig-1-set-mark-command
#   autosuggest-orig-1-spell-word
#   autosuggest-orig-1-split-undo
#   autosuggest-orig-1-transpose-chars
#   autosuggest-orig-1-transpose-words
#   autosuggest-orig-1-undefined-key
#   autosuggest-orig-1-undo
#   autosuggest-orig-1-universal-argument
#   autosuggest-orig-1-up-case-word
#   autosuggest-orig-1-up-history
#   autosuggest-orig-1-up-line
#   autosuggest-orig-1-up-line-or-history
#   autosuggest-orig-1-up-line-or-search
#   autosuggest-orig-1-vi-add-eol
#   autosuggest-orig-1-vi-add-next
#   autosuggest-orig-1-vi-backward-blank-word
#   autosuggest-orig-1-vi-backward-blank-word-end
#   autosuggest-orig-1-vi-backward-char
#   autosuggest-orig-1-vi-backward-delete-char
#   autosuggest-orig-1-vi-backward-kill-word
#   autosuggest-orig-1-vi-backward-word
#   autosuggest-orig-1-vi-backward-word-end
#   autosuggest-orig-1-vi-beginning-of-line
#   autosuggest-orig-1-vi-caps-lock-panic
#   autosuggest-orig-1-vi-change
#   autosuggest-orig-1-vi-change-eol
#   autosuggest-orig-1-vi-change-whole-line
#   autosuggest-orig-1-vi-cmd-mode
#   autosuggest-orig-1-vi-delete
#   autosuggest-orig-1-vi-delete-char
#   autosuggest-orig-1-vi-digit-or-beginning-of-line
#   autosuggest-orig-1-vi-down-case
#   autosuggest-orig-1-vi-down-line-or-history
#   autosuggest-orig-1-vi-end-of-line
#   autosuggest-orig-1-vi-fetch-history
#   autosuggest-orig-1-vi-find-next-char
#   autosuggest-orig-1-vi-find-next-char-skip
#   autosuggest-orig-1-vi-find-prev-char
#   autosuggest-orig-1-vi-find-prev-char-skip
#   autosuggest-orig-1-vi-first-non-blank
#   autosuggest-orig-1-vi-forward-blank-word
#   autosuggest-orig-1-vi-forward-blank-word-end
#   autosuggest-orig-1-vi-forward-char
#   autosuggest-orig-1-vi-forward-word
#   autosuggest-orig-1-vi-forward-word-end
#   autosuggest-orig-1-vi-goto-column
#   autosuggest-orig-1-vi-goto-mark
#   autosuggest-orig-1-vi-goto-mark-line
#   autosuggest-orig-1-vi-history-search-backward
#   autosuggest-orig-1-vi-history-search-forward
#   autosuggest-orig-1-vi-indent
#   autosuggest-orig-1-vi-insert
#   autosuggest-orig-1-vi-insert-bol
#   autosuggest-orig-1-vi-join
#   autosuggest-orig-1-vi-kill-eol
#   autosuggest-orig-1-vi-kill-line
#   autosuggest-orig-1-vi-match-bracket
#   autosuggest-orig-1-vi-open-line-above
#   autosuggest-orig-1-vi-open-line-below
#   autosuggest-orig-1-vi-oper-swap-case
#   autosuggest-orig-1-vi-pound-insert
#   autosuggest-orig-1-vi-put-after
#   autosuggest-orig-1-vi-put-before
#   autosuggest-orig-1-vi-quoted-insert
#   autosuggest-orig-1-vi-repeat-change
#   autosuggest-orig-1-vi-repeat-find
#   autosuggest-orig-1-vi-repeat-search
#   autosuggest-orig-1-vi-replace
#   autosuggest-orig-1-vi-replace-chars
#   autosuggest-orig-1-vi-rev-repeat-find
#   autosuggest-orig-1-vi-rev-repeat-search
#   autosuggest-orig-1-vi-set-buffer
#   autosuggest-orig-1-vi-set-mark
#   autosuggest-orig-1-vi-substitute
#   autosuggest-orig-1-vi-swap-case
#   autosuggest-orig-1-vi-undo-change
#   autosuggest-orig-1-vi-unindent
#   autosuggest-orig-1-vi-up-case
#   autosuggest-orig-1-vi-up-line-or-history
#   autosuggest-orig-1-vi-yank
#   autosuggest-orig-1-vi-yank-eol
#   autosuggest-orig-1-vi-yank-whole-line
#   autosuggest-orig-1-visual-line-mode
#   autosuggest-orig-1-visual-mode
#   autosuggest-orig-1-what-cursor-position
#   autosuggest-orig-1-where-is
#   autosuggest-suggest
#   autosuggest-toggle
#   backward-char
#   backward-delete-char
#   backward-delete-word
#   backward-kill-line
#   backward-kill-word
#   backward-word
#   beep
#   beginning-of-buffer-or-history
#   beginning-of-history
#   beginning-of-line
#   beginning-of-line-hist
#   bracketed-paste
#   capitalize-word
#   clear-screen
#   complete-word
#   copy-prev-shell-word
#   copy-prev-word
#   copy-region-as-kill
#   deactivate-region
#   delete-char
#   delete-char-or-list
#   delete-word
#   describe-key-briefly
#   digit-argument
#   down-case-word
#   down-history
#   down-line
#   down-line-or-history
#   down-line-or-search
#   emacs-backward-word
#   emacs-forward-word
#   end-of-buffer-or-history
#   end-of-history
#   end-of-line
#   end-of-line-hist
#   end-of-list
#   exchange-point-and-mark
#   execute-last-named-cmd
#   execute-named-cmd
#   expand-cmd-path
#   expand-history
#   expand-or-complete
#   expand-or-complete-prefix
#   expand-word
#   forward-char
#   forward-word
#   fzf-cd-widget
#   fzf-completion
#   fzf-file-widget
#   fzf-history-widget
#   get-line
#   gosmacs-transpose-chars
#   history-beginning-search-backward
#   history-beginning-search-forward
#   history-incremental-pattern-search-backward
#   history-incremental-pattern-search-forward
#   history-incremental-search-backward
#   history-incremental-search-forward
#   history-search-backward
#   history-search-forward
#   infer-next-history
#   insert-last-word
#   kill-buffer
#   kill-line
#   kill-region
#   kill-whole-line
#   kill-word
#   list-choices
#   list-expand
#   magic-space
#   menu-complete
#   menu-expand-or-complete
#   neg-argument
#   overwrite-mode
#   pound-insert
#   push-input
#   push-line
#   push-line-or-edit
#   put-replace-selection
#   quote-line
#   quote-region
#   quoted-insert
#   read-command
#   recursive-edit
#   redisplay
#   redo
#   reset-prompt
#   reverse-menu-complete
#   run-help
#   select-a-blank-word
#   select-a-shell-word
#   select-a-word
#   select-in-blank-word
#   select-in-shell-word
#   select-in-word
#   self-insert
#   self-insert-unmeta
#   send-break
#   set-local-history
#   set-mark-command
#   spell-word
#   split-undo
#   transpose-chars
#   transpose-words
#   undefined-key
#   undo
#   universal-argument
#   up-case-word
#   up-history
#   up-line
#   up-line-or-history
#   up-line-or-search
#   vi-add-eol
#   vi-add-next
#   vi-backward-blank-word
#   vi-backward-blank-word-end
#   vi-backward-char
#   vi-backward-delete-char
#   vi-backward-kill-word
#   vi-backward-word
#   vi-backward-word-end
#   vi-beginning-of-line
#   vi-caps-lock-panic
#   vi-change
#   vi-change-eol
#   vi-change-whole-line
#   vi-cmd-mode
#   vi-delete
#   vi-delete-char
#   vi-digit-or-beginning-of-line
#   vi-down-case
#   vi-down-line-or-history
#   vi-end-of-line
#   vi-fetch-history
#   vi-find-next-char
#   vi-find-next-char-skip
#   vi-find-prev-char
#   vi-find-prev-char-skip
#   vi-first-non-blank
#   vi-forward-blank-word
#   vi-forward-blank-word-end
#   vi-forward-char
#   vi-forward-word
#   vi-forward-word-end
#   vi-goto-column
#   vi-goto-mark
#   vi-goto-mark-line
#   vi-history-search-backward
#   vi-history-search-forward
#   vi-indent
#   vi-insert
#   vi-insert-bol
#   vi-join
#   vi-kill-eol
#   vi-kill-line
#   vi-match-bracket
#   vi-open-line-above
#   vi-open-line-below
#   vi-oper-swap-case
#   vi-pound-insert
#   vi-put-after
#   vi-put-before
#   vi-quoted-insert
#   vi-repeat-change
#   vi-repeat-find
#   vi-repeat-search
#   vi-replace
#   vi-replace-chars
#   vi-rev-repeat-find
#   vi-rev-repeat-search
#   vi-set-buffer
#   vi-set-mark
#   vi-substitute
#   vi-swap-case
#   vi-undo-change
#   vi-unindent
#   vi-up-case
#   vi-up-line-or-history
#   vi-yank
#   vi-yank-eol
#   vi-yank-whole-line
#   visual-line-mode
#   visual-mode
#   what-cursor-position
#   where-is
#   which-command
#   yank
#   yank-pop
#   zle-isearch-update
#   zle-line-finish
