![zew logo](http://imageshack.com/a/img924/5479/AiIW6X.gif)

# Zsh Editing Workbench

Also check out [![ZNT](http://imageshack.com/a/img910/3618/oDHnuR.png) Zsh Navigation Tools](https://github.com/psprint/zsh-navigation-tools)
and [![ZCA](http://imageshack.com/a/img911/8084/qSpO8a.png) Zsh Command Architect](https://github.com/psprint/zsh-cmd-architect)


Incremental history _word_ completing (started with `Alt-h/H` or `Option-h/H` on Mac):

![zew](http://imageshack.com/a/img907/1065/lJmzII.gif)

Swapping, copying, deleting shell words, also undo:

![zew](http://imageshack.com/a/img908/7765/zpdjOK.gif)

## Installation With [Zplugin](https://github.com/psprint/zplugin)

Add `zplugin load psprint/zsh-editing-workbench` to `.zshrc`. The config files will be available in `~/.config/zew`.

## Installation With Zgen

Add `zgen load psprint/zsh-editing-workbench` to `.zshrc` and issue a `zgen reset` (this assumes that there is a proper `zgen save` construct in `.zshrc`).
The config files will be available in `~/.config/zew`.

## Installation With Antigen
Add `antigen bundle psprint/zsh-editing-workbench` to `.zshrc`. There also
should be `antigen apply`. The config files will be in `~/.config/znt`.

## Introduction

Organized shortcuts for various command line editing operations, plus new
operations (e.g. incremental history word completion).

![zew refcard](http://imageshack.com/a/img922/1959/4gXU1R.png)

### Configuring terminals

**XTerm**

To make `Alt` key work like expected under `XTerm` add `XTerm*metaSendsEscape: true` to your resource file, e.g.:

```
echo 'XTerm*metaSendsEscape: true' >> ~/.Xresources
```

