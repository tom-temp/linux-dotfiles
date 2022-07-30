# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# The following lines were added by compinstall


# 补全提示
autoload -U compinit; compinit
##提示排序
zstyle ':completion:*:*:cp:*' file-sort size
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' file-list all
##补全选择
zstyle ':completion:*' menu select
##分类
zstyle ':completion:*:*:*:*:descriptions' format '%F{yellow}-- %d --%f'


# 信息
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'

# 缓存
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "~/.config/zsh/.zcompcache"

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000

# End of lines configured by zsh-newuser-install

source '/home/tom/.config/zsh/zinit/zinit.zsh'
zinit ice depth=1
zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
