if status is-interactive

    # fish命令外观
    fish_config theme choose Dracula
    set -U fish_color_command brblue --bold

    # --- 环境变量 & PATH 处理 ---
    fish_add_path "$HOME/.local/share/bin"
    fish_add_path "$HOME/.local/bin"

    # Homebrew
    if test -e "/home/linuxbrew/.linuxbrew/bin/brew"
        eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    end

    # fnm
    if type -q fnm
        fnm env --use-on-cd | source
    end

    # pnpm
    if type -q pnpm
        set -gx PNPM_HOME "/home/tom/.local/pnpm"
        fish_add_path "$PNPM_HOME"
    end

    # bun
    if test -d "$HOME/.bun/bin"
        fish_add_path "$HOME/.bun/bin"
    end

    # 基础变量
    set -gx EDITOR /usr/bin/vim

    # 颜色变量 (Fish 建议使用 set_color，这里保留你的原始转义码)
    set -gx COLOR_H1_0 (set_color -b green -o magenta)    # 加粗 洋红字 绿底
    set -gx COLOR_H1_1 (set_color -u -b cyan black)       # 下划线 黑字 青底
    set -gx COLOR_H2_0 (set_color -b black -o magenta)    # 加粗 洋红字 黑底
    set -gx COLOR_H2_1 (set_color -b black -o green)      # 加粗 绿字 黑底
    set -gx COLOR_END  (set_color normal)                 # 重置颜色

    # --- 主题设置 ---
    if test -f "$HOME/.config/starship.toml"; and type -q starship
        starship init fish | source
    else if test -f "$HOME/.config/fish/timwhite.omp.toml"; and type -q oh-my-posh
        oh-my-posh init fish --config "$HOME/.config/fish/timwhite.omp.toml" | source
    end

    # --- 软件包管理器 & 别名 ---
    if type -q xbps-install
        alias xbps-install='sudo xbps-install -S && sudo xbps-install'
    end

    # --- APP 扩展 ---
    if type -q opencode
        alias opencodeweb='opencode web --hostname 0.0.0.0 --port 10000'
    end

    # Atuin
    if type -q atuin
        set -gx ATUIN_NOBIND "true"
        atuin init fish | source
        bind \cf _atuin_search # Fish 中绑定 Ctrl+f
    end

    # Fzf
    # if type -q fzf
    #     set -gx FZF_COMPLETION_TRIGGER '@@'
    #     set -gx FZF_CTRL_T_OPTS "
    #     --height 50% --layout reverse --border top
    #     --walker-skip .git,node_modules,target
    #     --preview 'if file --mime {} | grep -q binary; echo $COLOR_H1_1 {} $COLOR_END is a binary file; else; bat -n --color always -r :30 {}; end'"
    #     fzf --fish | source
    # end

    # Zoxide
    if type -q zoxide
        zoxide init fish | source
    end

    # --- 命令别名 (Modern Unix Tools) ---
    alias rmdel='rm'

    if type -q exa
        alias ll='exa -l --color always -aa -s type --icons'
        alias ls='exa -s type --icons'
        alias tree='exa -T --icons -L 2 -s type'
        alias lst='exa -T --icons -L 2 -s type'
        alias lln='exa -l --color always -aa -s type'
        alias lsn='exa -s type'
    end

    type -q dysk; and alias lfs='dysk'
    type -q rg; and alias grep='rg'
    type -q procs; and alias psui='procs'
    type -q dust; and alias du='dust'
    
    if type -q gomi
        alias rm='gomi'
        alias rml='gomi --restore'
    else
        alias mv='mv -i'
    end

    type -q macchina; and alias a='macchina -t Lithium'

    # --- 自定义函数 ---
    
    # Yazi 切换目录函数
    if type -q yazi
        function ya
            set tmp (mktemp -t "yazi-cwd.XXXXX")
            yazi $argv --cwd-file="$tmp"
            if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
                cd -- "$cwd"
            end
            rm -f -- "$tmp"
        end
    end
end