#!/bin/sh

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# This script will accomplish the following:
#  			- Every month will move the old audit report to archive folder in AWS
#
# Written by: Collins
# Edited by: Collins
# Created On: March 3, 2020
# Updated On: March 3, 2020
# 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


#Variables
thisMonth=$(date +%B)
thisYear=$(date +'%Y')


#Move last month's Google Apps report to archive folder in AWS
echo "Moving last month's report to archive folder in AWS"
aws2 s3 mv s3://s3-ns-[folder name]/monthly_security_audit/Google-UserReport-$thisYear$thisMonth.csv  s3://s3-[folder name]/archived_monthly_security_audit/Google-UserReport-$thisYear$thisMonth.csv

aws2 s3 mv s3://s3-[folder name]/monthly_security_audit/Github-UserReport-$thisYear$thisMonth.csv  s3://s3-[folder name]/archived_monthly_security_audit/Github-UserReport-$thisYear$thisMonth.csv

aws2 s3 mv s3://s3-[folder name]/monthly_security_audit/AWS-AllUserReport-$thisYear$thisMonth.csv  s3://s3-[folder name]/archived_monthly_security_audit/AWS-AllUserReport-$thisYear$thisMonth.csv
