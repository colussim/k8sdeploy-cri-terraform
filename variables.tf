variable "redhat_version" {
  default = "7"
  description = "RedHat Version" 
}

variable "os_version" {
  default = "CentOS_7"
description = "OS Version : Centos 8 = CentOS_8 - Centos 8 Stream = CentOS_8_Stream - Centos 7 = CentOS_7"
}

variable "crio_version" {
  default     = "1.21"
  description = "CRI-O Version The CRI-O version must match the version of your Kubernetes."
}

variable "k8s_version" {
  default = "1.21.1-0.x86_64"
  description = "kubernetes version"
}

variable "master" {
  default = "k8s1.hpemscc.hpecic.net"
  description = "Hostname master node"
}

variable "nodes" {
  default =2 
  description = "Number of Worker"
}

variable "worker" {
    type = list
    default = ["k8s2.hpemscc.hpecic.net", "k8s3.hpemscc.hpecic.net"]
    description = "Hostname for worker node"
}

variable "clustername" {
  default = "epc-k8s1"
  description = "K8S Cluster name"
}

variable "user" {
  default = "root"
  description = "Default User for ssh connexion"
}

variable "private_key" {
  type        = string
  default     = "/root/.ssh/id_rsa"
  description = "The path to your private key"
}

