#!/bin/bash

# Variables
SOURCE_DIR="/home/prajwal/Backup" 
S3_BUCKET="s3://backup-data9010/data_backup_20251014_073000.txt$(date +'%Y%m%d_%H%M%S')"
LOG_FILE="/home/prajwal/s3_backup_report.log"

# Start backup log
echo "Backup started at: $(date)" >> "$LOG_FILE"

# Run file
aws s3 sync "$SOURCE_DIR" "$S3_BUCKET" --delete >> "$LOG_FILE" 2>&1

# Status of Backup
if [ $? -eq 0 ]; then
    echo "Backup SUCCESS at $(date)" | tee -a "$LOG_FILE"
else
    echo "Backup FAILED at $(date)" | tee -a "$LOG_FILE"
fi

echo "Backup completed at: $(date)" >> "$LOG_FILE"

