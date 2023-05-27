# bash_aws_file_download

**Prerequisites:** [AWS CLI](https://docs.aws.amazon.com/cli/v1/userguide/install-macos.html)

A bash script (.sh) which can be used to connect to an AWS bucket, download the latest file from a directory, then re-name and change the filetype. 

User-configurable variables include:

- AWS Key
- AWS Secret
- AWS Bucket 
- File location 
- Download location 

I used the script to automate the process of downloading the latest database backup (.dump) from AWS into a local folder I use to store backups, then renaming the file to .sql, to allow for restoration into a blank database.  