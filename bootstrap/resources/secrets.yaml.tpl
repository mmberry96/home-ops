---
apiVersion: v1
kind: Secret
metadata:
  name: mordex-io-tls
  namespace: cert-manager
  annotations:
    cert-manager.io/alt-name: '*.mordex.io,mordex.io'
    cert-manager.io/certificate-name: mordex-io
    cert-manager.io/common-name: mordex.io
    cert-manager.io/ip-sans: ''
    cert-manager.io/issuer-group: ''
    cert-manager.io/issuer-kind: ClusterIssuer
    cert-manager.io/issuer-name: letsencrypt-production
    cert-manager.io/uri-sans: ''
  labels:
    controller.cert-manager.io/fao: 'true'
type: kubernetes.io/tls
data:
  tls.crt: op://kubernetes/mordex-io-tls/tls.crt
  tls.key: op://kubernetes/mordex-io-tls/tls.key
---
apiVersion: v1
kind: Secret
metadata:
  name: onepassword-secret
  namespace: external-secrets
stringData:
  1password-credentials.json: op://kubernetes/1password/OP_CREDENTIALS_JSON
  token: op://kubernetes/1password/OP_CONNECT_TOKEN
---
apiVersion: v1
kind: Secret
metadata:
  name: sops-age
  namespace: flux-system
stringData:
  age.agekey: op://kubernetes/sops/SOPS_PRIVATE_KEY
