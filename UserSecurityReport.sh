#!/bin/sh

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# This script will accomplish the following:
# 			- Pull a list of users fpr each application with specific details
#  			- Push the csv file to AWS s3://s3-ns-devops-secure/monthly_security_audit/
#  			- Delete the temporary csv from local location
#
#
# Prerequisites:
# 			- GAM configured
# 			- AWS2 configured
# 			- PyGithub configured
#           - Github token added to ~/.bash_profile for ns-itadmin (can be found in 1Password TechOps vault)
#
# Written by: Collins | IT Lead | Narrative Science
# Edited by: Collins | IT Lead | Narrative Science
#
# Created On: January 27th, 2020
# Updated On: March 3, 2020
# 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


#Variables
gam=/Users/Admin/bin/gam/gam
thisMonth=$(date +%B)
thisYear=$(date +'%Y')

# -------------------------------------------------------------------
# GOOGLE

#Pull this month's Google Apps report
echo "Pulling this month's Google Apps report"
$gam print users firstname lastname suspended is2svenrolled > ~/Google-UserReport-$thisYear$thisMonth.csv

#Push this month's Google Apps report to AWS S3 bucket for Security team to access
echo "Pushing this month's Google Apps report to AWS S3 bucket for Security team to access"
aws2 s3 mv ~/Google-UserReport-$thisYear$thisMonth.csv s3://s3-ns-devops-secure/monthly_security_audit/

#Remove temporary Google Apps csv from computer
echo "Removing temporary Google Apps csv from computer"
rm  ~/Google-UserReport-$thisYear$thisMonth.csv

# -------------------------------------------------------------------
# AWS

#Pull this month's AWS report
echo "Pulling this month's AWS report"
python /Users/Admin/cronScripts/AWSUserSecurityReport.py

#Changing the name of AWS report
echo "Changing the name of AWS report"
mv ~/cronScripts/all_users.csv ~/AWS-AllUserReport-$thisYear$thisMonth.csv
mv ~/cronScripts/active_users_audit.csv ~/AWS-ActiveUserReport-$thisYear$thisMonth.csv
mv ~/cronScripts/all_columns_active_users.csv ~/AWS-AllColumnsUserReport-$thisYear$thisMonth.csv


#Push this month's AWS report to AWS S3 bucket for Security team to access
echo "Pushing this month's AWS report to AWS S3 bucket for Security team to access"
aws2 s3 mv ~/AWS-AllUserReport-$thisYear$thisMonth.csv s3://s3-ns-devops-secure/monthly_security_audit/
aws2 s3 mv ~/AWS-ActiveUserReport-$thisYear$thisMonth.csv s3://s3-ns-devops-secure/monthly_security_audit/
aws2 s3 mv ~/AWS-AllColumnsUserReport-$thisYear$thisMonth.csv s3://s3-ns-devops-secure/monthly_security_audit/


#Remove temporary AWS csv from computer
echo "Removing temporary AWS csv from computer"
rm  ~/AWS-AllUserReport-$thisYear$thisMonth.csv
rm  ~/AWS-ActiveUserReport-$thisYear$thisMonth.csv
rm  ~/AWS-AllColumnsUserReport-$thisYear$thisMonth.csv

# -------------------------------------------------------------------
#GITHUB


#Pull this month's Github report
echo "Pulling this month's Github report"
python /Users/Admin/cronScripts/GithubUserSecurityReport.py

#Changing the name of Github report
echo "Changing the name of Github report"
mv ~/github_users.csv ~/Github-UserReport-$thisYear$thisMonth.csv

#Push this month's Github report to AWS S3 bucket for Security team to access
echo "Pushing this month's Github report to AWS S3 bucket for Security team to access"
aws2 s3 mv ~/Github-UserReport-$thisYear$thisMonth.csv s3://s3-ns-devops-secure/monthly_security_audit/

#Remove temporary Github csv from computer
echo "Removing temporary Github csv from computer"
rm  ~/Github-UserReport-$thisYear$thisMonth.csv


# -------------------------------------------------------------------

echo "This month's user audit report has been successfully added to AWS"
