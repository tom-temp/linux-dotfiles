#!/bin/bash

# 使用 wofi 的 --dmenu 模式来创建一个输入框
# 使用 --style 选项来应用 CSS 样式
wofi_output=$(wofi --show dmenu --style ~/.config/wofi/search.css)

# 如果输入不为空
if [ -n "$wofi_output" ]; then
    # 将输入作为搜索关键词
    search_query=$(echo "$wofi_output" | sed 's/ /%20/g')

    # 构建搜索引擎的 URL
    search_url="https://www.google.com/search?q=$search_query"

    # 使用 xdg-open 打开浏览器
    xdg-open "$search_url"
fi