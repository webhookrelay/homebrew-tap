# Webhook Relay client

<p align="center">
    <a href="https://webhookrelay.com" target="_blank"><img width="100"src="https://webhookrelay.com/images/sat_logo.png"></a>
</p>

# Introduction

[Webhook Relay](https://webhookrelay.com/) client for Mac/Linux/Windows. Receive webhooks on localhost or other internal services or demo without deployment. Persistent endpoints, works anywhere.

## Installation

Installation instructions can be found [here](https://webhookrelay.com/v1/guide/installation).

## Prior to getting started

If you have a regular (non OAuth) account - just do:
```
relay login
```

If you are using OAuth - head to the [access keys page](https://my.webhookrelay.com/tokens) and create a Key and Secret pair. Use that pair to login.


## Getting started

The best way to learn more about `relay` agent is to dig into the `--help` section:

```bash
$  relay --help

Usage:	relay COMMAND

Webhook Relay - tunnels for webhooks to internal and public services.

By using this product, you are agreeing to the terms of the the AppScension Ltd. Terms of service can be found at: https://webhookrelay.com/terms/

Don't have an account? Create one here: https://my.webhookrelay.com/register

Options:
      --config string   Location of client config files (default "/Users/karolisrusenas/.webhookrelay")
      --help            Print usage
      --tls             Use TLS; implied by --tlsverify (default true)
      --tlsverify       Use TLS and verify the remote
  -v, --version         Print version information and quit

Management Commands:
  bucket      Manage buckets - used to group inputs and outputs together
  ingress     Manage ingresses - reverse tunnels for Kubernetes
  input       Manage inputs - your personal endpoints to receive webhooks
  output      Manage outputs - destinations where requests are relayed
  token       Manage tokens - required for API (OAuth users) and webhook streaming connections
  tunnel      Manage tunnels - bidirectional connections that expose internal services (EXPERIMENTAL)

Commands:
  connect     Connects supplied destination to the public endpoint
  forward     Create forwarding configuration (automatically creates bucket, input endpoint and output destination). If destination and bucket aren't specified - starts a relay for all endpoints
  login       Log in to a Webhook Relay service
  logout      Log out from a Webhook Relay service

Run 'relay COMMAND --help' for more information on a command.
```

or visit documentation page: [https://webhookrelay.com/v1/guide/cli](https://webhookrelay.com/v1/guide/cli).

## Examples (Relay CLI)

### Start one-way forwarding of requests

```bash
$ relay forward -b webhook-demo http://localhost:8090/webhook
Forwarding:
https://my.webhookrelay.com/v1/webhooks/3731509a-2f84-4a60-bb52-1c1ad8c6cc56 -> http://localhost:8090/webhook
starting webhook relay agent...
```

Option `-b` (bucket) is optional, but it will help to reuse buckets.

### Cleanup

To delete buckets that you have created (force is required to ignore existing inputs/outputs in the bucket):

```bash
$ relay bucket rm webhook-demo -f
webhook-demo
```

### Open a two-way tunnel

Tunnels allows you to expose local (localhost, 127.0.0.1 and any other private or external networks), argument after __connect__ command always defines destination:

```bash
$ relay connect -s kubernetes http://127.0.0.1:8001
Connecting:
http://kubernetes.webrelay.io <-- http --> http://127.0.0.1:8001
Starting tunnel relay agent...
```

You can also connect any external service:

```bash
$ relay connect -s hn https://news.ycombinator.com/
Connecting:
http://hn.webrelay.io <-- http --> https://news.ycombinator.com/
Starting tunnel relay agent...
```

* __-s__ flag here sets custom subdomain.

## Examples (Docker relayd)

To start `relayd` agent in a Docker container, supply key and secret through environment variables:

Webhook forwarding mode (default):

```bash
docker run -e KEY=<your key> -e SECRET=<your secret> webhookrelay/webhookrelayd:latest
```

Tunnel mode:

```bash
docker run -e KEY=<your key> -e SECRET=<your secret> webhookrelay/webhookrelayd:latest --mode tunnel
```

## See it in action

* Demo your website without deploying: https://webhookrelay.com/v1/examples/demoing-your-website.html
* Receiving webhooks on localhost: https://webhookrelay.com/v1/examples/receiving-webhooks-on-localhost.html

## Reporting issues

Issues or questions can be asked [here](https://github.com/webrelay/client/issues) or via email <a href="mailto:support@webhookrelay.com" class="nav-link" rel="nofollow">support@webhookrelay.com</a>..


