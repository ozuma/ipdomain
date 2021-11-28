Samples for RiksIQ Passive Total.

# Environment

Set your API Key to ENV variable.

```
export RISKIQ_USER=abc@example.com
export RISKIQ_KEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
```

# API Endpoint

```
https://api.passivetotal.org/<API_NAME>
```

# Samples

## Account Check

```
$ ./getAccount.sh
```

When you want to Human-Readable:

```
$ ./getAccount.sh | jq .
```

# Offical Resources

## Client Library (PyPI)
https://pypi.org/project/passivetotal/

### Document
https://passivetotal.readthedocs.io/en/latest/

## API Document
https://api.passivetotal.org/index.html

