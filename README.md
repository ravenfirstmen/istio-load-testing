# About

Simple Istio (https://istio.io/) load testing with Fortio (https://fortio.org/)

## How

1 - Execute `create-cluster.sh`

2 - Install istioctl (https://istio.io/latest/docs/setup/install/istioctl/)

3 - Install istio default profile `istioctl install`

4 - Install `sample/addons` (Kiali, grafana, prometheus, etc) `kubectl apply -f [[istio instalation directory]]/samples/addons`

5 - Install fortio server deployments `kubectl apply -f fortio/server`

6 - Install fortio clients deployments `kubectl apply -f fortio/client`

7 - Wait until jobs are finished

8 - Check the results in `results` folder. Hint: run `fortio report` on results folder 

