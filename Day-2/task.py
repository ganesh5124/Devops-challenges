import json
import os
import sys

# Read the bucket data from the file
bucketData = open("buckets.json", "r").read()
bucketData = json.loads(bucketData)

# print("Bucket Data: ", bucketData)

# print summary of  bucket name, region, size, and versioning status
for bucket in bucketData['buckets']:
    print("Bucket Name: ", bucket['name'])
    print("Region: ", bucket['region'])
    print("Size: ", bucket['sizeGB'])
    print("Versioning Status: ", bucket['versioning'])
    print("\n")

# Identify buckets larger than 80 GB from every region which are unused for 90+ days
for bucket in bucketData['buckets']:
    if bucket['sizeGB'] > 80 and bucket['lastAccessed'] > 90:
        print("Bucket Name: ", bucket['name'])
        print("Region: ", bucket['region'])
        print("Size: ", bucket['sizeGB'])
        print("Versioning Status: ", bucket['versioning'])
        print("\n")