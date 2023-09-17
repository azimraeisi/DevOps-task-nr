#Install the cert-manager Helm chart (More details:https://cert-manager.io/docs/installation/)
source vars.txt
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install \
  cert-manager jetstack/cert-manager \
  --version v1.13.0 \
  --set installCRDs=true

cat <<EOF > cert-manager.yaml
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-prod
spec:
  acme:
    # The ACME server URL
    server: https://acme-v02.api.letsencrypt.org/directory
    # Email address used for ACME registration
    email: raeesi.azim@gmail.com
    # Name of a secret used to store the ACME account private key
    privateKeySecretRef:
      name: letsencrypt-prod-key
    # Enable the HTTP-01 challenge provider
    solvers:
    - http01:
        ingress:
          class: nginx
EOF

kubectl apply -f cert-manager.yaml



cat <<EOF > request-cert.yaml
# my-certificate.yaml
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: my-certificate
  namespace: default
spec:
  secretName: my-certificate-tls
  issuerRef:
    name: letsencrypt-prod
    kind: ClusterIssuer
  commonName: word.raeisi.org
  dnsNames:
  - word.raeisi.org

EOF

kubectl apply -f request-cert.yaml

sleep 120

kubectl patch ingress wordpress-app-phpmyadmin --type='json' -p="[{\"op\": \"add\", \"path\": \"/spec/tls\", \"value\": [{\"hosts\":[\"$YourDomainURL\"], \"secretName\":\"my-certificate-tls\"}]}]"
kubectl patch ingress wordpress-app --type='json' -p="[{\"op\": \"add\", \"path\": \"/spec/tls\", \"value\": [{\"hosts\":[\"$YourDomainURL\"], \"secretName\":\"my-certificate-tls\"}]}]"






