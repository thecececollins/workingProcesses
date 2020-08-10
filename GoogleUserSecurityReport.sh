#!/bin/sh

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# This script will accomplish the following:
#  			- Every month will move the previous month's audit report to archive folder in AWS
# 			- Pull a list of users in Google Apps with specific details
#  			- Push the csv file to AWS s3://s3-ns-devops-secure/monthly_security_audit/
#  			- Delete the temporary csv from local location
#
#
# Prerequisites:
# 			- GAM configured
# 			- AWS2 configured
#
# Written by: Collins | IT Lead | Narrative Science
# Edited by: Collins | IT Lead | Narrative Science
#
# Created On: January 27th, 2020
# Updated On: February 14, 2020
# 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


#Variables
gam=/Users/Admin/bin/gam/gam
thisMonth=$(date +%B)
thisYear=$(date +'%Y')


#Move last month's report to archive folder in AWS
echo "Moving last month's report to archive folder in AWS"
aws2 s3 mv s3://s3-ns-devops-secure/monthly_security_audit/*  s3://s3-ns-devops-secure/archived_monthly_security_audit/ --recursive --exclude "*" --include "GoogleUserReport*"

#Pull this month's report
echo "Pulling this month's report"
$gam print users firstname lastname suspended is2svenrolled > ~/GoogleUserReport-$thisYear$thisMonth.csv

#Push this month's report to AWS S3 bucket for Security team to access
echo "Pushing this month's report to AWS S3 bucket for Security team to access"
aws2 s3 mv ~/GoogleUserReport-$thisYear$thisMonth.csv s3://s3-ns-devops-secure/monthly_security_audit/

#Remove temporary csv from desktop
echo "Removing temporary csv from desktop"
rm  ~/GoogleUserReport-$thisYear$thisMonth.csv

echo "This month's user audit report has been successfully added to AWS"