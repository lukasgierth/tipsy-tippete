install-recommended-misetools:
    #!/usr/bin/env bash
    function implement() {
        mise install "${1}"@latest
        mise use -g "${1}"@latest
    }

    implement calicoctl
    implement cosign
    implement go
    implement helm
    implement k9s
    implement kubecolor
    implement kubectl
    implement kustomize
    implement nodejs
    implement opentofu
    implement talosctl
    implement trivy
    implement velero
