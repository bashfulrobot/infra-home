# Longhorn PV(C)

## Notes

When your cluster has dynamic provisioning with storage-classes then you just need to provide the PVC , provisioner will get relevant information from PVC and storageClass, then based on these info it will create the PV.

Pods use => PersistentVolumeCLaim which uses => PersistentVolume


