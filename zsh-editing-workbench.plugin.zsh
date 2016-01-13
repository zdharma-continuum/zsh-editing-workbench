#!/usr/bin/env zsh

REPO_DIR="${0%/*}"
CONFIG_DIR="$HOME/.config/zew"

#
# Copy configs
#

if ! test -d "$HOME/.config"; then
    mkdir "$HOME/.config"
fi

if ! test -d "$CONFIG_DIR"; then
    mkdir "$CONFIG_DIR"
fi

set zew.conf

for i; do
    if ! test -f "$CONFIG_DIR/$i"; then
        cp "$REPO_DIR/.config/zew/$i" "$CONFIG_DIR"
    fi
done

#
# Configure Zsh
#

. "$CONFIG_DIR"/zew.conf

autoload -Uz zew-backward-kill-shell-word zew-transpose-shell-words select-word-style zew

# Below are configured:
# 1. Alt-w to kill a shell word
# 2. Alt-t to transpose shell words
# 3. Alt-m to copy previous shell word, or word before that, etc.
# 4. Alt-M to just copy previous shell word
# 5. Alt-. to copy last shell word from previous line, or line before that
# 6. Ctrl-W to kill word according to configured style
# 7. Alt-r to transpose words according to configured style
# 8. Alt-/ to complete word from history
# 9. Ctrl-J to break line
# 10. To undo

# 1. Alt-w to kill a shell word
zle -N zew-backward-kill-shell-word
bindkey '^[w' zew-backward-kill-shell-word

# 2. Alt-t to transpose shell words
zle -N zew-transpose-shell-words
bindkey '^[t' zew-transpose-shell-words

# 3. Alt-m to copy previous shell word, or word before that, etc.
autoload -Uz copy-earlier-word
zle -N copy-earlier-word
bindkey "^[m" copy-earlier-word

# 4. Alt-M to just copy previous shell word
bindkey "^[M" copy-prev-shell-word

# 5. Alt-. to copy last shell word from previous line, or line before that
bindkey "^[." insert-last-word

# Select chosen word style
[[ "$zew_word_style" = "bash" || "$zew_word_style" = "normal" ||
        "$zew_word_style" = "shell" || "$zew_word_style" = "bash" || 
        "$zew_word_style" = "whitespace" || "$zew_word_style" = "default" ]] || zew_word_style="bash"

select-word-style "$zew_word_style"

# 6. Ctrl-W to kill word according to configured style
bindkey "^W" backward-kill-word

# 7. Alt-r to transpose words according to configured style (cursor needs to be placed on beginning of word to swap)
autoload -Uz transpose-words-match
zle -N transpose-words-match
bindkey "^[r" transpose-words-match

# 8. Alt-/ to complete word from history
setopt hist_lex_words
bindkey "^[/" _history-complete-older
zstyle ':completion:history-words:*' remove-all-dups true
zstyle ':completion:history-words:*' sort true
zstyle ':completion:*' range 50000:10000 # TODO: from configuration

# 9. Break line
if [[ "$MC_SID" != "" || "$MC_CONTROL_PID" != "" ]]; then
    bindkey "^J" accept-line
else
    bindkey "^J" self-insert
fi

# 10. Undo
bindkey "^_" undo

#autoload widen_for_history
#zle -N widen_for_history
#zstyle ':completion:*' completer widen_for_history _complete
