#SUBSCRIBED http://192.168.1.229:5500/clash/demo.profile
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
proxy-groups:
  - name: 代理
    type: select
    lazy: true
    proxies:
      - DIRECT
  - name: 国内
    type: select
    lazy: true
    proxies:
      - DIRECT
      - 代理
  - lazy: true
    name: 国外
    proxies:
      - DIRECT
      - 代理
    type: select
  - name: 特殊配置
    type: select
    lazy: true
    proxies:
      - DIRECT
      - REJECT
      - 代理
proxy-providers:
rule-providers:
  special-classical:
    behavior: classical-text # 特殊服务的规则，如Apple、Stream下载
    url: 'https://raw.githubusercontent.com/skymirros/proxy/refs/heads/master/clash/special-classical.txt'
    interval: 86400
  special-domain: # 特殊服务的域名，如Apple、Stream下载
    behavior: domain-text
    url: 'https://raw.githubusercontent.com/skymirros/proxy/refs/heads/master/clash/special-domain.txt'
    interval: 86400
  special-ip:
    behavior: ipcidr-text # 特殊服务的IP，如Apple、Stream下载
    url: 'https://raw.githubusercontent.com/skymirros/proxy/refs/heads/master/clash/special-ip.txt'
    interval: 86400
  china-domain:
    behavior: domain-text
    url: 'https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/direct.txt'
    interval: 86400
  need-proxy-domain:
    behavior: domain-text
    url: 'https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/proxy.txt'
    interval: 86400
  china-ip:
    behavior: ipcidr-text
    url: 'https://cdn.jsdelivr.net/gh/17mon/china_ip_list@master/china_ip_list.txt'
    interval: 86400
rules:
  - RULE-SET,special-classical,特殊配置
  - RULE-SET,special-domain,特殊配置,no-resolve
  - RULE-SET,special-ip,特殊配置
  - SCRIPT,quic,REJECT,no-track
  - RULE-SET,china-domain,国内,no-resolve
  - RULE-SET,need-proxy-domain,国外,no-resolve
  - RULE-SET,china-ip,国内
  - MATCH,代理
