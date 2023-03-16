NAME
====

RakuSH - First try on a raku shell that uses data instead of strings

SYNOPSIS
========

```
<fernando@ip-192-168-1-189.eu-west-1.compute.internal[/Users/fernando/RakuSH] #0> ls
CMD:
    .ls: "/Users/fernando/RakuSH"

┌────┬───────────────────────────────────┬──────┬──────┬─────────────────────────────┬─────────────────────────────┬─────────────────────────────┐
│  # │                              name │ type │ mode │                    modified │                    accessed │                     changed │
├────┼───────────────────────────────────┼──────┼──────┼─────────────────────────────┼─────────────────────────────┼─────────────────────────────┤
│  0 │ /Users/fernando/RakuSH/.precomp   │ dir  │ 0755 │ 2023-03-04T00:34:21.332554Z │ 2023-03-04T00:34:21.331773Z │ 2023-03-04T00:34:21.332554Z │
│  1 │ /Users/fernando/RakuSH/META6.json │ file │ 0644 │ 2023-03-15T21:46:56.839799Z │ 2023-03-15T21:47:06.869391Z │ 2023-03-15T21:46:56.839875Z │
│  2 │ /Users/fernando/RakuSH/LICENSE    │ file │ 0644 │ 2023-03-04T00:34:21.013972Z │ 2023-03-05T05:18:32.529073Z │ 2023-03-04T00:34:21.013972Z │
│  3 │ /Users/fernando/RakuSH/bin        │ dir  │ 0755 │ 2023-03-15T21:21:16.046662Z │ 2023-03-15T21:21:18.547771Z │ 2023-03-15T21:21:16.046662Z │
│  4 │ /Users/fernando/RakuSH/Changes    │ file │ 0644 │ 2023-03-04T00:34:21.013887Z │ 2023-03-05T05:18:32.529056Z │ 2023-03-04T00:34:21.013887Z │
│  5 │ /Users/fernando/RakuSH/t          │ dir  │ 0755 │ 2023-03-04T00:34:21.013375Z │ 2023-03-04T00:34:21.140031Z │ 2023-03-04T00:34:21.013375Z │
│  6 │ /Users/fernando/RakuSH/README.md  │ file │ 0644 │ 2023-03-05T05:17:42.028934Z │ 2023-03-05T05:18:32.529139Z │ 2023-03-05T05:17:42.028934Z │
│  7 │ /Users/fernando/RakuSH/.gitignore │ file │ 0644 │ 2023-03-04T00:34:21.013726Z │ 2023-03-05T05:18:32.529038Z │ 2023-03-04T00:34:21.013726Z │
│  8 │ /Users/fernando/RakuSH/.github    │ dir  │ 0755 │ 2023-03-04T00:34:20.983359Z │ 2023-03-04T00:34:21.140058Z │ 2023-03-04T00:34:20.983359Z │
│  9 │ /Users/fernando/RakuSH/lib        │ dir  │ 0755 │ 2023-03-05T23:40:27.860384Z │ 2023-03-05T23:40:27.874384Z │ 2023-03-05T23:40:27.860384Z │
│ 10 │ /Users/fernando/RakuSH/.git       │ dir  │ 0755 │ 2023-03-15T21:19:49.391662Z │ 2023-03-04T00:34:21.027015Z │ 2023-03-15T21:19:49.391662Z │
│ 11 │ /Users/fernando/RakuSH/dist.ini   │ file │ 0644 │ 2023-03-04T00:34:21.013809Z │ 2023-03-05T05:18:32.529176Z │ 2023-03-04T00:34:21.013809Z │
└────┴───────────────────────────────────┴──────┴──────┴─────────────────────────────┴─────────────────────────────┴─────────────────────────────┘


<fernando@ip-192-168-1-189.eu-west-1.compute.internal[/Users/fernando/RakuSH] #1> ls() ==> grep *.f
CMD:
    .ls: "/Users/fernando/RakuSH"
    ==> grep &block

┌───┬───────────────────────────────────┬──────┬──────┬─────────────────────────────┬─────────────────────────────┬─────────────────────────────┐
│ # │                              name │ type │ mode │                    modified │                    accessed │                     changed │
├───┼───────────────────────────────────┼──────┼──────┼─────────────────────────────┼─────────────────────────────┼─────────────────────────────┤
│ 0 │ /Users/fernando/RakuSH/META6.json │ file │ 0644 │ 2023-03-15T21:46:56.839799Z │ 2023-03-15T21:47:06.869391Z │ 2023-03-15T21:46:56.839875Z │
│ 1 │ /Users/fernando/RakuSH/LICENSE    │ file │ 0644 │ 2023-03-04T00:34:21.013972Z │ 2023-03-05T05:18:32.529073Z │ 2023-03-04T00:34:21.013972Z │
│ 2 │ /Users/fernando/RakuSH/Changes    │ file │ 0644 │ 2023-03-04T00:34:21.013887Z │ 2023-03-05T05:18:32.529056Z │ 2023-03-04T00:34:21.013887Z │
│ 3 │ /Users/fernando/RakuSH/README.md  │ file │ 0644 │ 2023-03-05T05:17:42.028934Z │ 2023-03-05T05:18:32.529139Z │ 2023-03-05T05:17:42.028934Z │
│ 4 │ /Users/fernando/RakuSH/.gitignore │ file │ 0644 │ 2023-03-04T00:34:21.013726Z │ 2023-03-05T05:18:32.529038Z │ 2023-03-04T00:34:21.013726Z │
│ 5 │ /Users/fernando/RakuSH/dist.ini   │ file │ 0644 │ 2023-03-04T00:34:21.013809Z │ 2023-03-05T05:18:32.529176Z │ 2023-03-04T00:34:21.013809Z │
└───┴───────────────────────────────────┴──────┴──────┴─────────────────────────────┴─────────────────────────────┴─────────────────────────────┘


<fernando@ip-192-168-1-189.eu-west-1.compute.internal[/Users/fernando/RakuSH] #2> $*1 ==> AT-POS 5
CMD:
    .ls: "/Users/fernando/RakuSH"
    ==> grep &block
    ==> AT-POS 5

accessed : 2023-03-05T05:18:32.529176Z
 changed : 2023-03-04T00:34:21.013809Z
    mode : 0644
modified : 2023-03-04T00:34:21.013809Z
    name : /Users/fernando/RakuSH/dist.ini
    type : file


<fernando@ip-192-168-1-189.eu-west-1.compute.internal[/Users/fernando/RakuSH] #3> etc/passwd", <username password uid gid info home shell>
CMD:
    .open: :separator(:), <username password uid gid info home shell>

┌─────┬────────────────────────┬──────────┬─────┬─────┬─────────────────────────────────────────────────┬───────────────────────────────┬──────────────────┐
│   # │               username │ password │ uid │ gid │                                            info │                          home │            shell │
├─────┼────────────────────────┼──────────┼─────┼─────┼─────────────────────────────────────────────────┼───────────────────────────────┼──────────────────┤
│   0 │ nobody                 │ *        │ -2  │ -2  │ Unprivileged User                               │ /var/empty                    │ /usr/bin/false   │
│   1 │ root                   │ *        │ 0   │ 0   │ System Administrator                            │ /var/root                     │ /bin/sh          │
│   2 │ daemon                 │ *        │ 1   │ 1   │ System Services                                 │ /var/root                     │ /usr/bin/false   │
│   3 │ _uucp                  │ *        │ 4   │ 4   │ Unix to Unix Copy Protocol                      │ /var/spool/uucp               │ /usr/sbin/uucico │
│   4 │ _taskgated             │ *        │ 13  │ 13  │ Task Gate Daemon                                │ /var/empty                    │ /usr/bin/false   │
│   5 │ _networkd              │ *        │ 24  │ 24  │ Network Services                                │ /var/networkd                 │ /usr/bin/false   │
│   6 │ _installassistant      │ *        │ 25  │ 25  │ Install Assistant                               │ /var/empty                    │ /usr/bin/false   │
│   7 │ _lp                    │ *        │ 26  │ 26  │ Printing Services                               │ /var/spool/cups               │ /usr/bin/false   │
│   8 │ _postfix               │ *        │ 27  │ 27  │ Postfix Mail Server                             │ /var/spool/postfix            │ /usr/bin/false   │
│   9 │ _scsd                  │ *        │ 31  │ 31  │ Service Configuration Service                   │ /var/empty                    │ /usr/bin/false   │
│  10 │ _ces                   │ *        │ 32  │ 32  │ Certificate Enrollment Service                  │ /var/empty                    │ /usr/bin/false   │
│  11 │ _appstore              │ *        │ 33  │ 33  │ Mac App Store Service                           │ /var/db/appstore              │ /usr/bin/false   │
│  12 │ _mcxalr                │ *        │ 54  │ 54  │ MCX AppLaunch                                   │ /var/empty                    │ /usr/bin/false   │
│  13 │ _appleevents           │ *        │ 55  │ 55  │ AppleEvents Daemon                              │ /var/empty                    │ /usr/bin/false   │
│  14 │ _geod                  │ *        │ 56  │ 56  │ Geo Services Daemon                             │ /var/db/geod                  │ /usr/bin/false   │
│  15 │ _devdocs               │ *        │ 59  │ 59  │ Developer Documentation                         │ /var/empty                    │ /usr/bin/false   │
│  16 │ _sandbox               │ *        │ 60  │ 60  │ Seatbelt                                        │ /var/empty                    │ /usr/bin/false   │
│  17 │ _mdnsresponder         │ *        │ 65  │ 65  │ mDNSResponder                                   │ /var/empty                    │ /usr/bin/false   │
│  18 │ _ard                   │ *        │ 67  │ 67  │ Apple Remote Desktop                            │ /var/empty                    │ /usr/bin/false   │
│  19 │ _www                   │ *        │ 70  │ 70  │ World Wide Web Server                           │ /Library/WebServer            │ /usr/bin/false   │
│  20 │ _eppc                  │ *        │ 71  │ 71  │ Apple Events User                               │ /var/empty                    │ /usr/bin/false   │
│  21 │ _cvs                   │ *        │ 72  │ 72  │ CVS Server                                      │ /var/empty                    │ /usr/bin/false   │
│  22 │ _svn                   │ *        │ 73  │ 73  │ SVN Server                                      │ /var/empty                    │ /usr/bin/false   │
│  23 │ _mysql                 │ *        │ 74  │ 74  │ MySQL Server                                    │ /var/empty                    │ /usr/bin/false   │
│  24 │ _sshd                  │ *        │ 75  │ 75  │ sshd Privilege separation                       │ /var/empty                    │ /usr/bin/false   │
│  25 │ _qtss                  │ *        │ 76  │ 76  │ QuickTime Streaming Server                      │ /var/empty                    │ /usr/bin/false   │
│  26 │ _cyrus                 │ *        │ 77  │ 6   │ Cyrus Administrator                             │ /var/imap                     │ /usr/bin/false   │
│  27 │ _mailman               │ *        │ 78  │ 78  │ Mailman List Server                             │ /var/empty                    │ /usr/bin/false   │
│  28 │ _appserver             │ *        │ 79  │ 79  │ Application Server                              │ /var/empty                    │ /usr/bin/false   │
│  29 │ _clamav                │ *        │ 82  │ 82  │ ClamAV Daemon                                   │ /var/virusmails               │ /usr/bin/false   │
│  30 │ _amavisd               │ *        │ 83  │ 83  │ AMaViS Daemon                                   │ /var/virusmails               │ /usr/bin/false   │
│  31 │ _jabber                │ *        │ 84  │ 84  │ Jabber XMPP Server                              │ /var/empty                    │ /usr/bin/false   │
│  32 │ _appowner              │ *        │ 87  │ 87  │ Application Owner                               │ /var/empty                    │ /usr/bin/false   │
│  33 │ _windowserver          │ *        │ 88  │ 88  │ WindowServer                                    │ /var/empty                    │ /usr/bin/false   │
│  34 │ _spotlight             │ *        │ 89  │ 89  │ Spotlight                                       │ /var/empty                    │ /usr/bin/false   │
│  35 │ _tokend                │ *        │ 91  │ 91  │ Token Daemon                                    │ /var/empty                    │ /usr/bin/false   │
│  36 │ _securityagent         │ *        │ 92  │ 92  │ SecurityAgent                                   │ /var/db/securityagent         │ /usr/bin/false   │
│  37 │ _calendar              │ *        │ 93  │ 93  │ Calendar                                        │ /var/empty                    │ /usr/bin/false   │
│  38 │ _teamsserver           │ *        │ 94  │ 94  │ TeamsServer                                     │ /var/teamsserver              │ /usr/bin/false   │
│  39 │ _update_sharing        │ *        │ 95  │ -2  │ Update Sharing                                  │ /var/empty                    │ /usr/bin/false   │
│  40 │ _installer             │ *        │ 96  │ -2  │ Installer                                       │ /var/empty                    │ /usr/bin/false   │
│  41 │ _atsserver             │ *        │ 97  │ 97  │ ATS Server                                      │ /var/empty                    │ /usr/bin/false   │
│  42 │ _ftp                   │ *        │ 98  │ -2  │ FTP Daemon                                      │ /var/empty                    │ /usr/bin/false   │
│  43 │ _unknown               │ *        │ 99  │ 99  │ Unknown User                                    │ /var/empty                    │ /usr/bin/false   │
│  44 │ _softwareupdate        │ *        │ 200 │ 200 │ Software Update Service                         │ /var/db/softwareupdate        │ /usr/bin/false   │
│  45 │ _coreaudiod            │ *        │ 202 │ 202 │ Core Audio Daemon                               │ /var/empty                    │ /usr/bin/false   │
│  46 │ _screensaver           │ *        │ 203 │ 203 │ Screensaver                                     │ /var/empty                    │ /usr/bin/false   │
│  47 │ _locationd             │ *        │ 205 │ 205 │ Location Daemon                                 │ /var/db/locationd             │ /usr/bin/false   │
│  48 │ _trustevaluationagent  │ *        │ 208 │ 208 │ Trust Evaluation Agent                          │ /var/empty                    │ /usr/bin/false   │
│  49 │ _timezone              │ *        │ 210 │ 210 │ AutoTimeZoneDaemon                              │ /var/empty                    │ /usr/bin/false   │
│  50 │ _lda                   │ *        │ 211 │ 211 │ Local Delivery Agent                            │ /var/empty                    │ /usr/bin/false   │
│  51 │ _cvmsroot              │ *        │ 212 │ 212 │ CVMS Root                                       │ /var/empty                    │ /usr/bin/false   │
│  52 │ _usbmuxd               │ *        │ 213 │ 213 │ iPhone OS Device Helper                         │ /var/db/lockdown              │ /usr/bin/false   │
│  53 │ _dovecot               │ *        │ 214 │ 6   │ Dovecot Administrator                           │ /var/empty                    │ /usr/bin/false   │
│  54 │ _dpaudio               │ *        │ 215 │ 215 │ DP Audio                                        │ /var/empty                    │ /usr/bin/false   │
│  55 │ _postgres              │ *        │ 216 │ 216 │ PostgreSQL Server                               │ /var/empty                    │ /usr/bin/false   │
│  56 │ _krbtgt                │ *        │ 217 │ -2  │ Kerberos Ticket Granting Ticket                 │ /var/empty                    │ /usr/bin/false   │
│  57 │ _kadmin_admin          │ *        │ 218 │ -2  │ Kerberos Admin Service                          │ /var/empty                    │ /usr/bin/false   │
│  58 │ _kadmin_changepw       │ *        │ 219 │ -2  │ Kerberos Change Password Service                │ /var/empty                    │ /usr/bin/false   │
│  59 │ _devicemgr             │ *        │ 220 │ 220 │ Device Management Server                        │ /var/empty                    │ /usr/bin/false   │
│  60 │ _webauthserver         │ *        │ 221 │ 221 │ Web Auth Server                                 │ /var/empty                    │ /usr/bin/false   │
│  61 │ _netbios               │ *        │ 222 │ 222 │ NetBIOS                                         │ /var/empty                    │ /usr/bin/false   │
│  62 │ _warmd                 │ *        │ 224 │ 224 │ Warm Daemon                                     │ /var/empty                    │ /usr/bin/false   │
│  63 │ _dovenull              │ *        │ 227 │ 227 │ Dovecot Authentication                          │ /var/empty                    │ /usr/bin/false   │
│  64 │ _netstatistics         │ *        │ 228 │ 228 │ Network Statistics Daemon                       │ /var/empty                    │ /usr/bin/false   │
│  65 │ _avbdeviced            │ *        │ 229 │ -2  │ Ethernet AVB Device Daemon                      │ /var/empty                    │ /usr/bin/false   │
│  66 │ _krb_krbtgt            │ *        │ 230 │ -2  │ Open Directory Kerberos Ticket Granting Ticket  │ /var/empty                    │ /usr/bin/false   │
│  67 │ _krb_kadmin            │ *        │ 231 │ -2  │ Open Directory Kerberos Admin Service           │ /var/empty                    │ /usr/bin/false   │
│  68 │ _krb_changepw          │ *        │ 232 │ -2  │ Open Directory Kerberos Change Password Service │ /var/empty                    │ /usr/bin/false   │
│  69 │ _krb_kerberos          │ *        │ 233 │ -2  │ Open Directory Kerberos                         │ /var/empty                    │ /usr/bin/false   │
│  70 │ _krb_anonymous         │ *        │ 234 │ -2  │ Open Directory Kerberos Anonymous               │ /var/empty                    │ /usr/bin/false   │
│  71 │ _assetcache            │ *        │ 235 │ 235 │ Asset Cache Service                             │ /var/empty                    │ /usr/bin/false   │
│  72 │ _coremediaiod          │ *        │ 236 │ 236 │ Core Media IO Daemon                            │ /var/empty                    │ /usr/bin/false   │
│  73 │ _launchservicesd       │ *        │ 239 │ 239 │ _launchservicesd                                │ /var/empty                    │ /usr/bin/false   │
│  74 │ _iconservices          │ *        │ 240 │ 240 │ IconServices                                    │ /var/empty                    │ /usr/bin/false   │
│  75 │ _distnote              │ *        │ 241 │ 241 │ DistNote                                        │ /var/empty                    │ /usr/bin/false   │
│  76 │ _nsurlsessiond         │ *        │ 242 │ 242 │ NSURLSession Daemon                             │ /var/db/nsurlsessiond         │ /usr/bin/false   │
│  77 │ _displaypolicyd        │ *        │ 244 │ 244 │ Display Policy Daemon                           │ /var/empty                    │ /usr/bin/false   │
│  78 │ _astris                │ *        │ 245 │ 245 │ Astris Services                                 │ /var/db/astris                │ /usr/bin/false   │
│  79 │ _krbfast               │ *        │ 246 │ -2  │ Kerberos FAST Account                           │ /var/empty                    │ /usr/bin/false   │
│  80 │ _gamecontrollerd       │ *        │ 247 │ 247 │ Game Controller Daemon                          │ /var/empty                    │ /usr/bin/false   │
│  81 │ _mbsetupuser           │ *        │ 248 │ 248 │ Setup User                                      │ /var/setup                    │ /bin/bash        │
│  82 │ _ondemand              │ *        │ 249 │ 249 │ On Demand Resource Daemon                       │ /var/db/ondemand              │ /usr/bin/false   │
│  83 │ _xserverdocs           │ *        │ 251 │ 251 │ macOS Server Documents Service                  │ /var/empty                    │ /usr/bin/false   │
│  84 │ _wwwproxy              │ *        │ 252 │ 252 │ WWW Proxy                                       │ /var/empty                    │ /usr/bin/false   │
│  85 │ _mobileasset           │ *        │ 253 │ 253 │ MobileAsset User                                │ /var/ma                       │ /usr/bin/false   │
│  86 │ _findmydevice          │ *        │ 254 │ 254 │ Find My Device Daemon                           │ /var/db/findmydevice          │ /usr/bin/false   │
│  87 │ _datadetectors         │ *        │ 257 │ 257 │ DataDetectors                                   │ /var/db/datadetectors         │ /usr/bin/false   │
│  88 │ _captiveagent          │ *        │ 258 │ 258 │ captiveagent                                    │ /var/empty                    │ /usr/bin/false   │
│  89 │ _ctkd                  │ *        │ 259 │ 259 │ ctkd Account                                    │ /var/empty                    │ /usr/bin/false   │
│  90 │ _applepay              │ *        │ 260 │ 260 │ applepay Account                                │ /var/db/applepay              │ /usr/bin/false   │
│  91 │ _hidd                  │ *        │ 261 │ 261 │ HID Service User                                │ /var/db/hidd                  │ /usr/bin/false   │
│  92 │ _cmiodalassistants     │ *        │ 262 │ 262 │ CoreMedia IO Assistants User                    │ /var/db/cmiodalassistants     │ /usr/bin/false   │
│  93 │ _analyticsd            │ *        │ 263 │ 263 │ Analytics Daemon                                │ /var/db/analyticsd            │ /usr/bin/false   │
│  94 │ _fpsd                  │ *        │ 265 │ 265 │ FPS Daemon                                      │ /var/db/fpsd                  │ /usr/bin/false   │
│  95 │ _timed                 │ *        │ 266 │ 266 │ Time Sync Daemon                                │ /var/db/timed                 │ /usr/bin/false   │
│  96 │ _nearbyd               │ *        │ 268 │ 268 │ Proximity and Ranging Daemon                    │ /var/db/nearbyd               │ /usr/bin/false   │
│  97 │ _reportmemoryexception │ *        │ 269 │ 269 │ ReportMemoryException                           │ /var/db/reportmemoryexception │ /usr/bin/false   │
│  98 │ _driverkit             │ *        │ 270 │ 270 │ DriverKit                                       │ /var/empty                    │ /usr/bin/false   │
│  99 │ _diskimagesiod         │ *        │ 271 │ 271 │ DiskImages IO Daemon                            │ /var/db/diskimagesiod         │ /usr/bin/false   │
│ 100 │ _logd                  │ *        │ 272 │ 272 │ Log Daemon                                      │ /var/db/diagnostics           │ /usr/bin/false   │
│ 101 │ _appinstalld           │ *        │ 273 │ 273 │ App Install Daemon                              │ /var/db/appinstalld           │ /usr/bin/false   │
│ 102 │ _installcoordinationd  │ *        │ 274 │ 274 │ Install Coordination Daemon                     │ /var/db/installcoordinationd  │ /usr/bin/false   │
│ 103 │ _demod                 │ *        │ 275 │ 275 │ Demo Daemon                                     │ /var/empty                    │ /usr/bin/false   │
│ 104 │ _rmd                   │ *        │ 277 │ 277 │ Remote Management Daemon                        │ /var/db/rmd                   │ /usr/bin/false   │
│ 105 │ _accessoryupdater      │ *        │ 278 │ 278 │ Accessory Update Daemon                         │ /var/db/accessoryupdater      │ /usr/bin/false   │
│ 106 │ _knowledgegraphd       │ *        │ 279 │ 279 │ Knowledge Graph Daemon                          │ /var/db/knowledgegraphd       │ /usr/bin/false   │
│ 107 │ _coreml                │ *        │ 280 │ 280 │ CoreML Services                                 │ /var/empty                    │ /usr/bin/false   │
│ 108 │ _sntpd                 │ *        │ 281 │ 281 │ SNTP Server Daemon                              │ /var/empty                    │ /usr/bin/false   │
│ 109 │ _trustd                │ *        │ 282 │ 282 │ trustd                                          │ /var/empty                    │ /usr/bin/false   │
│ 110 │ _mmaintenanced         │ *        │ 283 │ 283 │ mmaintenanced                                   │ /var/db/mmaintenanced         │ /usr/bin/false   │
│ 111 │ _darwindaemon          │ *        │ 284 │ 284 │ Darwin Daemon                                   │ /var/db/darwindaemon          │ /usr/bin/false   │
│ 112 │ _notification_proxy    │ *        │ 285 │ 285 │ Notification Proxy                              │ /var/empty                    │ /usr/bin/false   │
│ 113 │ _avphidbridge          │ *        │ 288 │ 288 │ Apple Virtual Platform HID Bridge               │ /var/empty                    │ /usr/bin/false   │
│ 114 │ _biome                 │ *        │ 289 │ 289 │ Biome                                           │ /var/db/biome                 │ /usr/bin/false   │
│ 115 │ _backgroundassets      │ *        │ 291 │ 291 │ Background Assets Service                       │ /var/empty                    │ /usr/bin/false   │
│ 116 │ _oahd                  │ *        │ 441 │ 441 │ OAH Daemon                                      │ /var/empty                    │ /usr/bin/false   │
└─────┴────────────────────────┴──────────┴─────┴─────┴─────────────────────────────────────────────────┴───────────────────────────────┴──────────────────┘

ERRORS:
0 - ##
1 - # User Database
2 - #
3 - # Note that this file is consulted directly only when the system is running
4 - # in single-user mode.  At other times this information is provided by
5 - # Open Directory.
6 - #
7 - # See the opendirectoryd(8) man page for additional information about
8 - # Open Directory.
9 - ##


<fernando@ip-192-168-1-189.eu-west-1.compute.internal[/Users/fernando/RakuSH] #4>
```

DESCRIPTION
===========

RakuSH is still at the beginning of development

The intent here is to add some tools and ways to make it easier use Raku as a shell.
It also uses Raku's REPL to it.

AUTHOR
======

    Fernando Corrêa <fernando correa@gmail.com>

COPYRIGHT AND LICENSE
=====================

Copyright 2023 Fernando Corrêa

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

