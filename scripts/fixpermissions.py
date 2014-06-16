#!/usr/bin/python
# -*- coding: utf-8 -*-

#  fixpermissions.py
#  ----------------
#  Compatibility: all
#  Usage: run "python2 fixpermissions.py" (without the quotes) in terminal
#  Root/Administrator privileges required: yes
#  Author: Niels Hofmans (hazcod[|__apostrofe__|]outlook.be)
#  Want to make this better? -> https://github.com/HazCod/BruggmanQ

import os
import argparse
import grp
import pwd
import sys

def main(argv=None):
# main : This is ran when you start the script.

	#Commandline parameter handling
	if argv is None:
		parser = argparse.ArgumentParser()
		parser.add_argument("Folder", help="The folder where to recursively set chmod & chown.")
		args = parser.parse_args()
		if (args.Folder is None):
			raise Exception("Must provide correct argument!")
			Usage()
			quit()

	#-- Start Script
	groupID = grp.getgrnam('www-data')[2]       # get group ID
	userID  = pwd.getpwnam('www-data').pw_uid   # get user  ID
	for root, dirs, files in os.walk(args.Folder):   # for everything in the folder
		for momo in dirs:
			os.chown(os.path.join(root, momo), userID, groupID) #chown a directory
			os.chmod(os.path.join(root, momo), 0777)           #chmod a directory
			for momo in files:                                  #now do all files
				os.chown(os.path.join(root, momo), userID, groupID)
				os.chmod(os.path.join(root, momo), 0777)


#==========================#
#      START MAIN ()	   #
#==========================#
if __name__ == "__main__": #
    sys.exit(main())	   #
#==========================#
