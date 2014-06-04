#!/usr/bin/python
# -*- coding: utf-8 -*-

#  remove.py
#  ----------------
#  Compatibility: all
#  Usage: run "python2 remove.py --help" (without the quotes) in terminal
#  Root/Administrator privileges required: no
#  Author: Niels Hofmans (hazcod[|__apostrofe__|]outlook.be)
#  Want to make this better? -> https://github.com/HazCod/BruggmanQ

# imported modules
import argparse
import sys
import os
from shutil import rmtree


class Usage(Exception):
    def __init__(self, msg):
        self.msg = msg

def main(argv=None):
# main : This is ran when you start the script.
	target = None
	directory = False

	#Commandline parameter handling
	if argv is None:
		parser = argparse.ArgumentParser()
		parser.add_argument("file", help="The file to be deleted")
		parser.add_argument("-d", action='store_true', default='False', help="Is it a directory?")
		args = parser.parse_args()
		if (args.file is not None):
			target = args.file
		else:
			raise Exception("Must provide an argument!")
			Usage()

	else:
		raise Exception("Must provide argument!")
		Usage()

	# does it exist?
	if (os.path.isfile(target)):
		# is it a directory?
		if (os.path.isdir(target)):
			rmtree(target)
		else:
			os.remove(target)


#==========================#
#      START MAIN ()	   #
#==========================#
if __name__ == "__main__": #
    sys.exit(main())	   #
#==========================#
