
# Create by local gpt

{ pkgs ? import <nixpkgs> {} }:

let
  # Set up the Kubernetes version and architecture
  k8sVersion = "1.25";
  arch = "x86_64"; # or "aarch64" for ARM-based systems

  # Create a system package group that includes the required dependencies
  systemGroup = pkgs.stdenv.mkDefault {
    name = "kubernetes-system-group";
    groups = [ "${pkgs.bash}" "${pkgs.docker}" ];
  };

  # Define a custom Docker daemon configuration
  dockerConfig = pkgs.writeShellScriptBin "create-docker-config" ''
    #!/bin/bash

    # Set up the Docker daemon configuration
    echo "version=1.40" > /etc/docker/daemon.json
    echo '{"apiVersion": "v1", "storage":"local-sda"}}' >> /etc/docker/daemon.json
  '';

  # Create a system account for Kubernetes services
  k8sUser = pkgs.writeShellScriptBin "create-k8s-user" ''
    #!/bin/bash

    # Create the Kubernetes user and group
    mkdir -p /var/run/kube
    sudo useradd --system --create-home --home-dir=/var/run/kube kubeuser
    sudo groupadd kubeuser

    # Set up the Kubernetes config
    echo "apiVersion: v1" > /etc/kubernetes/admin.conf
    echo "kind: User" >> /etc/kubernetes/admin.conf
    echo "name: kubeuser"
    echo "groups:"
    echo "  - kubeuser"
    echo ""
    echo "roleRef":
      echo "  apiGroups:
        - 'rbac.authorization.k8s.io'"
      echo "  name"
      echo "  apiVersions:"
      echo "    - \"RoleNames\""
    echo ""

    # Create the Kubernetes node configuration
    cat > /etc/kubernetes/manifest.yaml <<EOF
apiVersion: v1
kind: NodeConfig
labels:
  kubernetes.io/hostname: ${pkgs.systemName}
name: ${pkgs.systemName}
EOF

    # Restart the kubelet service to apply the changes
    sudo systemctl restart kubelet
  '';

  # Create a system configuration for Kubernetes
  k8sConfig = pkgs.writeShellScriptBin "create-k8s-config" ''
    #!/bin/bash

    # Create the Kubernetes config file
    cat > /etc/kubernetes/config.yaml <<EOF
apiVersion: v1
kind: Config
preferences: {}
users:
- name: kubeuser
  user:
    serviceaccount:
      namespace: ""
      username: "kubeuser"
      tokenType: "kubernetes.io/service-account-token"
      token: $(echo ${pkgs.serviceAccountToken})
EOF

    # Restart the kubelet service to apply the changes
    sudo systemctl restart kubelet
  '';

in {

  # Enable the system package group
  systemd.user.group = [ systemGroup ];

  # Create a custom Docker daemon configuration
  services.docker = {
    enable = true;
    daemonConfig = dockerConfig;
  };

  # Create a Kubernetes configuration
  services.kubernetes = {
    enable = true;
    k8sVersion = k8sVersion;
    arch = arch;
    config = k8sConfig;
    user = "kubeuser";
  };

}
