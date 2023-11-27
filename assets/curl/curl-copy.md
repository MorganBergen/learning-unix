#  information guide outside the `curl --manual`

```
                                  _   _ ____  _
                              ___| | | |  _ \| |
                             / __| | | | |_) | |
                            | (__| |_| |  _ <| |___
                             \___|\___/|_| \_\_____|
```



###  table of contents

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

####  supporting protocols 

`HTTPS`, `GOPHERS`, `FTPS`, `TELNET`, `DICT`, `LADAPS`, `FILE`, `TFTD`, `SCP`, `SFTPS`, `IMAPS`, `POP3S`, `SMTPS`, `RTSP`, `RTMPS`, `SMBS`, `MQTT`, `WSS`

####  graph

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

###  `[options...]` types

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

####  `scheme://user:password@host:1234/path?query#fragment`

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

####  `-Z, --parallel`

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

####  config file

a config file is a command line in a file, option (plus argument) per line

`$HOME/.curlrc` is used, `-K [file] or --config [file]`

can be read from `stdin` 

can be generated and huge

configuration files as a 10MB line length limit

####  passwords

`-u name:password`

`.netrc (more soon)`

`config file`

`local leakage`, from process lists 

`network leakage` you may send the credentials over the network, and the passwords will be in the network

see the password fly by and steal it from you

`debug log leakage`

####  progress meters


TINMESTAMP 55:30 OF mastering the curl command line with daniel stenberg















































