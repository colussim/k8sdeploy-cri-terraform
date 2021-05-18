output "kubeadm_join_command" {
  value = "data.external.kubeadm_join.result['command']"
}
