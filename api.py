import boto3

access_key = ''
secret_key = ''
bucket_name = "mah-bucket"

s3_client = boto3.client(
    's3',
    aws_access_key_id=access_key,
    aws_secret_access_key=secret_key,
    endpoint_url="http://127.0.0.1:8888",
    verify=False
    )

buckets = s3_client.list_buckets()

print("Buckets available:")
for bucket in buckets['Buckets']:
    print(f' - {bucket["Name"]}')

print("Contents:")
for key in s3_client.list_objects(Bucket=bucket_name)['Contents']:
    print(key['Key'])


# Upload the file
try:
    response = s3_client.upload_file("./Vagrantfile", bucket_name, "Vagrantfile")
except Exception as e:
    print(e)

