# Maistra Istio Operator Integration Test

This integration test suite is similar to the upstream Istio integration tests. The scripts `lib.sh`, `kind_provisioner.sh` and `istio-integ-suite-kind.sh` are copied from `github.com/maistra/istio` repo.

## How to Run it Manually

1. Create a builder container:

```
$ docker pull registry.ci.openshift.org/ci/maistra-builder:upstream-master
$ docker run -d -t --rm \
    --name test \
    --privileged \
    -v /var/lib/docker \
    registry.ci.openshift.org/ci/maistra-builder:upstream-master \
    entrypoint tail -f /dev/null
```

2. Copy this istio-operator integration tests source code into the container
   Copy OCP kubeconfig into container

```
$ cd $(git rev-parse --show-toplevel)
$ docker cp . test:/work
$ docker cp ~/.kube/ test:/
$ docker cp `which oc` test:/bin
```

3. Run `operator-integ-suite-ocp.sh` in the builder container

```
$ docker exec -it test /bin/bash
git config --global --add safe.directory /work
oc login [OCP API server] --kubeconfig /work/ci-kubeconfig
cd work
(root@) make test.integration.ocp
```