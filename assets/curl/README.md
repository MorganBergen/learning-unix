#  information guide outside the `curl --manual`

source:  [mastering the curl command line with daniel stenberg](https://youtu.be/V5vZWHP-RqU?si=8OWbz0sQujLEVr5-) a command line tool that has existed since 1997

```
                                  _   _ ____  _
                              ___| | | |  _ \| |
                             / __| | | | |_) | |
                            | (__| |_| |  _ <| |___
                             \___|\___/|_| \_\_____|
```

`curl [options...] <url>`

##  table of contents

1.  [introduction](#introduction)

##  introduction

-  curl does internet transfers, `c`, tranfer a `url`
-  a server is a remote machine running server software.
-  curl acts as a client on the network
-  curl connects to a stream of data from or to a server 

##  internet transfer

-  data from a server to curl is a download
-  data from curl to a server is an upload
-  data is not known by curl, it does not know what the data is exactly
-  curl does not care what kind of data it is
-  data could be `text`, `images`, `maps`. `code`, `film`, `sound`

##  supporting protocols 

`HTTPS`, `GOPHERS`, `FTPS`, `TELNET`, `DICT`, `LADAPS`, `FILE`, `TFTD`, `SCP`, `SFTPS`, `IMAPS`, `POP3S`, `SMTPS`, `RTSP`, `RTMPS`, `SMBS`, `MQTT`, `WSS`

##  graph

```mermaid
flowchart TB
    subgraph SR[server]
        direction TB
    end

    SR -.-> CURL(curl)
    CURL(curl) -.-> SR

    subgraph CURL[curl]
        direction TB
    end
```

##  project

-  curl runs everywhere not to mention linux, windows, mac, freebsd, openbsd, vms
-  works on 92 different operating systems
-  1.3k commiters -> 3.7k committers
-  80x growth since 1998
-  20 billion installation
-  how straight forward it is to use, it's functionality has stayed consistent

##  authenticated vs unaunthenticated

-  alwyas use authenticated protocols
-  using TLS or SSH as the underlying protocol, because authentication relys on these
-  `HTTP`...`S`, `FTP`...`S`, `LDAP`...`S`, `IMAP`...`S` end in `S`, which is short for `S`ecurity
-  never disable server verification (`--insecure`) in production
-  if you use unaunthenticated transfers (it can be easedropped and tampered with) and the person using curl wont be able to see if it's happening (`SSH`) powered protocols are necessary.

##  command line

command line options usage will appear as the following format

`curl` `[options...]` `<url>`

##  `[options...]` types

1.  short options `-V` 
2.  long option `--version` 
3.  boolean option `--path-as-is`
4.  options with arguments `--output store.html`
5.  arguments with spaces

| type          | `[options...]` | usage                        |
|:--------------|:---------------|:-----------------------------|
| short option  | `-V`           | show version number and quit |
| long option   | `-version`     | show version number and quit |
| boolean option| `curl --path-as-is https://example.com/../../etc/password` | tell curl to not handle sequences of `/../` or `/./` in the given url path |
| options with arguments | `--write-out "received %{path-as-is}` | ... |
| negative boolean options | `--no-path-as-is` |  providing `--path-as-is` multiple times has no extra effect, disable it again with `--no-path-as-is` |
| combinatorial explosion | *** | ... |
| availability depends on version | *** | ... | 

-  257 command line options with a rate of 10 new options per year
-  therefore there will be a new sets of ~10 options available every year
-  availability will depend on certain builds, availability will depend on 3rd party libraries (and their versions)

##  `URLs` / `URi` by `RFC 3986+`

##  `scheme://user:password@host:1234/path?query#fragment`

-  `RFC 3986+` really
-  no spaces, use `%20`
-  schemeless means guess, if you just provide a hostname it guesses the scheme
-  url encode thenm when using passwords
-  name and password - remeber url encode
-  hostname can be name, IDN name, IPv4 address or IPv6 address
-  `https://example.com` - name
-  `https://日本語.tw` - IDN name
-  `ftp://192.168.0.1/` - IPv4 address
-  `imap://[2a04:4e42:800::347]/` -  IPv6 address

anything that is not an option is a url, that's the only thing you can provide to curl.  therefore in the following graph there are input parameters are the `url` and the `options`, these are characterized as command line inputs, in the graph they will be represented as input parameters, parameters can be from `[0...*]` 

```mermaid
flowchart LR
    subgraph CLI[input parameters]
        direction TB
            F(url)
            F(url) -.- U(option)
            U(option) -.-
            U(option)
    end


    F(url) -.-> CU(curl)
    U(option) -.-> CU(curl)
    CU(curl) --> OUT(output)

```

##  `URL` / `URI` (universal resource identifier)

url port numbers

a port number is from 0 to 65535, each url scheme has a default port that curl uses

unless another is set in the url for example `curl https://example.com:8080/`

urls and browsers, and their address bars, not every address bar is treated the same and the browsers use a different browser, there is no global url standard.  one tool meant something and the other tool does something completely different with another piece of url. 

no limit to the number of urls curl accepts as many as possible

every downloaded url needs a destination `-stdout` or a file

`curl -o file1 -o file2 https://example.com/file1 https://curl.se/file2`

`curl -o file1 https://example.com/file1 -o file2 https://curl.se/fule2`

`curl -O https://example.com/file1 -O https://curl.se/file2`

`curl https://example.com/file1 https://curl.se.file2 > everything --remote=name-all` automatically sets `-0` for all URLs

##  query

<html><code>scheme://user:password@host:1234/path/?query#fragment</code></html>

queries are often `name=value` pairs separated by amperands (`&`)

`name=daniel & tool=curl & age=old`

add query parts to the url with `--url-query [content]`

"value" gets url encoded to keep the url fine

`name@file` reads the content from file before encoding it and more

`curl https://example.com --url-query "name=Daniel Stenberg"`

##  `trurl` (companion tool to CURL) ☞ download the tool at `https://curl.se.trurl/`

created in the spring of 2023, parses and manipulates URLs, companion tool to curl 

example usage includes

`trurl --url https://curl.se -set host=example.com`

`trurl --url https://curl.se/we/are.html --redirect here.html`

`trurl --url https://curl.se/we/../are.html --set port=8080`

this is a companion tool created from the same developers that have worked on curl, it is a tool that parses and manipulates urls.  it is there to help you create, update, fiddle, extract, manage urls.

for example if you have a url but you want to change the host name.  basically shell scripts without manually parsing urls yourself.  you can make it's output as a `JSON` object.

##  `URL` globbing 

"globbing" = ranges and lists so instead of you writing the same url 100 times, you can use this range instead within the url.  you can even have it 0 prefixed, or even do jumps with different syntax, or even lists.

`[1-100]`

`[001-100]`

`[a-z]`

`[001-100:10]`

`[a-z:2]`

`{one,two,three}`

`{mon,tue,wed,thu}`

`$ curl https://{ftp,www,test}.example.com/img[2-22].jpg -o "hey_#2_#1.jpg"`

URL globbing enables can do up to $9 \times{10^{18}} \text{ string iterations} $ per 1 url

`--globoff` turns it off, the design of this features may need globoff

##  parallel transfers

by default urls are transferred serially, one by one.  iterating through the list of provided urls sequentially may be inefficient, therefore there is a feature called parallel transfers.  

##  `-Z, --parallel`

by default up to 50 simultaneous at a time.  if you provide more than 50 it will put the rest in a queue and then pull back from the 50 to keep the 50 alive 24/7.  you can go up to 300 max and it is capped and if you go up a set level you can cause problems with your operating system.

```
-Z, --parallel
              Makes curl perform its transfers in parallel as compared to  the
              regular serial manner.

              This option is global and does not need to be specified for each
              use of -:, --next.

              Providing -Z, --parallel multiple times  has  no  extra  effect.
              Disable it again with --no-parallel.

              Example:
               curl --parallel https://example.com -o file1 https://example.com -o file2
```

change with `--parallel-max [num]`

prefer speed to multiplexing with `--parallel-immediate`

works for downloads and uploads

## list curl options

will always list the most widely used and common options

<details><summary><code>$ curl --help</code>
</summary>
<code>

Usage: curl [options...] <url>

 -d, --data <data>          HTTP POST data

 -f, --fail                 Fail fast with no output on HTTP errors

 -h, --help <category>      Get help for commands

 -i, --include              Include protocol response headers in the output

 -o, --output <file>        Write to file instead of stdout

 -O, --remote-name          Write output to a file named as the remote file

 -s, --silent               Silent mode

 -T, --upload-file <file>   Transfer local FILE to destination

 -u, --user <user:password> Server user and password

 -A, --user-agent <name>    Send User-Agent <name> to server

 -v, --verbose              Make the operation more talkative

 -V, --version              Show version number and quit


This is not the full help, this menu is stripped into categories.

Use "--help category" to get an overview of all categories.

For all options use the manual or "--help all".

</code>
</details>

<details><summary><code>$ curl --help category</code>
</summary>
<code>

Usage: curl [options...] <url>

 auth        Different types of authentication methods

 connection  Low level networking operations

 curl        The command line tool itself

 dns         General DNS options

 file        FILE protocol options

 ftp         FTP protocol options

 http        HTTP and HTTPS protocol options

 imap        IMAP protocol options

 misc        Options that don't fit into any other category

 output      Filesystem output

 pop3        POP3 protocol options

 post        HTTP Post specific options

 proxy       All options related to proxies

 scp         SCP protocol options

 sftp        SFTP protocol options

 smtp        SMTP protocol options

 ssh         SSH protocol options

 telnet      TELNET protocol options

 tftp        TFTP protocol options

 tls         All TLS/SSL related options

 upload      All options for uploads

 verbose     Options related to any kind of command line output of curl

</code>
</details>

##  config file

a config file is a command line in a file, option (plus argument) per line

`$HOME/.curlrc` is used, `-K [file] or --config [file]`

can be read from `stdin` 

can be generated and huge

configuration files as a 10MB line length limit

##  passwords

`-u name:password`

`.netrc (more soon)`

`config file` 

`local leakage`, from process lists 

`network leakage` you may send the credentials over the network, and the passwords will be in the network

see the password fly by and steal it from you

`debug log leakage`

##  progress meters

unless `-s`, `--silent` or `--no-progress-meter`

`-#`, `--progress-bar`

`|#################################################################-----------------------------------| %84 `

different again doing parallel transfers

| DL%      |UL%     |Dled    |Uled    |Xfers      |Live     |Total       |Current     |Left        |Speed     |
|:--------:|:------:|:------:|:------:|:---------:|:-------:|:----------:|:----------:|:----------:|:--------:|
| 12%      | --     | 34.5G  | 0      | 2         | 2       | `--:--:--` | `00:00:00` | `--:--:--` | `13903M` |

when it comes to parallel transfers it's harder for curl to know the total expected time and total expected knowledge at that particular moment in time when it does a progress bar.

####  `--next`

there are many things in the curl command line that adds stuff up and then do another thing

do everything to the left of it

then reset the state

continue on the other side

in perpetuity

```bash
$ curl -H "header: one" https://example.com/one -H "header: two" https://example.com/two
```

```bash
$ curl -H "header: one" https://example.com/one --next -H "header: two" https://example.com/two
```

```bash
❯ man curl | grep -- '--next'
       -:, --next
               curl www1.example.com --next -d postthis www2.example.com
               curl https://example.com --next -d postthis www2.example.com
               curl -I https://example.com --next https://example.net/

~                                                                                                                                                                                                                                                                     4s  04:05:32 PM
❯ 
```


##  URL
       The URL syntax is protocol-dependent. You find a detailed description
       in RFC 3986.

       You can specify multiple URLs or parts of URLs by writing part sets
       within braces and quoting the URL as in:

         "http://site.{one,two,three}.com"

       or you can get sequences of alphanumeric series by using [] as in:

         "ftp://ftp.example.com/file[1-100].txt"

         "ftp://ftp.example.com/file[001-100].txt"    (with leading zeros)

         "ftp://ftp.example.com/file[a-z].txt"

       Nested sequences are not supported, but you can use several ones next
       to each other:

         "http://example.com/archive[1996-1999]/vol[1-4]/part{a,b,c}.html"

       You can specify any amount of URLs on the command line. They will be
       fetched in a sequential manner in the specified order. You can specify
       command line options and URLs mixed and in any order on the command
       line.

       You can specify a step counter for the ranges to get every Nth number
       or letter:

         "http://example.com/file[1-100:10].txt"

         "http://example.com/file[a-z:2].txt"

       When using [] or {} sequences when invoked from a command line prompt,
       you probably have to put the full URL within double quotes to avoid the
       shell from interfering with it. This also goes for other characters
       treated special, like for example '&', '?' and '*'.

       Provide the IPv6 zone index in the URL with an escaped percentage sign
       and the interface name. Like in

         "http://[fe80::3%25eth0]/"

       If you specify URL without protocol:// prefix, curl will attempt to
       guess what protocol you might want. It will then default to HTTP but
       try other protocols based on often-used host name prefixes. For
       example, for host names starting with "ftp." curl will assume you want
       to speak FTP.

       curl will do its best to use what you pass to it as a URL. It is not
       trying to validate it as a syntactically correct URL by any means but
       is fairly liberal with what it accepts.

       curl will attempt to re-use connections for multiple file transfers, so


## curl version

❯ curl -V

curl 7.88.1

(x86_64-apple-darwin22.0) 
libcurl/7.88.1 
(SecureTransport) 
LibreSSL/3.3.6 
zlib/1.2.11 
nghttp2/1.51.0

Release-Date: 2023-02-20

Protocols: dict file ftp ftps gopher gophers http https imap imaps ldap ldaps mqtt pop3 pop3s rtsp smb smbs smtp smtps telnet tftp

Features: alt-svc AsynchDNS GSS-API HSTS HTTP2 HTTPS-proxy IPv6 Kerberos Largefile libz MultiSSL NTLM NTLM_WB SPNEGO SSL threadsafe UnixSockets

##  `--verbose` or `-v`

Make the operation more talkative

`-vv`
`--trace-ascii` or `--trace`
`--trace-time` - what in a certain procedure is a diffcult time
`--trace-ids` - good for parallel transfers

becareful with transfers

`curl -d moo --trace - https://localhost/`

❯ curl -d moo --trace - https://localhost/
== Info:   Trying 127.0.0.1:443...
== Info: connect to 127.0.0.1 port 443 failed: Connection refused
== Info:   Trying [::1]:443...
== Info: connect to ::1 port 443 failed: Connection refused
== Info: Failed to connect to localhost port 443 after 4 ms: Couldn't connect to server
== Info: Closing connection 0
curl: (7) Failed to connect to localhost port 443 after 4 ms: Couldn't connect to server

##  `--write-out`

outputs text, information and HTTP headers after a transfer is completed

##  persistent connections illustrated

`$ curl https://example.com/file1`

##  downloads

downlpad to a file named by the uyrl `-O (--remote-name)`

**danger!**

shell redirect works:  `curl https://curl.se > output.txt`

`curl https://curl.se https://example.com > output.txt`

maximum file size accepted: `--max-filesize <bytes>`

`which curl` -> `usr/bin/curl`

file size often not knonw ahead of time

`--output-dir` saves the `-O` data in another directory

` -o, --output <file>            Write to file instead of stdout`

`     --output-dir <dir>         Directory to save files in`

`--create-dirs` create necessary local directory hierarchy



##  retry

sometimes when a transfer fails, and for example what if you have a `cron job` for currency rates overnight, ensuring that `curl` redoes  it all over again.  if a **transient** error is returned when curl tries to perform a transfer.

do a few retries:  `--retry [num]`

retry for this long `--retry-max-time <seconds>`

consider "connection refused" to be transient:  `--retry-connrefused`

consider **all** errors transient:  `--retry-all-errors`

##  uploads

from client up to the server.  whatever protocol youre using you upload this data and send it to the server

`curl -T file $URL`

if URL has no file name part, appends the `-T` name to the URL

`curl -T file ftp://example.com/path/`

HTTP offers several different uploads

##  transfer controls

stop slow transfers

```bash
--speed-limit <speed> --speed-tie <seconds>
```

transfer rate limiting, you dont want to clog up the pipe that uses all bandwith, this should be the maximum bandwith you use.

```bash
curl --liit-rare 100K https://example.com
```

no more than this number of transfer starts per time unit

```bash
curl --rate 2/s https://example.com/[1-20].jpg
curl --rate 3/h https://example.com/[1-20].html
curl --rate 14/m https://example.com/day/[1-365]/fun.html
```

##  naming tricks

provide a name + port => address mapping.  this allows you to fiddle and SMI and TLS negotions.  when you use the right name in the SMI part this decides which type of certificate should the server provide to you the certificate of authenticiation

`curl --resolve example.com:443:127:0.0.1 https://example.com/`

`curl --resolve example.com:80:[2a04:4e42:200::347] https://example.com/`

taking http, it is also sometimes fun/useful

##  connection race

curl uses both `IPv6` and `IPv4` when possible and **races** them against each other

"Happy eyeballs"

restrict to a fixed IP version with `--ipv4` or `--ipv6`

##  connections

use a specific network interface

`curl --interface enp3s0 https://example.com`

local port number range

`curl --local-port 1000-3000 https://example.com`

TCP keep alive - help curl detect when curl disconnects

`curl --keepalive-time 23 https://example.com/`

DNS server (when c-ares is used)

`curl --dns-ipv4-addr 10.1.2.3 https://example.com`

##  timeouts

maximum total time allowed to speed.

`curl --max-time 12.34 https://curl.se/`

never spend more than this time to connect

`curl --connect-timeout 3.14 https://remote.example.com/`

##  `.netrc`

`.netrc` is for FTP servers.  a file for users to store their credentials for remote FTP servers

`$HOME/.netrc`

since 1978 

`--netrc` makes curl use it

`netrc-file [file]` to use another file 

for all protocols, but beware: weakly specified

```bash
cat $HOME/.netrc
machine example.com
login daniel
password qwerty
```

##  exit status

if youre running curl through shell scrips, you are running curl rom shell scripts then the exit code stays at 0, 0 means there are no errors.  if it doesnt return to 0 then it will throw a new numerical value.

the numerical value `curl` returns back to the shell/prompt

zero for success

conveys the reason for errors

can be tested for in shell scripts

```bash
curl -o save https://example.com
```


```
EXIT CODES
       There are a bunch of different error codes and their corresponding error messages that may appear under error
       conditions. At the time of this writing, the exit codes are:

       0      Success. The operation completed successfully according to the instructions.

       1      Unsupported protocol. This build of curl has no support for this protocol.

       2      Failed to initialize.

       3      URL malformed. The syntax was not correct.

       4      A feature or option that was needed to perform the desired request was not enabled or was explicitly
              disabled at build-time. To make curl able to do this, you probably need another build of libcurl.

       5      Could not resolve proxy. The given proxy host could not be resolved.

       6      Could not resolve host. The given remote host could not be resolved.

       7      Failed to connect to host.

       8      Weird server reply. The server sent data curl could not parse.

       9      FTP access denied. The server denied login or denied access to the particular resource or directory you
              wanted to reach. Most often you tried to change to a directory that does not exist on the server.

       10     FTP accept failed. While waiting for the server to connect back when an active FTP session is used, an
              error code was sent over the control connection or similar.

       11     FTP weird PASS reply. Curl could not parse the reply sent to the PASS request.

       12     During an active FTP session while waiting for the server to connect back to curl, the timeout expired.

       13     FTP weird PASV reply, Curl could not parse the reply sent to the PASV request.

       14     FTP weird 227 format. Curl could not parse the 227-line the server sent.

       15     FTP cannot use host. Could not resolve the host IP we got in the 227-line.

       16     HTTP/2 error. A problem was detected in the HTTP2 framing layer. This is somewhat generic and can be one
              out of several problems, see the error message for details.

       17     FTP could not set binary. Could not change transfer method to binary.
```



##  SCP and SFTP

ssh-based nstead of tls

```bash
curl sftp://example.com/file.zip -u user
curl scp://example.com/file.zip -u user
curl sftp://example.com/ -u user
curl sftp://example.com/~/todo.txt -u daniel
curl sftp://example.com -u user --insecure ## AVOID INSECURE AT ALL COSTS
```

`~/.ssh/known_hosts` default file that basically remembers the fingerprints from the servers you have access in the past and will know if the servers changed in the past.

##  reading email

`POP2 / IMAP` reading is download, reading an email is getting data

```
curl pop3://example.com
curl imap://example.com
```

usually want to add fils

##  sending email

`SMTP` sending is uploading

`curl -T data smtp://example.com/ -u user:password`

the file needs to have all the mail headers (To, From, Subject,...) curl doesnt know about content and cannot make mail content, but it knows how to send the actual mail.

##  `MQTT` for embedded systems

subscribe to the bedroom temperature in the subject

`curl mqtt://example.com/home/bedroom/temp`

set teh kitchen dimmer:

`curl -d 75 mqtt://example.com/home/kitchen/dimmer`

essentially subscribing to the temperature or you can set the data with the `MQTT` protocol

##  `TFTP` trivial file transfer protocol

donwload a file from the `TFTP` server

`curl -O tftp://localserver/file.boot`

upload a file to your TFTP server

`curl -T file.boot tftp://localserver/`


<details><summary><code>./curl-config</code></summary>
<code>

#! /bin/sh
#***************************************************************************
#                                  _   _ ____  _
#  Project                     ___| | | |  _ \| |
#                             / __| | | | |_) | |
#                            | (__| |_| |  _ <| |___
#                             \___|\___/|_| \_\_____|
#
# Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.
#
# This software is licensed as described in the file COPYING, which
# you should have received as part of this distribution. The terms
# are also available at https://curl.se/docs/copyright.html.
#
# You may opt to use, copy, modify, merge, publish, distribute and/or sell
# copies of the Software, and permit persons to whom the Software is
# furnished to do so, under the terms of the COPYING file.
#
# This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
# KIND, either express or implied.
#
# SPDX-License-Identifier: curl
#
###########################################################################

```
prefix="/usr"
exec_prefix=/usr
includedir=/usr/include
cppflag_curl_staticlib=

usage()
{
    cat <<EOF
Usage: curl-config [OPTION]

Available values for OPTION include:

  --built-shared says 'yes' if libcurl was built shared
  --ca        ca bundle install path
  --cc        compiler
  --cflags    pre-processor and compiler flags
  --checkfor [version] check for (lib)curl of the specified version
  --configure the arguments given to configure when building curl
  --features  newline separated list of enabled features
  --help      display this help and exit
  --libs      library linking information
  --prefix    curl install prefix
  --protocols newline separated list of enabled protocols
  --ssl-backends output the SSL backends libcurl was built to support
  --static-libs static libcurl library linking information
  --version   output version information
  --vernum    output the version information as a number (hexadecimal)

EOF

    exit $1
}

if test $# -eq 0; then
    usage 1
fi

while test $# -gt 0; do
    case "$1" in
    # this deals with options in the style
    # --option=value and extracts the value part
    # [not currently used]
    -*=*) value=`echo "$1" | sed 's/[-_a-zA-Z0-9]*=//'` ;;
    *) value= ;;
    esac

    case "$1" in
    --built-shared)
        echo yes
        ;;

    --ca)
        echo 
        ;;

    --cc)
        echo "cc"
        ;;

    --prefix)
        echo "$prefix"
        ;;

    --feature|--features)
        for feature in AsynchDNS GSS-API HTTPS-proxy IPv6 Kerberos Largefile MultiSSL NTLM NTLM_WB SPNEGO SSL UnixSockets alt-svc libz ""; do
            test -n "$feature" && echo "$feature"
        done
        ;;

    --protocols)
        for protocol in DICT FILE FTP FTPS GOPHER GOPHERS HTTP HTTPS IMAP IMAPS LDAP LDAPS MQTT POP3 POP3S RTSP SMB SMBS SMTP SMTPS TELNET TFTP; do
            echo "$protocol"
        done
        ;;

    --version)
        echo libcurl 7.88.1
        exit 0
        ;;

    --checkfor)
        checkfor=$2
        cmajor=`echo $checkfor | cut -d. -f1`
        cminor=`echo $checkfor | cut -d. -f2`
        # when extracting the patch part we strip off everything after a
        # dash as that's used for things like version 1.2.3-CVS
        cpatch=`echo $checkfor | cut -d. -f3 | cut -d- -f1`

        vmajor=`echo 7.88.1 | cut -d. -f1`
        vminor=`echo 7.88.1 | cut -d. -f2`
        # when extracting the patch part we strip off everything after a
        # dash as that's used for things like version 1.2.3-CVS
        vpatch=`echo 7.88.1 | cut -d. -f3 | cut -d- -f1`

        if test "$vmajor" -gt "$cmajor"; then
            exit 0;
        fi
        if test "$vmajor" -eq "$cmajor"; then
            if test "$vminor" -gt "$cminor"; then
                exit 0
            fi
            if test "$vminor" -eq "$cminor"; then
                if test "$cpatch" -le "$vpatch"; then
                    exit 0
                fi
            fi
        fi

        echo "requested version $checkfor is newer than existing 7.88.1"
        exit 1
        ;;

    --vernum)
        echo 075801
        exit 0
        ;;

    --help)
        usage 0
        ;;

    --cflags)
        if test "X$cppflag_curl_staticlib" = "X-DCURL_STATICLIB"; then
          CPPFLAG_CURL_STATICLIB="-DCURL_STATICLIB "
        else
          CPPFLAG_CURL_STATICLIB=""
        fi
        if test "X/usr/include" = "X/usr/include"; then
          echo "$CPPFLAG_CURL_STATICLIB"
        else
          echo "${CPPFLAG_CURL_STATICLIB}-I/usr/include"
        fi
        ;;

    --libs)
        if test "X/usr/lib" != "X/usr/lib" -a "X/usr/lib" != "X/usr/lib64"; then
           CURLLIBDIR="-L/usr/lib "
        else
           CURLLIBDIR=""
        fi
        if test "Xyes" = "Xno"; then
          echo ${CURLLIBDIR}-lcurl @LIBCURL_LIBS@
        else
          echo ${CURLLIBDIR}-lcurl
        fi
        ;;
    --ssl-backends)
        echo "@SSL_BACKENDS@"
        ;;

    --static-libs)
        if test "X@ENABLE_STATIC@" != "Xno" ; then
          echo "/usr/lib/libcurl.@libext@" @LDFLAGS@ @LIBCURL_LIBS@
        else
          echo "curl was built with static libraries disabled" >&2
          exit 1
        fi
        ;;

    --configure)
        echo --enable-hidden-symbols --enable-threaded-resolver --with-gssapi --with-ssl=/usr/local/libressl --with-secure-transport
        ;;

    *)
        echo "unknown option: $1"
        usage 1
        ;;
    esac
    shift
done

exit 0
```

</code>
</details>


