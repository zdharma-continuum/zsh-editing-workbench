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

autoload zew-backward-kill-shell-word zew-transpose-shell-words select-word-style

# Below are configured:
# 1. Alt-w to kill a shell word
# 2. Alt-t to transpose shell words
# 3. Alt-m to copy previous shell word
# 4. Ctrl-W to kill word according to configured style
# 5. Alt-r to transpose words according to configured style
# 6. Alt-/ to complete word from history

# Alt-w to kill a shell word
zle -N zew-backward-kill-shell-word
bindkey '^[w' zew-backward-kill-shell-word

# Alt-t to transpose shell words
zle -N zew-transpose-shell-words
bindkey '^[t' zew-transpose-shell-words

# Alt-m to copy previous shell word
bindkey "^[m" copy-prev-shell-word

# Select chosen word style
[[ "$zew_word_style" = "bash" || "$zew_word_style" = "normal" ||
        "$zew_word_style" = "shell" || "$zew_word_style" = "bash" || 
        "$zew_word_style" = "whitespace" || "$zew_word_style" = "default" ]] || zew_word_style="bash"

select-word-style "$zew_word_style"

# Ctrl-W to kill word according to configured style
bindkey "^W" backward-kill-word

# Alt-r to transpose words according to configured style (cursor needs to be placed on beginning of word to swap)
autoload transpose-words-match
zle -N transpose-words-match
bindkey "^[r" transpose-words-match

# Alt-/ to complete word from history
setopt hist_lex_words
bindkey "^[/" _history-complete-older
zstyle ':completion:*:history-words' remove-all-dups true
zstyle ':completion:*' range 50000:10000 # TODO: from configuration

