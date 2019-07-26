import boto3
import os

s3 = boto3.client('s3')

filename = 'terraform_host.yml'
bucket_name = #TODO add environment variable logic to create s3 bucket name