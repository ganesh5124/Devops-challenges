mkdir certs
ls
cd certs/
ls
openssl genrsa -out user.key 2048
ls
cat user.key 
openssl req -new -key user.key -out user.csr -subj "/CN=user"
openssl x509 -req -in user.csr -signkey user.key -out user.crt
ls
openssl genrsa -out group.key 2048
openssl req -new -key group.key -out group.csr -subj "/CN=group"
openssl x509 -req -in group.csr -signkey group.key -out group.crtopenssl x509 -req -in group.csr -signkey group.key -out group.crt
ls
openssl x509 -req -in group.csr -signkey group.key -out group.crtopenssl x509 -req -in group.csr -signkey group.key -out group.crt
openssl x509 -req -in group.csr -signkey group.key -out group.crt
ls
kubectl apply -f role.yaml 
kubectl create ns development
kubectl apply -f role.yaml 
kubectl get roles
kubectl get roles -n development
kubectl get rolesbindings -n development
kubectl api-resources | grep role
kubectl get rolebindings
kubectl get rolebindings -n developement
kubectl get rolebindings -n development
kubectl get cm -n kube-system