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

from shutil import copyfile, rmtree, move

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


def assembleFile(args):
	template = args.template
	global report_file
	if (args.output is not None):
		report_file = args.output
	result = report_file
	if not template.endswith('/'):
		template = template + '/'
	zipf = zipfile.ZipFile(result, "w", compression=zipfile.ZIP_DEFLATED )
	try:
		print(template)
		recursive_zip(zipf, template)
	finally:
		zipf.close()


def extractFile(args):
	#folder example; /var/www/scripts/templates/nl
	#input example; template_1.docx
	datafile = args.template
	global report_file
	if (args.output is not None):
		report_file = args.output
	newname = None
        if (args.name is not None):
		newname = args.name
	folder = report_file + '/' + newname
	try:
    	#remove old template
		if (os.path.isdir(folder)):
			rmtree(folder)
		os.makedirs(folder)
		print('copy ' + datafile + ' to ' + folder + '/' + os.path.basename(datafile))
		copyfile(datafile, folder + '/' + os.path.basename(datafile))
		os.chdir(folder)
		print('Extracting ' + folder + '/' + os.path.basename(datafile))
		zipfile.ZipFile(os.path.basename(datafile)).extractall()
		#os.remove(input)
		#if (newname is not None):
		#	move(os.path.basename(datafile), newname)
		#os.remove(input)
	except Exception, e:
		print('Error while unzipping template ' + datafile + '; ' + str(e))


def removeTemplate(args):
	template = args.template
	rmtree(template)


def main(argv=None):
# main : This is ran when you start the script.
	global language
	command = "assemble"
        commandtable = {"extract": extractFile, "assemble": assembleFile, "delete": removeTemplate}

	#Commandline parameter handling
	if argv is None:
		parser = argparse.ArgumentParser()
		parser.add_argument("command", help="The command. extract/assemble")
		parser.add_argument("template", help="The template directory or file.")
		parser.add_argument("-o", "--output", help="The output file. Default is report.docx")
		parser.add_argument("-l", "--language", help="Language used in template. Default is nl")
		parser.add_argument("-n", "--name", help="Filename when extracting.")
		args = parser.parse_args()
		if (args.template is None):
			raise Exception("Must provide an argument!")
			Usage()
		if (args.command is not None):
			command = args.command
		if (args.language is not None):
			language = args.language
	else:
		raise Exception("Must provide argument!")
		Usage()

	if (command in commandtable):
		commandtable[command](args)
	else:
		print "Not a valid command! Quitting.."


#==========================#
#      START MAIN ()	   #
#==========================#
if __name__ == "__main__": #
    sys.exit(main())	   #
#==========================#
