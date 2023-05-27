# Ask user for database name 
echo "Enter name of database you would like to download latest backup for"
read DATABASE

# AWS Access credentials
export AWS_ACCESS_KEY_ID=your_access_key_id
export AWS_SECRET_ACCESS_KEY=your_secret_access_key

# S3 bucket and directory parameters
BUCKET_NAME='your_bucket_name'
DIRECTORY_NAME='your_directory_name'

# Define the local download directory
DOWNLOAD_DIR=~/Downloads

# Get the latest file name
LATEST_FILE=$(aws s3 ls s3://$BUCKET_NAME/$DIRECTORY_NAME/ --recursive | sort | tail -n 1 | awk '{print $4}')

# Download the latest file to the specified directory
aws s3 cp s3://$BUCKET_NAME/$LATEST_FILE $DOWNLOAD_DIR

# Extract the actual file name from the path
ACTUAL_FILE=$(basename $LATEST_FILE)

# Rename the downloaded file
mv "$DOWNLOAD_DIR/$ACTUAL_FILE" "$DOWNLOAD_DIR/$DATABASE.sql"

echo "Downloaded and renamed the latest file to: $DOWNLOAD_DIR/$DATABASE.sql"