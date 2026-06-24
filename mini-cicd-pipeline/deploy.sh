#!/bin/bash

# ==========================
# Configuration
# ==========================

APP_DIR="app"
BUILD_DIR="build"
DEPLOY_DIR="deployment"
BACKUP_DIR="backups"
LOG_FILE="logs/deploy.log"

mkdir -p $BUILD_DIR
mkdir -p $DEPLOY_DIR
mkdir -p $BACKUP_DIR
mkdir -p logs

# ==========================
# Colors
# ==========================

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

# ==========================
# Logging Function
# ==========================

log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> $LOG_FILE
}

# ==========================
# Start Deployment
# ==========================

echo -e "${YELLOW}Starting Deployment...${NC}"
log_message "Deployment Started"

# ==========================
# Run Tests
# ==========================

echo "Running Tests..."

python3 $APP_DIR/test_app.py

if [ $? -ne 0 ]; then
    echo -e "${RED}Tests Failed${NC}"
    log_message "Tests Failed"
    exit 1
fi

echo -e "${GREEN}Tests Passed${NC}"
log_message "Tests Passed"

# ==========================
# Backup Current Deployment
# ==========================

TIMESTAMP=$(date +%Y%m%d_%H%M%S)

if [ "$(ls -A $DEPLOY_DIR 2>/dev/null)" ]; then

    cp -r $DEPLOY_DIR $BACKUP_DIR/backup_$TIMESTAMP

    echo -e "${GREEN}Backup Created${NC}"
    log_message "Backup Created: backup_$TIMESTAMP"

fi

# ==========================
# Build Stage
# ==========================

echo "Creating Build..."

rm -rf $BUILD_DIR/*

cp $APP_DIR/app.py $BUILD_DIR/

echo -e "${GREEN}Build Created${NC}"
log_message "Build Created"

# ==========================
# Deploy Stage
# ==========================

echo "Deploying Application..."

rm -rf $DEPLOY_DIR/*

cp $BUILD_DIR/* $DEPLOY_DIR/

echo -e "${GREEN}Deployment Completed${NC}"
log_message "Deployment Completed"

# ==========================
# Verification
# ==========================

if [ -f "$DEPLOY_DIR/app.py" ]; then

    echo -e "${GREEN}Deployment Successful${NC}"
    log_message "Deployment Successful"

else

    echo -e "${RED}Deployment Failed${NC}"
    log_message "Deployment Failed"

    exit 1

fi

# ==========================
# Deployment Report
# ==========================

REPORT_FILE="deployment_report.txt"

echo "==========================" > $REPORT_FILE
echo "Deployment Report" >> $REPORT_FILE
echo "==========================" >> $REPORT_FILE
echo "Date: $(date)" >> $REPORT_FILE
echo "Tests: SUCCESS" >> $REPORT_FILE
echo "Build: SUCCESS" >> $REPORT_FILE
echo "Deployment: SUCCESS" >> $REPORT_FILE
echo "Status: COMPLETED" >> $REPORT_FILE

echo -e "${GREEN}Report Generated${NC}"
log_message "Report Generated"

echo -e "${GREEN}CI/CD Pipeline Finished Successfully${NC}"
log_message "Pipeline Finished Successfully"
