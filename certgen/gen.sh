#!/bin/sh
set -e
CA_DIR=/certs

[ -f $CA_DIR/ca.crt ] && echo "✓ CA exists, skip gen" && exit 0

echo "▶ generating CA"
openssl req -newkey rsa:4096 -nodes -x509 -days 3650 \
  -subj "/CN=Compose-Shared-CA" \
  -keyout $CA_DIR/ca.key -out $CA_DIR/ca.crt

for svc in acid_backend acid_file_svc ; do
  echo "▶ leaf $svc"
  openssl req -newkey rsa:4096 -nodes \
    -subj "/CN=$svc" \
    -addext "subjectAltName=DNS:$svc,DNS:localhost" \
    -keyout $CA_DIR/$svc.key -out $CA_DIR/$svc.csr

  openssl x509 -req -in $CA_DIR/$svc.csr \
    -CA  $CA_DIR/ca.crt -CAkey  $CA_DIR/ca.key -CAcreateserial \
    -out $CA_DIR/$svc.crt -days 365
  rm $CA_DIR/$svc.csr
done

# permissions / ownership
chmod 0400 $CA_DIR/*.key
chmod 0444 $CA_DIR/*.crt
chown 1000:1000 $CA_DIR $CA_DIR/*

echo "✓ certs written to /certs"