# 配置基于 https://github.com/Hackl0us/SS-Rule-Snippet 修改
 
# 规则模式：rule（规则） / global（全局代理）/ direct（全局直连）
mode: rule
 
# 设置日志输出级别 (默认级别：silent，即不输出任何内容，以避免因日志内容过大而导致程序内存溢出）。
# 5 个级别：silent / info / warning / error / debug。级别越高日志输出量越大，越倾向于调试，若需要请自行开启。
log-level: info
 
# HTTP 引擎相关
http:
  # 强制使用 HTTP 引擎处理 TCP 连接
  # 捕获后的连接可以使用高级功能，例如重写和脚本
  # force-http-engine:
  #   - '*:80'
  #   - '*:4480' # BiliBili CDN
  #   - '*:9102' # BiliBili CDN
 
  # 以 PKCS #12 编码的 CA 证书
  # ca: ''
  # 证书密码
  # ca-passphrase: ''
  # 开启 MitM 功能的域名列表，需要确保上述 CA 证书已受系统信任
  # mitm:
  #   - g.cn
  #   - '*.google.cn'
  #   - weather-data.apple.com # 默认只对 443 端口开启
  #   - weather-data.apple.com:* # 使用通配符对所有端口开启
  #   - '*.weather-data.apple.com' # 域名中也可以使用通配符
  #   - '-exclude.weather-data.apple.com' # 用-前缀排除域名
 
  # HTTP(S) 重写，支持 header、302、307、reject 多种策略
  url-rewrite:
    - ^http://g\.cn http://www.google.com header # 重写请求头的域名
    - ^https?://www\.google\.cn https://www.google.com 302 # 直接返回一个 302 重定向的响应
    # - ^https?://ad\.example - reject # 拒绝请求
 
  # 使用 JavaScript 脚本改写 HTTP(S) 请求
  script:
    # - match: https://weather-data.apple.com/v2/weather/[\w-]+/-?[0-9]+\.[0-9]+/-?[0-9]+\.[0-9]+\?
    #   name: weather-us-aqi # 引用 script-providers 中的脚本
    #   type: response # 脚本类型：request / response
    #   require-body: true # 如果需要 request / response body，请设置为 true
    #   timeout: 10 # script timeout in second (optional)
    #   argument: '' # script argument (optional)
    #   debug: false # 开发模式，每次执行前会从 provider 加载最新脚本
    #   binary-mode: false # 以二进制模式获取 body
    #   max-size: 1048576 # 1MB
 
# 定时任务
# cron:
#   # 定时执行 JavaScript 脚本
#   script:
#     - name: weather-us-aqi # 引用 script-providers 中的脚本
#       cron: '* * * * *' # cron 表达式，可以在 https://crontab.guru/ 获取更多介绍
#       timeout: 10 # script timeout in second (optional)
#       argument: '' # script argument (optional)
#       debug: false # 开发模式，每次执行前会从 provider 加载最新脚本
 
# script-providers:
 
# script:
#   shortcuts: # 使用表达式编写自定义规则
#     # 4483 与 9305 为 BiliBili 的 QUIC CDN
#     quic: network == 'udp' and (dst_port == 443 or dst_port == 4483 or dst_port == 9305) # 可以在 rule 中引用
 
# 支持通配符域名 (例如: *.clash.dev, *.foo.*.example.com )
# 不使用通配符的域名优先级高于使用通配符的域名 (例如: foo.example.com > *.example.com > .example.com )
# 注意: +.foo.com 的效果等同于 .foo.com 和 foo.com
hosts:
  # '*.clash.dev': 127.0.0.1
 
# DNS 服务器配置
dns:
  # 以下填写的 DNS 服务器将会被用来解析 DNS 服务的域名
  # 仅填写 DNS 服务器的 IP 地址
  default-nameserver:
    - 223.5.5.5
    - 114.114.114.114
    - system # 使用 iOS 系统 DNS
  # 支持 UDP / TCP / DoT / DoH 协议的 DNS 服务，可以指明具体的连接端口号。
  # 所有 DNS 请求将会直接发送到服务器，不经过任何代理。
  # Stash 会使用最先获得的解析记录回复 DNS 请求
  nameserver:
    # 不建议配置超过 2 个 DNS 服务器，会增加系统功耗
    # - https://doh.pub/dns-query
    # - https://dns.alidns.com/dns-query
    # - quic://dns.adguard.com:853
    # - doq://test.dns.nextdns.io:853
    - 223.5.5.5
    - 114.114.114.114
    - system # 使用 iOS 系统 DNS
 
  # 跳过证书验证，解决部分兼容性问题 https://help.nextdns.io/t/g9hdkjz
  skip-cert-verify: true
 
  # 对部分域名使用单独的 DNS 服务器
  nameserver-policy:
    # 'www.baidu.com': 114.114.114.114
    # '+.internal.crop.com': system
 
  # 在以下列表的域名将不会被解析为 fake ip，这些域名相关的解析请求将会返回它们真实的 IP 地址
  fake-ip-filter:
    # from: https://github.com/Kr328/ClashForAndroid/blob/ffa559a57102ed8bc20eba41aa236a7764741bf9/core/src/main/golang/native/config/defaults.go#L10
 
    # Stun Services
    - '+.stun.*.*'
    - '+.stun.*.*.*'
    - '+.stun.*.*.*.*'
    - '+.stun.*.*.*.*.*'
 
    # Google Voices
    - 'lens.l.google.com'
 
    # Nintendo Switch
    - '*.n.n.srv.nintendo.net'
 
    # PlayStation
    - '+.stun.playstation.net'
 
    # XBox
    - 'xbox.*.*.microsoft.com'
    - '*.*.xboxlive.com'
 
    # Microsoft
    - '*.msftncsi.com'
    - '*.msftconnecttest.com'
 
    # Bilibili CDN
    - '*.mcdn.bilivideo.cn'
 
proxies:
  # shadowsocks
  # 支持加密方式：
  #   aes-128-gcm aes-192-gcm aes-256-gcm
  #   aes-128-cfb aes-192-cfb aes-256-cfb
  #   aes-128-ctr aes-192-ctr aes-256-ctr
  #   rc4-md5 chacha20 chacha20-ietf xchacha20
  #   chacha20-ietf-poly1305 xchacha20-ietf-poly1305
  - name: 'ss1'
    type: ss
    server: server
    port: 443
    benchmark-url: http://www.apple.com
    benchmark-timeout: 5
    cipher: chacha20-ietf-poly1305
    password: 'password'
 
  - name: 'ss2'
    type: ss
    server: server
    port: 443
    benchmark-url: http://www.apple.com
    benchmark-timeout: 5
    cipher: AEAD_CHACHA20_POLY1305
    password: 'password'
    plugin: obfs
    plugin-opts:
      mode: tls # 混淆模式，可以选择 http 或 tls
      host: bing.com # 混淆域名，需要和服务器配置保持一致
 
  - name: 'ss3'
    type: ss
    server: server
    port: 443
    benchmark-url: http://www.apple.com
    benchmark-timeout: 5
    cipher: AEAD_CHACHA20_POLY1305
    password: 'password'
    plugin: v2ray-plugin
    plugin-opts:
      mode: websocket # 暂时不支持 QUIC 协议
      tls: true # wss
      skip-cert-verify: true
      host: bing.com
      path: '/'
      headers:
        custom: value
 
  # vmess
  # 支持加密方式：auto / aes-128-gcm / chacha20-poly1305 / none
  - name: 'vmess'
    type: vmess
    server: server
    port: 443
    benchmark-url: http://www.apple.com
    benchmark-timeout: 5
    uuid: d0529668-8835-11ec-a8a3-0242ac120002
    alterId: 32
    cipher: auto
    tls: true
    skip-cert-verify: true
    servername: example.com # 优先级高于 wss host
    network: ws
    ws-opts:
      path: /path
      headers:
        Host: v2ray.com
      max-early-data: 2048
      early-data-header-name: Sec-WebSocket-Protocol
 
  - name: 'vmess-h2'
    type: vmess
    server: server
    port: 443
    benchmark-url: http://www.apple.com
    benchmark-timeout: 5
    uuid: d0529668-8835-11ec-a8a3-0242ac120002
    alterId: 32
    cipher: auto
    network: h2
    tls: true
    h2-opts:
      host:
        - http.example.com
        - http-alt.example.com
      path: /
 
  - name: 'vmess-http'
    type: vmess
    server: server
    port: 443
    benchmark-url: http://www.apple.com
    benchmark-timeout: 5
    uuid: d0529668-8835-11ec-a8a3-0242ac120002
    alterId: 32
    cipher: auto
    network: http
    http-opts:
      method: 'GET'
      path:
        - '/'
        - '/video'
      headers:
        Connection:
          - keep-alive
 
  - name: 'vmess-grpc'
    server: server
    port: 443
    benchmark-url: http://www.apple.com
    benchmark-timeout: 5
    type: vmess
    uuid: d0529668-8835-11ec-a8a3-0242ac120002
    alterId: 32
    cipher: auto
    network: grpc
    tls: true
    servername: example.com
    skip-cert-verify: true
    grpc-opts:
      grpc-service-name: 'example'
 
  # socks5
  - name: 'socks'
    type: socks5
    server: server
    port: 443
    benchmark-url: http://www.apple.com
    benchmark-timeout: 5
    username: username
    password: password
    tls: true
    skip-cert-verify: true
 
  # http
  - name: 'http'
    type: http
    server: server
    port: 443
    benchmark-url: http://www.apple.com
    benchmark-timeout: 5
    username: username
    password: password
    tls: true # https
    skip-cert-verify: true
 
  # snell
  - name: 'snell'
    type: snell
    server: server
    port: 44046
    benchmark-url: http://www.apple.com
    benchmark-timeout: 5
    psk: yourpsk
    version: 3
    obfs-opts:
      mode: http # 或 tls
      host: bing.com
 
  # Trojan
  - name: 'trojan'
    type: trojan
    server: server
    port: 443
    benchmark-url: http://www.apple.com
    benchmark-timeout: 5
    password: yourpsk
    sni: example.com # Server Name Indication，如果空会使用 server 中的值
    alpn:
      - h2
      - http/1.1
    skip-cert-verify: true
 
  # hysteria https://github.com/HyNetwork/hysteria/wiki/%E9%AB%98%E7%BA%A7%E7%94%A8%E6%B3%95
  - name: 'hysteria'
    type: hysteria
    server: server
    port: 443
    benchmark-url: http://www.apple.com
    benchmark-timeout: 5
    up-speed: 100 # 上传带宽（单位：Mbps）
    down-speed: 100 # 下载带宽（单位：Mbps）
    auth-str: your-password
    # auth: aHR0cHM6Ly9oeXN0ZXJpYS5uZXR3b3JrL2RvY3MvYWR2YW5jZWQtdXNhZ2Uv # bytes encoded in base64
    protocol: '' # udp / wechat-video
    obfs: '' # obfs password
    sni: example.com # Server Name Indication，如果空会使用 server 中的值
    alpn:
      - hysteria
    skip-cert-verify: true
 
  # ShadowsocksR
  # 支持的加密方式: SS 中支持的所有流加密方式
  # 支持的混淆方式:
  #   plain http_simple http_post
  #   random_head tls1.2_ticket_auth tls1.2_ticket_fastauth
  # 支持的协议:
  #   origin auth_sha1_v4 auth_aes128_md5
  #   auth_aes128_sha1 auth_chain_a auth_chain_b
  - name: 'ssr'
    type: ssr
    server: server
    port: 443
    benchmark-url: http://www.apple.com
    benchmark-timeout: 5
    cipher: chacha20-ietf
    password: 'password'
    obfs: tls1.2_ticket_auth
    protocol: auth_sha1_v4
    obfs-param: domain.tld
    protocol-param: '#'
 
  - name: 'vless'
    type: vless
    server: server
    port: 443
    benchmark-url: http://www.apple.com
    benchmark-timeout: 5
    uuid: d0529668-8835-11ec-a8a3-0242ac120002
    flow: xtls-rprx-direct
    skip-cert-verify: true
    network: h2
    tls: true
    ws-opts:
      path: /path
      headers:
        Host: v2ray.com
    grpc-opts:
      grpc-service-name: 'example'
    h2-opts:
      host:
        - http.example.com
        - http-alt.example.com
      path: /
 
proxy-groups:
  # 代理的转发链, 在 proxies 中不应该包含 relay. 不支持 UDP.
  # 流量: clash <-> http <-> vmess <-> ss1 <-> ss2 <-> 互联网
  - name: 'relay'
    type: relay
    icon: https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Direct.png
    proxies:
      - http
      - vmess
      - ss1
      - ss2
 
  # url-test 可以自动选择延迟最短的服务器
  - name: 'auto'
    type: url-test
    proxies:
      - ss1
      - ss2
      - vmess
    interval: 300
 
  # fallback 可以尽量按照用户书写的服务器顺序，在确保服务器可用的情况下，自动选择服务器
  - name: 'fallback-auto'
    type: fallback
    proxies:
      - ss1
      - ss2
      - vmess
    interval: 300
 
  # load-balance 可以使相同 eTLD 请求在同一条代理线路上
  - name: 'load-balance'
    type: load-balance
    proxies:
      - ss1
      - ss2
      - vmess
    interval: 300
 
  # select 用来允许用户手动选择 代理服务器 或 服务器组
  # 您也可以使用 RESTful API 去切换服务器，这种方式推荐在 GUI 中使用
  - name: Proxy
    type: select
    proxies:
      - ss1
      - ss2
      - vmess
      - auto
 
  # 基于 SSID 的策略，方便在特殊网络环境下使用特定的代理
  - name: ssid-group
    type: select # 类型必须为 select，兼容原版 clash 配置
    proxies:
      - ss1
      - ss2
      - DIRECT
    ssid-policy:
      # 在 SSID 为 office 的 Wi-Fi 中自动切换为 ss1 策略
      # 在 SSID 为 home 的 Wi-Fi 中自动切换为 ss2 策略
      # 在蜂窝数据中自动切换为 ss3 策略
      # 其他的 SSID 默认为 DIRECT
      office: ss1
      home: ss2
      cellular: ss3
      default: DIRECT
 
  - name: UseProvider
    type: select
    use:
      - provider1
    proxies:
      - Proxy
      - DIRECT
 
proxy-providers:
  provider1:
    url: https://raw.githubusercontent.com/STASH-NETWORKS-LIMITED/stash-example/main/config.yaml
    interval: 3600
 

rule-providers:
  china-domain:
    behavior: domain-text
    url: 'https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/direct.txt'
    interval: 86400

  china-ip:
    behavior: ipcidr-text
    url: 'https://cdn.jsdelivr.net/gh/17mon/china_ip_list@master/china_ip_list.txt'
    interval: 86400
  
  need-proxy:
    behavior: domain-set
    url: 'https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/proxy.txt'
    interval: 86400
  
  special-domain: # 特殊服务的域名，如Apple、Stream下载
    behavior: domain-text
    url: 'https://raw.githubusercontent.com/skymirros/proxy/refs/heads/master/clash/special-domain.text'
    interval: 86400
  
  special-ip:
    behavior: ipcidr-text # 特殊服务的IP，如Apple、Stream下载
    url: 'https://raw.githubusercontent.com/skymirros/proxy/refs/heads/master/clash/special-ip.text'
    interval: 86400
 
rules:
  - SCRIPT,quic,REJECT,no-track
  - RULE-SET,proxy-domain,Proxy
  - RULE-SET,apple-direct,DIRECT
  - RULE-SET,lan-cidr,DIRECT
  - RULE-SET,ip-cidr-text,DIRECT
  - GEOIP,CN,DIRECT
  - MATCH,Proxy