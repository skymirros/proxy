#port: 7890
#socks-port: 7891
mixed-port: 7890
allow-lan: false
bind-address: "*"
mode: Rule
log-level: info
external-controller: 127.0.0.1:9090
experimental:
  ignore-resolve-fail: true
hosts:
  smtp.gmail.com: 74.125.20.109
dns:
  enable: false
  listen: 0.0.0.0:53
  ipv6: false

  default-nameserver:
    - 223.5.5.5
    - 1.0.0.1
  enhanced-mode: fake-ip
  fake-ip-range: 198.10.0.1/16
  fake-ip-filter:
    - "*.lan"
    - stun.*.*.*
    - stun.*.*
    - time.windows.com
    - time.nist.gov
    - time.apple.com
    - time.asia.apple.com
    - "*.ntp.org.cn"
    - "*.openwrt.pool.ntp.org"
    - time1.cloud.tencent.com
    - time.ustc.edu.cn
    - pool.ntp.org
    - ntp.ubuntu.com
    - ntp.aliyun.com
    - ntp1.aliyun.com
    - ntp2.aliyun.com
    - ntp3.aliyun.com
    - ntp4.aliyun.com
    - ntp5.aliyun.com
    - ntp6.aliyun.com
    - ntp7.aliyun.com
    - time1.aliyun.com
    - time2.aliyun.com
    - time3.aliyun.com
    - time4.aliyun.com
    - time5.aliyun.com
    - time6.aliyun.com
    - time7.aliyun.com
    - "*.time.edu.cn"
    - time1.apple.com
    - time2.apple.com
    - time3.apple.com
    - time4.apple.com
    - time5.apple.com
    - time6.apple.com
    - time7.apple.com
    - time1.google.com
    - time2.google.com
    - time3.google.com
    - time4.google.com
    - music.163.com
    - "*.music.163.com"
    - "*.126.net"
    - musicapi.taihe.com
    - music.taihe.com
    - songsearch.kugou.com
    - trackercdn.kugou.com
    - "*.kuwo.cn"
    - api-jooxtt.sanook.com
    - api.joox.com
    - joox.com
    - y.qq.com
    - "*.y.qq.com"
    - streamoc.music.tc.qq.com
    - mobileoc.music.tc.qq.com
    - isure.stream.qqmusic.qq.com
    - dl.stream.qqmusic.qq.com
    - aqqmusic.tc.qq.com
    - amobile.music.tc.qq.com
    - "*.xiami.com"
    - "*.music.migu.cn"
    - music.migu.cn
    - "*.msftconnecttest.com"
    - "*.msftncsi.com"
    - localhost.ptlogin2.qq.com
    - "*.*.*.srv.nintendo.net"
    - "*.*.stun.playstation.net"
    - xbox.*.*.microsoft.com
    - "*.*.xboxlive.com"
  use-hosts: true
  nameserver:
    - 119.29.29.29
    - https://dns.alidns.com/dns-query
    - https://aliyun.rubyfish.cn/dns-query
proxies:
- { name: "DJI|Whistle", type: http, server: 10.62.65.218, port: 8888}
- { name: "HK丨香港1", type: vmess, server: f3grveyq.gabuit.com, port: 10101, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "HK丨香港2", type: vmess, server: f3grveyq.gabuit.com, port: 10102, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "HK丨香港3", type: vmess, server: f3grveyq.gabuit.com, port: 10103, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "HK丨香港4", type: vmess, server: f3grveyq.gabuit.com, port: 10104, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "HK丨香港5", type: vmess, server: f3grveyq.gabuit.com, port: 10105, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "TW丨台湾1", type: vmess, server: f3grveyq.gabuit.com, port: 10201, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "TW丨台湾2", type: vmess, server: f3grveyq.gabuit.com, port: 10202, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "TW丨台湾3", type: vmess, server: f3grveyq.gabuit.com, port: 10203, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "JP丨日本1", type: vmess, server: f3grveyq.gabuit.com, port: 10301, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "JP丨日本2", type: vmess, server: f3grveyq.gabuit.com, port: 10302, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "JP丨日本3", type: vmess, server: f3grveyq.gabuit.com, port: 10303, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "JP丨日本4", type: vmess, server: f3grveyq.gabuit.com, port: 10304, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "KR丨韩国1", type: vmess, server: f3grveyq.gabuit.com, port: 10401, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "KR丨韩国2", type: vmess, server: f3grveyq.gabuit.com, port: 10402, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "KR丨韩国3", type: vmess, server: f3grveyq.gabuit.com, port: 10403, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "SG丨新加坡1", type: vmess, server: f3grveyq.gabuit.com, port: 10501, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "SG丨新加坡2", type: vmess, server: f3grveyq.gabuit.com, port: 10502, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "SG丨新加坡3", type: vmess, server: f3grveyq.gabuit.com, port: 10503, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "MY丨马来西亚1", type: vmess, server: f3grveyq.gabuit.com, port: 10601, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "PH丨菲律宾1", type: vmess, server: f3grveyq.gabuit.com, port: 10701, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "PH丨菲律宾2", type: vmess, server: f3grveyq.gabuit.com, port: 10702, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "ID丨印度尼西亚1", type: vmess, server: f3grveyq.gabuit.com, port: 10801, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "IN丨印度1", type: vmess, server: f3grveyq.gabuit.com, port: 10901, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "TH丨泰国1", type: vmess, server: f3grveyq.gabuit.com, port: 11001, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "VN丨越南1", type: vmess, server: f3grveyq.gabuit.com, port: 11101, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "PK丨巴基斯坦1-3x", type: vmess, server: f3grveyq.gabuit.com, port: 11201, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "IL丨以色列1-2x", type: vmess, server: f3grveyq.gabuit.com, port: 11301, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "KZ丨哈萨克斯坦1", type: vmess, server: f3grveyq.gabuit.com, port: 11401, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "AE丨阿联酋1-3x", type: vmess, server: f3grveyq.gabuit.com, port: 11501, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "AU丨澳大利亚1", type: vmess, server: f3grveyq.gabuit.com, port: 11601, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "AU丨澳大利亚2", type: vmess, server: f3grveyq.gabuit.com, port: 11602, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "NZ丨新西兰1-3x", type: vmess, server: f3grveyq.gabuit.com, port: 11701, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "US丨加利福利亚1", type: vmess, server: f3grveyq.gabuit.com, port: 20101, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "US丨纽约1", type: vmess, server: f3grveyq.gabuit.com, port: 20201, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "US丨得克萨斯1", type: vmess, server: f3grveyq.gabuit.com, port: 20301, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "US丨佛罗里达1", type: vmess, server: f3grveyq.gabuit.com, port: 20401, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "US丨华盛顿1", type: vmess, server: f3grveyq.gabuit.com, port: 20501, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "US丨伊利诺伊1", type: vmess, server: f3grveyq.gabuit.com, port: 20601, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "CA丨加拿大1", type: vmess, server: f3grveyq.gabuit.com, port: 20701, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "MX丨墨西哥1", type: vmess, server: f3grveyq.gabuit.com, port: 20801, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "AR丨阿根廷1", type: vmess, server: f3grveyq.gabuit.com, port: 30101, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "BR丨巴西1", type: vmess, server: f3grveyq.gabuit.com, port: 30201, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "UK丨英国1", type: vmess, server: f3grveyq.gabuit.com, port: 40101, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "UK丨英国2", type: vmess, server: f3grveyq.gabuit.com, port: 40102, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "UK丨英国3", type: vmess, server: f3grveyq.gabuit.com, port: 40103, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "FR丨法国1", type: vmess, server: f3grveyq.gabuit.com, port: 40201, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "DE丨德国1", type: vmess, server: f3grveyq.gabuit.com, port: 40301, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "IT丨意大利1", type: vmess, server: f3grveyq.gabuit.com, port: 40401, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "NL丨荷兰1", type: vmess, server: f3grveyq.gabuit.com, port: 40501, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "SE丨瑞典1", type: vmess, server: f3grveyq.gabuit.com, port: 40601, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "RU丨俄罗斯1", type: vmess, server: f3grveyq.gabuit.com, port: 40701, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "UA丨乌克兰1", type: vmess, server: f3grveyq.gabuit.com, port: 40801, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "TR丨土耳其1", type: vmess, server: f3grveyq.gabuit.com, port: 40901, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "PL丨波兰1", type: vmess, server: f3grveyq.gabuit.com, port: 41001, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "DK丨丹麦1", type: vmess, server: f3grveyq.gabuit.com, port: 41101, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "LT丨立陶宛1", type: vmess, server: f3grveyq.gabuit.com, port: 41201, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "LV丨拉脱维亚1", type: vmess, server: f3grveyq.gabuit.com, port: 41301, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "CH丨瑞士1", type: vmess, server: f3grveyq.gabuit.com, port: 41401, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "RO丨罗马尼亚1", type: vmess, server: f3grveyq.gabuit.com, port: 41501, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "EG丨埃及1", type: vmess, server: f3grveyq.gabuit.com, port: 50101, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "ZA丨南非1", type: vmess, server: f3grveyq.gabuit.com, port: 50201, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}
- { name: "NG丨尼日利亚1-3x", type: vmess, server: f3grveyq.gabuit.com, port: 50301, uuid: 9CDAD319-4F4B-ABBD-CA67-5F39FA999D80, alterId: 0, cipher: auto, network: tcp}


proxy-groups:
  - { name: "代理", type: select, proxies: ["DJI|Whistle", "DIRECT"]}
  - { name: "规则外路由选择", type: select, proxies: ["代理","DIRECT"]}
rules:
 - DOMAIN-SUFFIX,local,DIRECT
 - IP-CIDR,192.168.0.0/16,DIRECT,no-resolve
 - IP-CIDR,10.0.0.0/8,DIRECT,no-resolve
 - IP-CIDR,172.16.0.0/12,DIRECT,no-resolve
 - IP-CIDR,127.0.0.0/8,DIRECT,no-resolve
 - IP-CIDR,100.64.0.0/10,DIRECT,no-resolve
 - IP-CIDR6,::1/128,DIRECT,no-resolve
 - IP-CIDR6,fc00::/7,DIRECT,no-resolve
 - IP-CIDR6,fe80::/10,DIRECT,no-resolve
 - IP-CIDR6,fd00::/8,DIRECT,no-resolve
 - DOMAIN,account-api.dji.com,REJECT
 - DOMAIN,test-app-h5.dbeta.me,代理
 - DOMAIN,app-h5.dji.com,代理
 - MATCH,规则外路由选择