## Install argocd for windows

$version = (Invoke-RestMethod https://api.github.com/repos/argoproj/argo-cd/releases/latest).tag_name


$url = "https://github.com/argoproj/argo-cd/releases/download/" + $version + "/argocd-windows-amd64.exe"
$output = "argocd.exe"

Invoke-WebRequest -Uri $url -OutFile $output

## Login to gRPC

argocd login grpc-argocd.domain.com --insecure --username admin --password nimda

## Add clusters

argocd cluster add k8s-test --server grpc-argocd.domain.com --insecure 

argocd cluster add k8s-prod --server grpc-argocd.domain.com --insecure 

## List clusters

argocd cluster list --server grpc-argocd.domain.com --insecure
