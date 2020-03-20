# etcd browser

Forked From: [http://henszey.github.io/etcd-browser/](http://henszey.github.io/etcd-browser/)

This repository moves the codebase onto a node:13 / alpine container, resolving some unusual DNS resolution failures that I was seeing in kubernetes with the old Ubuntu 14 base.

## To build/run as a Docker container:

(adjust options as necessary - to run it as a daemon, remove "--rm", "-t", "-i" and add "-D")

    cd <repository>
    sudo docker build -t etcd-browser .
    sudo docker run --rm --name etcd-browser -p 0.0.0.0:8000:8000 --env ETCD_HOST=10.10.0.1 --env AUTH_PASS=doe -t -i etcd-browser

### Configuration
You can configure the builtin server using environment variables:

 * AUTH_USER: Username for http basic auth (skip to disable auth)
 * AUTH_PASS: Password for http basic auth
 * ETCD_HOST: IP of the etcd host the internal proxy should use [172.17.42.1]
 * ETCD_PORT: Port of the etcd daemon [4001]
 * SERVER_PORT: Port of built-in server
 
If you use a secured etcd:
 * ETCDCTL_CA_FILE
 * ETCDCTL_KEY_FILE
 * ETCDCTL_CERT_FILE
