import json
import os
import sys

# Read the bucket data from the file
def readBucketData():
    with open("buckets.json", "r") as file:
        return json.load(file)
    if not os.path.exists("buckets.json"):
        print("File not found")
        sys.exit(0)


# print("Bucket Data: ", bucketData)

# print summary of  bucket name, region, size, and versioning status
def printSummary(bucketData):
    for bucket in bucketData['buckets']:
        print("Bucket Name: ", bucket['name'])
        print("Region: ", bucket['region'])
        print("Size: ", bucket['sizeGB'])
        print("Versioning Status: ", bucket['versioning'])
        print("\n")

# Identify buckets larger than 80 GB from every region which are unused for 90+ days
def printUnusedBuckets(bucketData):
    for bucket in bucketData['buckets']:
        if bucket['sizeGB'] > 80 and bucket['unusedDays'] > 90:
            print("Bucket Name: ", bucket['name'])
            print("Region: ", bucket['region'])
            print("Size: ", bucket['sizeGB'])
            print("Unused Days: ", bucket['unusedDays'])
            print("\n")
