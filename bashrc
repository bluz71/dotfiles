# Remove all previous environment defined aliases.
#
unalias -a

# General aliases.
#
alias agm='ag --pager=less'
alias c='clear'
alias cp='/bin/cp -i'
alias dir='ls -l'
alias du='du -b'
alias g=git
# This is required for bash completion to work with the g alias.
complete -o default -o nospace -F _git g
alias gv=gvim
alias gvd=gvimdiff
alias h=history
alias l='ls -l'
alias l1='ls -1'
alias ll='ls -l'
alias lla='ls -la'
alias ls='ls --color -F --si'
alias lss='ls -la --sort=size | less'
alias lst='ls -la --sort=time | less'
alias m='less'
alias meld='meld 2>/dev/null'
alias mv='/bin/mv -i'
alias p='pygmentize -g'
alias psu='ps -u $USER -f'
alias rm='/bin/rm -i'
alias src='. ~/.bashrc'
alias tnew='tmux new -s $(basename $(pwd))'
alias v='stty -ixon && vimx'
alias vd='stty -ixon && vimdiff'
alias x=exit


# General environment variables.
#
export EDITOR=vimx
export LS_COLORS="no=00:fi=00:di=38;5;111:ln=38;5;51:pi=38;5;43:bd=38;5;212:cd=38;5;223:or=30;48;5;202:ow=38;5;203:so=38;5;169:su=36;48;5;63:ex=38;5;156:mi=30;48;5;83:*.exe=38;5;156:*.bat=38;5;156:*.tar=38;5;204:*.tgz=38;5;205:*.tbz2=38;5;205:*.zip=38;5;206:*.7z=38;5;206:*.gz=38;5;205:*.bz2=38;5;205:*.rar=38;5;205:*.rpm=38;5;173:*.jpg=38;5;141:*.png=38;5;147:*.mpg=38;5;151:*.avi=38;5;151:*.mov=38;5;216:*.wmv=38;5;216:*.mp4=38;5;217:*.mkv=38;5;216:*.flac=38;5;222:*.mp3=38;5;218:*akefile=38;5;177:*.pdf=38;5;253:*.ods=38;5;224:*.odt=38;5;146:*.doc=38;5;224:*.xls=38;5;146:*.docx=38;5;224:*.xlsx=38;5;146:*.epub=38;5;152:*.conf=38;5;121"
export PAGER=less
export LESS='-R -X -F -s -i -g'
export LESSHISTFILE=-

# Custom environment variables.
#
export OS=`uname`
export ARCH=x86_64

# Custom environment variables per platform.
#
if [ $OS = Linux ]; then
    export HOST=`hostname -s`
elif [ $OSTYPE = cygwin ]; then
    export CYGWIN=nodosfilewarning
    export HOST=`hostname`
    if [ $TERM = cygwin ]; then
        unset LS_COLORS
    fi
fi

# By default bash saves away too much history, set the history size to a saner
# value.
#
HISTSIZE=200
HISTFILESIZE=0

# Set the appropriate umask.
#
umask 002

# Enable the useful Bash 4 autocd (no need to type 'cd') and globstar (**
# recursive glob) features.
#
shopt -s autocd globstar


# Functions.
#
clang-debug()
{
    clang-common lin-clang-$ARCH
}

clang-O()
{
    clang-common lin-clang-$ARCH-O
}

clang-asan()
{
    clang-common lin-clang-$ARCH-asan
}

clang-msan()
{
    clang-common lin-clang-$ARCH-msan
}

clang-common()
{
    export TCONFIG=$1
    prompt `echo $TCONFIG | sed -e 's/lin-//g' -e 's/-x86_64//g'`
    unixTtEnv
    PATH=/usr/local/clang/bin:$TT_OBJDIR/$TCONFIG/bin:$PATH
    LD_LIBRARY_PATH=/usr/local/gcc/lib64:$LD_LIBRARY_PATH
}

clean()
{
    unset TCONFIG TT_ACE_PATH TT_DBS_CONFIG TT_ENTITY_PATH \
          TT_IGNORE_MANUALS TT_MESSAGE_PATH TT_OBJDIR TT_SRC TT_TODO_DISABLE
    libraryPath
    path
    prompt
}

gcc-debug()
{
    gcc-common lin-gcc-$ARCH
}

gcc-O()
{
    gcc-common lin-gcc-$ARCH-O
}

gcc-common()
{
    export TCONFIG=$1
    prompt `echo $TCONFIG | sed -e 's/lin-//g' -e 's/-x86_64//g'`
    unixTtEnv
    PATH=/usr/local/gcc/bin:$TT_OBJDIR/$TCONFIG/bin:$PATH
    if [ $OS = Linux ]; then
        LD_LIBRARY_PATH=/usr/local/gcc/lib64:$LD_LIBRARY_PATH
    else
        LD_LIBRARY_PATH=/usr/local/gcc/lib/amd64:$LD_LIBRARY_PATH
    fi
    MANPATH=/usr/local/gcc/share/man:$MANPATH
}

libraryPath()
{
    export LD_LIBRARY_PATH=~/local/lib:/usr/local/lib
}

msvc()
{
    msvc-2012-common win-msvc-$ARCH
}

msvc-O()
{
    msvc-2012-common win-msvc-$ARCH-O
}

msvc-2012-common()
{
    export TCONFIG=$1
    prompt `echo $TCONFIG | sed -e 's/win-//g' -e 's/-x86_64//g'`
    winTtEnv

    PATH=`cygpath $TT_OBJDIR`/$TCONFIG/bin:"/cygdrive/p/microsoft visual studio 11.0/vc/bin/x86_amd64":"/cygdrive/p/microsoft visual studio 11.0/vc/bin":"/cygdrive/p/microsoft visual studio 11.0/common7/ide":"/cygdrive/p/windows kits/8.0/bin/x64":"/cygdrive/p/visual leak detector/bin/win64":$PATH
    export INCLUDE="p:\microsoft visual studio 11.0\vc\include;p:\windows kits\8.0\include\shared;p:\windows kits\8.0\include\um;p:\visual leak detector\include"
    export LIB="p:\microsoft visual studio 11.0\vc\lib\amd64;p:\windows kits\8.0\lib\win8\um\x64;p:\visual leak detector\lib\win64"
}

path()
{
    PATH=/usr/local/bin:/bin:/usr/bin:/usr/sbin
    export MANPATH=~/local/man:/usr/local/man:/usr/man:/usr/share/man
    if [ $OSTYPE = cygwin ]; then
        PATH=$PATH:/cygdrive/c/windows:/cygdrive/c/windows/system32
    fi
    PATH=~/local/bin:~/scripts:'.':$PATH
}

prompt()
{
    open-color() { echo -ne "\e[38;5;$1m"; }
    close-color () { echo -ne '\e[m'; }

    local COLOR_TERMINAL=0
    if [ $TERM = xterm-256color ] || [ $TERM = "screen-256color" ]; then
        COLOR_TERMINAL=1
    fi

    local GIT_PROMPT=0
    if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
        GIT_PROMPT=1
        GIT_PS1_SHOWUPSTREAM="auto"
        . /usr/share/git-core/contrib/completion/git-prompt.sh
    fi

    if [ $# = 1 ]; then
        if [ $COLOR_TERMINAL = 1 ] && [ $GIT_PROMPT = 1 ]; then
            PS1="\[`open-color 255`\]\h\[`close-color`\]\[`open-color 78`\] $1\[`close-color`\]\[`open-color 147`\]\$(__git_ps1)\[`close-color`\]\[`open-color 174`\] \w\[`close-color`\] > "
        elif [ $COLOR_TERMINAL = 1 ]; then
            PS1="\[`open-color 255`\]\h\[`close-color`\]\[`open-color 78`\] $1\[`close-color`\]\[`open-color 174`\] \w\[`close-color`\] > "
        else
            PS1="\h $1 \w > "
        fi
    else
        if [ $COLOR_TERMINAL = 1 ] && [ $GIT_PROMPT = 1 ]; then
            PS1="\[`open-color 255`\]\h\[`close-color`\]\[`open-color 174`\]\[`open-color 147`\]\$(__git_ps1)\[`close-color`\]\[`open-color 174`\] \w\[`close-color`\] > "
        elif [ $COLOR_TERMINAL = 1 ]; then
            PS1="\[`open-color 255`\]\h\[`close-color`\]\[`open-color 174`\] \w\[`close-color`\] > "
        else
            PS1='\h \w > '
        fi
    fi
}

rsync-commit()
{
    if [ -z $TT_SRC ]; then
        printf "Please set the TT_SRC environment variable."
        return
    fi

    # Obtain confirmation prior to a source code commit.
    printf "Are you sure you wish to rsync-commit [y/n]: "
    read resp
    case "$resp" in
        [yY]* )
            ;;
        * )
            return
            ;;
    esac

    local SRC_PATH=$TT_SRC
    if [ $OSTYPE = cygwin ]; then
        SRC_PATH=`cygpath $TT_SRC`
    fi

    if [ $# = 1 ]; then
        rsync --archive --verbose --compress --cvs-exclude --exclude='.*' $SRC_PATH/$1/ mimas:ttsrc/$1
    else
        rsync --archive --verbose --compress --cvs-exclude --exclude='.*' $SRC_PATH/ mimas:ttsrc
    fi
}

rsync-update()
{
    if [ -z $TT_SRC ]; then
        printf "Please set the TT_SRC environment variable."
        return
    fi

    local SRC_PATH=$TT_SRC
    if [ $OSTYPE = cygwin ]; then
        SRC_PATH=`cygpath $TT_SRC`
    fi

    if [ $# = 1 ]; then
        rsync --archive --verbose --compress --recursive --cvs-exclude --include='.svn*' --exclude='.*swp' --delete mimas:ttsrc/$1/ $SRC_PATH/$1 | grep -v '.svn'
    else
        rsync --archive --verbose --compress --recursive --cvs-exclude --include='.svn*' --exclude='.*swp' --delete mimas:ttsrc/ $SRC_PATH | grep -v '.svn'
    fi
}

unixTtEnv()
{
    export TT_SRC=~/ttsrc
    export TT_OBJDIR=/tt/local/obj/$USER
    export TT_ACE_PATH=$TT_OBJDIR/$TCONFIG/lib:$TT_SRC/ACELIBS:$TT_SRC/CLI/formatters:$TT_SRC/AS/admin:.
    export TT_ENTITY_PATH=$TT_SRC/SGML/entity:$TT_SRC/SGML/sp/pubtext
    unset TT_MESSAGE_PATH
    for i in ACE ACELIBS API AS ASADMIN ASAPPS ASN1 BLU CLI CS GSS IMAGING ISYS JSON LDAP RELEASE SAL SGML SSL STORAGE SUPPORT TOOLS W3C Z3950; do
        export TT_MESSAGE_PATH=$TT_SRC/$i/messages:$TT_MESSAGE_PATH
    done
    libraryPath
    path
    export TT_IGNORE_MANUALS=
    export TT_TODO_DISABLE=
    export TT_DBS_CONFIG=~/local/tt/config-x.y
    ulimit -c unlimited
}

winTtEnv()
{
    export TT_SRC='h:\\ttsrc'
    export TT_OBJDIR="f:\\tt\obj\\$USER"
    export TT_ACE_PATH="$TT_OBJDIR\\$TCONFIG\\lib;$TT_SRC\\ACELIBS;$TT_SRC\\CLI\\formatters;$TT_SRC\\AS\\admin;."
    export TT_ENTITY_PATH="$TT_SRC\\SGML\\entity;$TT_SRC\\SGML\\sp\\pubtext"
    unset TT_MESSAGE_PATH
    for i in ACE ACELIBS API AS ASADMIN ASAPPS ASN1 BLU CLI CS GSS IMAGING ISYS JSON LDAP RELEASE SAL SGML SSL STORAGE SUPPORT TOOLS W3C Z3950; do
        export TT_MESSAGE_PATH="$TT_SRC\\$i\\messages;$TT_MESSAGE_PATH"
    done
    path
    export TT_IGNORE_MANUALS=1
    export TT_TODO_DISABLE=
    export TT_DBS_CONFIG='l:\local\tt\config-x.y'
}


# Carry out machine specific specializations.
#
if [ $OS = Linux ]; then
    libraryPath
fi
path
prompt
