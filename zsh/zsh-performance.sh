#! zsh
#######################################################################
#                        PERFORMANCE PROFILING                        #
#######################################################################
# REF: https://joshghent.com/zsh-speed/
# REF: https://htr3n.github.io/2018/07/faster-zsh/
# REF: https://stevenvanbael.com/profiling-zsh-startup
# 1. $ for i in $(seq 1 10); do /usr/bin/time $SHELL -i -c exit; done
# 2. $ zprof
# 3. $ zsh -xv

# REF: https://zsh.sourceforge.io/Doc/Release/Zsh-Modules.html#The-zsh_002fzprof-Module
zmodload zsh/zprof  # Then do "$ zprof" in command line

# REF: https://blog.patshead.com/2011/04/improve-your-oh-my-zsh-startup-time-maybe.html
# !!! SPEED UP ZSH FOR 1+ SECOND BY SKIPPING /etc/zsh
skip_global_compinit=1

# REF: https://gist.github.com/ctechols/ca1035271ad134841284
# autoload -Uz compinit
# if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
# 	compinit;
# else
# 	compinit -C;
# fi;

ZSH_CACHE_DIR="/tmp/zsh_cache"
