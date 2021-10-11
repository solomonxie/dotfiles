#! zsh
#######################################################################
#                        PERFORMANCE PROFILING                        #
#######################################################################
# REF: https://joshghent.com/zsh-speed/
# REF: https://htr3n.github.io/2018/07/faster-zsh/
# REF: https://stevenvanbael.com/profiling-zsh-startup
# REF: https://blog.mattclemente.com/2020/06/26/oh-my-zsh-slow-to-load/
# 1. $ for i in $(seq 1 10); do /usr/bin/time $SHELL -i -c exit; done
# 2. $ zprof
# 3. $ zsh -xv
# 4. $ zsh-prompt-benchmark  # 3rd party plugin

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


# REF: https://github.com/romkatv/zsh-prompt-benchmark
if [ ! -e ~/.zsh_plugins/zsh-prompt-benchmark ]; then
    git clone https://github.com/romkatv/zsh-prompt-benchmark.git ~/.zsh_plugins/zsh-prompt-benchmark
fi
source ~/.zsh_plugins/zsh-prompt-benchmark/zsh-prompt-benchmark.plugin.zsh
# ********************************************************************
#                       Prompt Benchmark Results
# ********************************************************************
# Warmup duration      8s
# Benchmark duration   2.008s
# Benchmarked prompts  172
# Time per prompt      11.68ms  <-- prompt latency (lower is better)
# ********************************************************************
