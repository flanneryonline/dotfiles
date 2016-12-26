# $FreeBSD: releng/10.3/etc/root/dot.cshrc 243893 2012-12-05 13:56:39Z eadler $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
#

alias h         history 25
alias j         jobs -l
alias la        ls -aF
alias lf        ls -FA
alias ll        ls -lAF

# A righteous umask
umask 22

set path = (/sbin /bin /usr/sbin /usr/bin /usr/local/sbin /usr/local/bin)

setenv  EDITOR  vi
setenv  PAGER   more
setenv  BLOCKSIZE       K

if ($?prompt) then
        # An interactive shell -- set some stuff up
        set prompt = "%N@%m:%~ %# "
        set promptchars = "%#"

        set filec
        set history = 1000
        set savehist = (1000 merge)
        set autolist = ambiguous
        # Use history to aid expansion
        set autoexpand
        set autorehash
        set mail = (/var/mail/$USER)
        if ( $?tcsh ) then
                bindkey "^W" backward-delete-word
                bindkey -k up history-search-backward
                bindkey -k down history-search-forward
        endif

endif

# Decrease likelihood of filesystem metadata corruption on [CF,SD,USB]
# persistent media by setting '-o noatime'.
alias mountrw   mount -o noatime -uw

#Bind Delete, Home, End and Insert keys
if ($?tcsh && $?prompt) then
bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[7~" beginning-of-line # Home rxvt
bindkey "\e[2~" overwrite-mode # Ins
bindkey "\e[3~" delete-char # Delete
bindkey "\e[4~" end-of-line # End
bindkey "\e[8~" end-of-line # End rxvt
endif
