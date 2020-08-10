# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# This script will accomplish the following:
#  			- 
#
#
# Prerequisites:
# 			- PyGithub installed (pip install PyGithub)
# 			- set GITHUB_TOKEN
#
#
# Created On: January 27th, 2020
# Updated On: 
# 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


"""Must have PyGithub installed first and set GITHUB_TOKEN
pip install PyGithub
"""
import csv
from github import Github
import os

ORG_NAME = "NarrativeScience"

try:
    access_token = os.environ["GITHUB_TOKEN"]
except KeyError:
    raise KeyError("GITHUB_TOKEN must be set in your environment")

g = Github(access_token)
org = g.get_organization(ORG_NAME)

with open("github_users.csv", "w") as f:
    csvwriter = csv.writer(f)
    for member in org.get_members():
        csvwriter.writerow([member.login, member.name, member.email])
