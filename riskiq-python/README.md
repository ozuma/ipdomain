# Usage

https://github.com/passivetotal/python_api

```
$ pip3 install passivetotal

# check
$ pt-config setup -h

# Initialize
$ pt-config setup abc@example.com
API secret:
```

## Hostname Analyze

```
$ python3
>>> from passivetotal import analyzer
>>> analyzer.init()
>>> age = analyzer.Hostname('xxxx.example.com').whois.age
>>> print('Domain is {} days old'.format(age))
Domain is 139 days old
```

analyzer() returns `PdnsResolutions` object.

https://passivetotal.readthedocs.io/en/latest/analyzer.html#passivetotal.analyzer.pdns.PdnsResolutions

## PassiveDNS

### Summary Output
```
>>> ip = analyzer.IPAddress('155.94.xx.xx')
>>> print(ip.summary)
133 records available for 155.94.xx.xx
>>> for record in ip.resolutions:
...     print(record)
... 
    A "jfgcvf.example.jp" [   7 days] (2022-07-02 to 2022-07-09)
    A "fgdsx.example.com" [   5 days] (2022-07-03 to 2022-07-09)
.......
```

### Hostname List

```
>>> ip = analyzer.IPAddress('155.94.xx.xx')
>>> for record in ip.resolutions:
...     print(record.hostname)
... 
jfgcvf.example.jp
fgds.example.com
......
```

