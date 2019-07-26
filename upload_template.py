import boto3
import os
import datetime
import config_environment

s3 = boto3.client('s3')

config_environment.config_environment()

filename = 'terraform_host.yml'
envrionment = os.environ.get('Environment')
bucket_name = str(os.environ.get('Environment')) + str(os.environ.get('Client')) + str(os.environ.get('Storage')) + str(datetime.datetime.now().strftime("%Y-%m-%d"))
