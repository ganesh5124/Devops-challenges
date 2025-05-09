
## Tasks
1. Create a Custom AMI
   - Launch an EC2 instance in the source region.
   - Install software packages (e.g., web server, monitoring tools).
   - Apply security hardening (e.g., following CIS Benchmarks, AWS Inspector).
   - Bake these changes into a custom AMI.
   - Copy the Custom AMI to Another Region

2. Use the AWS Management Console or AWS CLI to copy the custom AMI to a target region.

3. Launch a New Instance from the Custom AMI

4. Launch a new EC2 instance using the copied AMI in the target region.

5. Prepare a Volume Snapshot
   - Create a snapshot of an existing volume in the source region.
   - Copy the snapshot to the target region.
   - Create and Attach a Volume from the Copied Snapshot

6. In the target region, create a volume using the copied snapshot. Attach this volume to the newly launched instance.
