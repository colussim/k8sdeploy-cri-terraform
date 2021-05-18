#!/usr/bin/env bash

K8_VERSION=$1

set -x
/usr/sbin/setenforce 0
/bin/sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
/usr/bin/systemctl stop firewalld
/usr/bin/systemctl disable firewalld.service
/usr/sbin/swapoff -a
/bin/sed -i '/swap/ s/^/# /' /etc/fstab 
/bin/cp /tmp/k8sdeploy-scripts/kubernetes.repo  /etc/yum.repos.d
yum install -y kubelet-$K8_VERSION kubeadm-$K8_VERSION kubectl-$K8_VERSION 
/usr/bin/systemctl enable kubelet.service
/usr/bin/systemctl restart kubelet 

