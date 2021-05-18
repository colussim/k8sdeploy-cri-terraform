#!/usr/bin/env bash

set -e

scp root@$1:/etc/kubernetes/admin.conf .
