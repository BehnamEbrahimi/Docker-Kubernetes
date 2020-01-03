# Https Setup with Kubernetes

## Domain Purchase

_This setup is detailing domains purchased specifically with [Google Domains](domains.google.com)_

Purchase domain from **[domains.google.com](domains.google.com)**

## Domain Name Setup

Copy IP Address from GCP > Kubernetes Engine > Services: **Endpoint with port 80**

Back at [Google Domains](domains.google.com) go to DNS of your website then scroll to bottom of page to **Custom resource records**

Enter the following records. Be sure to add the IP address **without** the port number

| Name | Type  | TTL | Data        |
| :--- | :---- | :-- | :---------- |
| @    | A     | 1H  | (Copied IP) |
| www  | CNAME | 1H  | (domain)    |

_Note: I had a problem entering these values after making a error. The solution was to enter them in a Private Mode tab in the browser to eliminate cached values._

## Cert Manager Install

Package: [cert-manager](github.com/jetstack/cert-manager)

Docs: [Installing Cert Manager with Helm](https://cert-manager.readthedocs.io/en/latest/getting-started/2-installing.html#with-helm)\
(Note: for some reason I had to reinstall Helm before I could run the following)_

```bash
# GCloud shell
$ helm install \
    --name cert-manager \
    --namespace kube-system \
    stable/cert-manager
```

## Verify the Certificate

Note: wait 15 minutes after updating before checking

```bash
# GCloud shell
kubectl get certificates
kubectl describe certificates
kubectl get secrets
```
