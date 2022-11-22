echo "选择linux架构：1.amd64, 2.arm64. (1/2)"
read xcaddy_arch_s
case "$xcaddy_arch_s" in
    1) export xcaddy_arch="amd64" ;;
    2) export xcaddy_arch="arm64" ;;
    *) export xcaddy_arch="amd64" && echo "无选择，默认设置为${COLOR_H1_0}arm64${COLOR_END}";;
esac