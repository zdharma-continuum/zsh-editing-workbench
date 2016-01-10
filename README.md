![zew logo](http://imageshack.com/a/img633/9660/teMNig.png)

# Zsh Editing Workbench

Zsh Editing Workbench in action:
![zew](http://imageshack.com/a/img911/7091/wJKRAk.gif)

## Installation With Zgen

Add `zgen load psprint/zsh-editing-workbench` to `.zshrc` and issue a `zgen reset` (this assumes that there is a proper `zgen save` construct in `.zshrc`).
The config files will be available in `~/.config/zew`.

## Installation With Antigen
Add `antigen bundle psprint/zsh-editing-workbench` to `.zshrc`. There also
should be `antigen apply`. The config files will be in `~/.config/znt`.

## Single File Manual Installation

Running script `doc/generate_single_file` will create single-file version of `ZEW`.
It can be sourced from `.zshrc`. Don't forget about configuration files (copy them to `~/.config/zew`).

## Introduction

