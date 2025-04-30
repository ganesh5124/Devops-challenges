1. What is etcd in kubernetes?
% etcd is a distributed key-value store that is used as the backing store for all cluster data in Kubernetes. It stores the configuration data, state, and metadata of the cluster, and provides a reliable way to store and retrieve this data across the cluster. 
    etcd is designed to be highly available and consistent, making it a critical component of Kubernetes.
2. Explain etcd role in Kubernetes?
% etcd plays a crucial role in Kubernetes as the primary data store for the entire cluster. It stores all the configuration data, state, and metadata of the cluster, including information about nodes, pods, services, and other resources. 
    etcd provides a reliable way to store and retrieve this data across the cluster, ensuring that all components of Kubernetes have access to the same information. 
    It also provides features such as data replication, consistency, and fault tolerance, making it a critical component of Kubernetes.
3. Why is it vital to back up etcd regularly?
% It is vital to back up etcd regularly because it stores all the critical data and state of the Kubernetes cluster. 
    If etcd becomes corrupted or data is lost, it can lead to significant downtime and loss of data for the entire cluster. 
    Regular backups ensure that you can restore the cluster to a previous state in case of failure, corruption, or accidental deletion of data. 
    Additionally, backing up etcd allows for disaster recovery and helps maintain the integrity and availability of the Kubernetes cluster.
4. List essential practices for managing backups of etcd and Kubernetes clusters
% 1. Regular Backups: Schedule regular backups of etcd data to ensure you have up-to-date copies of the cluster state.
% 2. Backup Location: Store backups in a secure and reliable location, such as cloud storage or a separate server.
% 3. Backup Format: Use a consistent and reliable format for backups, such as tar or gzip, to ensure easy restoration.
% 4. Backup Retention: Implement a backup retention policy to keep a certain number of backups and delete older ones.

Velero Overview:
1. What is Velero, and how does it simplify Kubernetes Backups
% Velero is an open-source tool that provides backup and recovery solutions for Kubernetes clusters. 
    It simplifies the process of backing up and restoring Kubernetes resources, including persistent volumes, by automating the backup process and providing a user-friendly interface. 
    Velero allows users to schedule backups, restore specific resources, and migrate resources between clusters, making it easier to manage backups in Kubernetes environments.

2. Share a high-level overview of its architecture and components
% Velero consists of several components that work together to provide backup and recovery solutions for Kubernetes clusters:
% 1. Velero Server: The main component that runs in the Kubernetes cluster and manages backup and restore operations.
% 2. Velero CLI: A command-line interface that allows users to interact with the Velero server and perform backup and restore operations.
% 3. Object Storage: A storage backend (such as AWS S3, Google Cloud Storage, or Azure Blob Storage) where backups are stored.
% 4. Plugins: Velero supports various plugins for different storage backends and cloud providers, allowing users to customize their backup and restore processes.
% 5. Scheduler: A component that allows users to schedule regular backups of their Kubernetes resources.    
% 6. Restic: An optional component that provides additional backup capabilities for persistent volumes, allowing users to back up and restore data stored in volumes.

Take a snapshot of the etcd datastore using etcdctl: ETCDCTL_API=3 etcdctl snapshot save <snapshot-file> 

etcdctl snapshot save /tmp/etcd-backup.db \
  --endpoints=https://127.0.0.1:2379 \
  --cacert=/etc/kubernetes/pki/etcd/ca.crt \
  --cert=/etc/kubernetes/pki/etcd/server.crt \
  --key=/etc/kubernetes/pki/etcd/server.key

export ETCDCTL_API=3
sudo mv /etc/kubernetes/manifests/etcd.yaml /tmp/
sudo mv /var/lib/etcd /var/lib/etcd-old
sudo etcdctl snapshot restore /tmp/etcd-backup.db --data-dir=/var/lib/etcd
sudo mv /tmp/etcd.yaml /etc/kubernetes/manifests/
sudo systemctl restart kubelet
kubectl get nodes

