# gRPC, k8s and Linkerd fun

Small project just to see how those 3 things play together.

If you have :apple: machine I recommend to use `k3d`: <https://k3d.io/>. If you have it installed you can use `start-k3d.sh` to deploy cluster with linkerd and gRPC client+server from this directory.
If you want to use any other cluster (e.g created by `kind`), then run only `install-components.sh`.

After that you can look into the logs of `client*` and `server*` pods, as well as use linkerd CLI, for example to run:

```bash
linkerd dashboard
```
