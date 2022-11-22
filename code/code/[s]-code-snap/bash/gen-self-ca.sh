# 生成私钥 使用des3(3des)加密 长度为2048, outfile=server.key
openssl genrsa -des3 -out server.key 2048
# 生成没有密码加密的证书(optional) 建议部署web时使用这个文件
openssl rsa -in server.key -out server_without_passwd.key
# 根据私钥"server.key" 生成csr中间文件(证书签名请求)
openssl req -new -key server.key -out server.csr
# 更具请求输出证书
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt