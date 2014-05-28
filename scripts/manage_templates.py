#!/usr/bin/python
# -*- coding: utf-8 -*-

#  manage_templates.py
#  ----------------
#  Compatibility: all
#  Usage: run "python2 manage_templates.py --help" (without the quotes) in terminal
#  Root/Administrator privileges required: no
#  Author: Niels Hofmans (hazcod[|__apostrofe__|]outlook.be)
#  Want to make this better? -> https://github.com/HazCod/BruggmanQ

# imported modules
import os
import zipfile
import sys
import argparse

from shutil import copyfile, rmtree

report_file = "report.docx"	#default output file
command 	= "extract"		#default command
language 	= "nl"			#default language


def recursive_zip(zipf, directory, folder = ""):
# recursive_zip : Zip a directory recursively, ignoring the top dir (when folder = None)
   for item in os.listdir(directory):
      if os.path.isfile(os.path.join(directory, item)) and ('.bckp' not in item):
         zipf.write(os.path.join(directory, item), folder + os.sep + item)
      elif os.path.isdir(os.path.join(directory, item)):
         recursive_zip(zipf, os.path.join(directory, item), folder + os.sep + item)


def assembleFile( template, result ):
	if not template.endswith('/'):
		template = template + '/'
	zipf = zipfile.ZipFile(result, "w", compression=zipfile.ZIP_DEFLATED )
	try:
		print(template)
		recursive_zip(zipf, template)
	finally:
		zipf.close()


def extractFile( input, folder):
	#folder example; /var/www/scripts/templates/nl/
	#input example; template_1.docx
	folder = folder + '/' + os.path.basename(input.rstrip('.docx'))
	print(folder)
	try:
    	#remove old template
		if (os.path.isdir(folder)):
			rmtree(folder)
		os.makedirs(folder)
		copyfile(input, folder + '/' + os.path.basename(input))
		os.chdir(folder)
		zipfile.ZipFile(os.path.basename(input)).extractall()
		#os.remove(input)
		os.remove(folder + '/' + os.path.basename(input))

	except Exception, e:
		print('Error while unzipping template ' + input + '; ' + str(e))

class Usage(Exception):
    def __init__(self, msg):
        self.msg = msg

def main(argv=None):
# main : This is ran when you start the script.
	datafile = None
	command = "assemble"
	language = "nl"

	#Commandline parameter handling
	if argv is None:
		parser = argparse.ArgumentParser()
		parser.add_argument("command", help="The command. extract/assemble")
		parser.add_argument("template", help="The template directory or file.")
		parser.add_argument("-o", "--output", help="The output file. Default is report.docx")
		parser.add_argument("-l", "--language", help="Language used in template. Default is nl")
		args = parser.parse_args()
		if (args.template is not None):
			datafile = args.template
			if (args.output is not None):
				global report_file
				report_file = args.output
			if (args.command is not None):
				command = args.command
			if (args.language is not None):
				language = args.language
		else:
			raise Exception("Must provide an argument!")
			Usage()

	else:
		raise Exception("Must provide argument!")
		Usage()

	if (command == 'extract'):
		extractFile(datafile, report_file)
	else:
		assembleFile(datafile, report_file)


#==========================#
#      START MAIN ()	   #
#==========================#
if __name__ == "__main__": #
    sys.exit(main())	   #
#==========================#