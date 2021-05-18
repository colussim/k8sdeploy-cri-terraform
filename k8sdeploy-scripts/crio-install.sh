#!/usr/bin/env bash

set -e

OS_VERSION=$1
CRIO_VERSION=$2
VERSIONPKG=$3

sudo curl -L -o /etc/yum.repos.d/devel:kubic:libcontainers:stable.repo https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS_VERSION/devel:kubic:libcontainers:stable.repo
sudo curl -L -o /etc/yum.repos.d/devel:kubic:libcontainers:stable:cri-o:$VERSION.repo https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable:cri-o:$CRIO_VERSION/$OS_VERSION/devel:kubic:libcontainers:stable:cri-o:$CRIO_VERSION.repo

yum -q list installed  yum-utils  &>/dev/null && echo "Installed" ||yum install -y yum-utils
#yum -q list installed  runc  &>/dev/null && echo "Installed" ||yum install -y runc
#yum -q list installed containerd.io &>/dev/null && echo "Installed" && yum remove -y containerd.io 
#yum -y install https://download.docker.com/linux/centos/$VERSIONPKG/x86_64/stable/Packages/containerd.io-1.4.4-3.1.el7.x86_64.rpm
#yum -q list installed  oci-runtime  &>/dev/null && echo "Installed" ||yum install -y oci-runtime
yum -q list installed cri-o &>/dev/null && echo "Installed" || yum install -y cri-o

/bin/cp -rf /tmp/k8sdeploy-scripts/crio.conf /etc/crio/ 
/usr/bin/systemctl daemon-reload
/usr/bin/systemctl enable cri-o 
/usr/bin/systemctl start cri-o 
