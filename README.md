# kubectl-helm
Minimal Docker image with `kubectl` and `helm` command available with a ~BASH~ **sh**ell

### Build locally
`docker build . -t aniskhan001/kubectl-helm:3.1.2 --build-arg K8S_VERSION=v1.18.2 --build-arg HELM_VERSION=v3.1.2`


### Version charts

| `release` | `helm` | `kubectl` | `alpine` | `helm-gcs` |
|    :-:    |  :-:   |    :-:    |   :-:    |    :-:     |
| 3.0.0 | 3.0.0 | 1.16.2 | 3.10 | --- |
| 3.1.1 | 3.1.1 | 1.17.3 | 3.11 | 0.3.1 |
