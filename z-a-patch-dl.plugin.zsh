#!/usr/bin/env zsh
#
# In accordance with the Zsh Plugin Standard
# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html
#

0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

autoload -Uz za-patch-dl-handler

# An empty stub to fill the help handler fields
za-patch-dl-help-null-handler() { :; }

# Register !atclone hook
@zinit-register-annex "zinit-annex-patch-dl" \
    hook:\!atclone-20 \
    za-patch-dl-handler \
    za-patch-dl-help-null-handler \
    "dl''|patch''"

# Register !atpull hook
@zinit-register-annex "zinit-annex-patch-dl" \
    hook:atpull-20 \
    za-patch-dl-handler \
    za-patch-dl-help-null-handler

# vim:ft=zsh:sw=2:sts=2:et
