import boto3
import os

s3 = boto3.client('s3')

filename = 'upload_template.py'
bucket_name = #TODO add environment variable logic to create s3 bucket name