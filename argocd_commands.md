# Install argocd for Windows

```powershell
$version = (Invoke-RestMethod https://api.github.com/repos/argoproj/argo-cd/releases/latest).tag_name

$url = "https://github.com/argoproj/argo-cd/releases/download/" + $version + "/argocd-windows-amd64.exe"
$output = "argocd.exe"

Invoke-WebRequest -Uri $url -OutFile $output
```

# Install argocd for Linux (works also in WSL2)

```bash
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64
```

# Install argo-rollouts kubectl plugin for Linux

```bash
curl -LO https://github.com/argoproj/argo-rollouts/releases/latest/download/kubectl-argo-rollouts-linux-amd64
chmod +x ./kubectl-argo-rollouts-linux-amd64
sudo mv ./kubectl-argo-rollouts-linux-amd64 /usr/local/bin/kubectl-argo-rollouts
kubectl argo rollouts version
source <(kubectl-argo-rollouts completion bash)
```

# Commands

## Login to gRPC

```bash
argocd login grpc-argocd.domain.com --insecure --username admin --password nimda
```

## Add clusters

```bash
argocd cluster add k8s-test --server grpc-argocd.domain.com --insecure 
argocd cluster add k8s-prod --server grpc-argocd.domain.com --insecure 
```

## List clusters

```bash
argocd cluster list --server grpc-argocd.domain.com --insecure
```
