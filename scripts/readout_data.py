#!/usr/bin/python
# -*- coding: utf-8 -*-

#  readout_data.py
#  ----------------
#  Compatibility: Python >=2.7 (because of the Excel-file handling)
#  Usage: run "python2 readout_data.py --help" (without the quotes) in terminal
#  Root/Administrator privileges required: no
#  Author: Niels Hofmans (hazcod[|__apostrofe__|]outlook.be)
#  Want to make this better? -> https://github.com/HazCod/Bruggman

# imported modules
import re
import os
import sys
import stat
import zipfile
import jinja2 
import argparse
import codecs
import glob
import platform
import traceback

# specific imported methods & variables
from xlrd import open_workbook, empty_cell
from jinja2 import Undefined
#from xlwt3 import utils  #Python3
from xlwt import Utils
from xlutils.copy import copy
from shutil import copyfile, move

#== constants and global variables
standarddev_str = 'sd_'					#Norm variable prefix
norm_str = 'norm_'						#Standard deviation variable prefix
debugging = True 						#set this to True for logging to logfile & printing to (terminal) screen
logger = None	   						#ignore this.
parameters_file = 'report_parameters'	#where are the parameters (& regexes) saved
results_file = 'report_resultstemp'		#temporary file to store our extracted data
template_file = 'report_template.docx'	#our template file
final_file = 'report_result.docx'		#our final report file!
template = 'Alice/'						#the used template
templates_dir = 'templates/'			#templates directory
template_dir = 'template_'				#directory name where our template resides
log_file = 'readout_log'				#if debugging is set to True, this is where our logs are stored
docfraq = '/usr/bin/docfrac'			#path to the docfraq application
spreadsheet_file = 'Excel template.xls'	#where to write our Excel lines
sheet_index = 0 						#number of the sheet to write to in our Excel workbook
contents = None 						#leave this to None
lang_dir = 'nl/' 						#language defaults to nl (=Dutch)
questionnaire = None 					#datafile where questionnaire data is stored (if not None)
ql_prefix = 'QL_'						#prefix for the questionnaire variables
#==

def log( logmsg ):
# log : with debugging enabled, debug to file and screen!
	if debugging:
		print(logmsg)
	if logger is not None:
		logger.AppendText("\n" + str(logmsg).rstrip("\n"))

def checkOS():
# checkOS : sets the docfraq application according to the OS path
	global docfraq
	pf = platform.system()
	if ('windows' == pf.lower()):
		docfraq = "C:/Program Files (x86)/DocFrac/qt-docfrac.exe"
	elif ('linux' == pf.lower()): #failsave, linux
		docfraq = '/usr/bin/docfrac'		
	else:
		log('Using non-supported OS ' + pf + ', reverting docfraq path to ' + docfraq)
	#Check if docfraq is installed
	if not (os.path.isfile(docfraq)):
			log('ERROR: docfraq not found at ' + docfraq)
			quit()

def setLogger( the_logger ):
# setLogger ; if we are using a gui, set the textCtrl
	global logger
	logger = the_logger
	log( 'Using a GUI, logger set.' )

def openFile( wfile ):
# openFile : return file contents
	file_test(wfile)
	return codecs.open(wfile, "r",encoding="utf-8").read()

def convertFile( wfile, type='rtf' ):
# convertFile : call docfraq and ask to convert this file for us 
# Supported: HTML, RTF, Text
	if (wfile.endswith("." + type)):
		cmd = docfraq + " --from-" + type + " " + wfile + " --to-text " + wfile.rstrip('.' + type)
		log("Converting; " + cmd)
		r = os.system(cmd + ' 2>&1')
		if (r != 0):
			log("Warning, Convertion result is: " + str(r))
		else:
			log('Convertion successful!')
	else:
		log("Can only accept RTF or HTML files as input..quitting..")
		quit()

def file_test( file ):
# file_test : Give warning when the file doesn't exist or is empty.
	if (0 == os.path.isfile(file) or (0 == os.stat(file)[stat.ST_SIZE])):
		log("file is empty! " + file)	
		quit()	
		return 1
	else:
		return 0

def readout( f ):
# readout : call convertFile (if needed) and return the cleartext
	log ('Readout')
	ext = ''
	if f.endswith('.rtf'):
		ext = '.rtf'
		log ('Converting RTF to text')
		convertFile(f)
	elif f.endswith('.html'):
		ext = '.html'
		log ('Converting HTML to text')
		convertFile(f, 'html')
	else:
		log ('WARNING: If not using text file input, this may give unwanted results! (RTF, Text, HTML supported)')
	contents = openFile(f.rstrip(ext))
	os.remove(f.rstrip(ext)) #Remove this line if you want to keep the converted file
	return contents

def nonblank_lines(f):
# nonblank_lines : Only give us non-empty lines of a list
    for l in f:
        line = l.rstrip()
        if line:
            yield line

def notfound(par):
#notfound : Report if a parameter is not found in a report
	log('Parameter ' + par + ' not found in report.')

def readParameters(c):
# readParameters : Get the required parameters, parse them and extract them out of the cleartext file
	data = {}
	f = None
	f_result = None

	try:
		log("readParameters: " + os.getcwd() + parameters_file)
		#Open the file using Unicode character set
		f = codecs.open(os.getcwd() + parameters_file,"r",encoding="utf-8")
		parList = []
		headers = []

		for line in nonblank_lines(f):
			par = line.split('\t') #seperated by tabs
			#If addToExcel = 1, add it to our headers list to check.
			if (par[-1] == '1'):
				headers.append(par[1])
			parList.append(par)
	finally:
		if f is not None:
			f.close()

	#Check if the Excel files contains all needed columns
	if os.path.isfile(spreadsheet_file):	
		checkSpreadsheetHeaders(headers)
	#Extract the parameters
	try:
		f_result = codecs.open(results_file,"w",encoding="utf-8")
		for item in parList:
			var_name = item[0]
			var_expr = item[1]
			norm = '/'
			stdev = '/'
			if len(item) > 3 and item[2] != '':
				norm 	 = item[2]
			if len(item) > 4 and item[3] != '':
				stdev	 = item[3]
			m = re.search(var_expr, c)
			if m != None:
				try:
					if (m.group(1) != None):
						v = m.group(1)
					else:
						v = '/'
					log(var_name + ': ' + v)
				except:
					notfound(var_name)
				#Store the value
				data[var_name] = v
				log(norm_str + var_name + ' ; ' + norm)
				data[norm_str + var_name] = norm
				log(standarddev_str + var_name + ' ; ' + stdev)
				data[standarddev_str + var_name] = stdev
			else:
				notfound(var_name)
	finally:
		if f_result is not None:
				f_result.close()

	return data

def recursive_zip(zipf, directory, folder = ""):
# recursive_zip : Zip a directory recursively, ignoring the top dir (when folder = None)
   for item in os.listdir(directory):
      if os.path.isfile(os.path.join(directory, item)) and ('.bckp' not in item):
         zipf.write(os.path.join(directory, item), folder + os.sep + item)
      elif os.path.isdir(os.path.join(directory, item)):
         recursive_zip(zipf, os.path.join(directory, item), folder + os.sep + item)

def html_decode(s):
# html_decode : Turns <, > and == html entitites into special characters. Ugly approach, but it works.
	return s.replace('&lt;','<').replace('&gt;','>').replace('&equiv;','=')

def writeParameters(data, i):
# writeParameters : Extracts the template, replaces the values and zips it back into a docx file.
	global template_dir
	single = False

	global lang_dir
	global template
	templateVars = {}

	data = addQuestionnaire(data)

	for x in range(0,i):
		for key in data[x].keys():
			if (norm_str in key) or (standarddev_str in key) or (ql_prefix in key):
				templateVars[key] = data[x][key] #Dont add the number of the night when it's a norm, stddev or questionnaire data.
			else:
				templateVars[key + '_' + str(x+1)] = data[x][key]
		#templateVars['LANGUAGE'] = language
		templateVars['NIGHTS']	 = i

	log(templateVars)
	log(str(i) + ' nights')

	log('Looking in ' + os.getcwd() + '/scripts/' + templates_dir + template + lang_dir + template_dir + str(i) + '/')
	found = False #template found?
	#WARNING!!!!! change /scripts/ to / for running it without BruggmanQ
	for file in glob.glob(os.getcwd() + '/scripts/' + templates_dir + template + lang_dir + template_dir + str(i) + '/' + "word/*.xml"):
		found = True
		contents = u''
		bckp_contents = u''
		contents_fr = None
		contents_fw	= None

		#backup our template file
		copyfile(file, str(file) + ".bckp")

		try:
			#- read the template into variable
			try:
				contents_fr = codecs.open(file,"r",encoding="utf-8")
				contents = contents_fr.read() 
			finally:
				contents_fr.close()
			#- unscape it and replace the content with the unescaped one
			try:
				bckp_contents = contents #so we dont empty the file
				log('HTML decoding file..')
				#FIX: word converts characters into their html code, such as >  to &gt;. We convert them back now.
				t = html_decode(contents)
				contents_fw = codecs.open(file, "w", encoding="utf-8")
				contents_fw.write(t)
			finally:
				contents_fw.close()
		except Exception as e:
			log('ERROR: Could not process contents file; ' + str(e))

		try: #Here we will parse the template with our variables
			log('-- template parsing commence for ' + str(file))
			#template stuff
			templateLoader = jinja2.FileSystemLoader( searchpath='/')
			templateEnv = jinja2.Environment( undefined=SilentUndefined, loader=templateLoader )
			t_template = templateEnv.get_template( file )
			contents = t_template.render( templateVars ) #render the report using the variables. This does the magic!
			log('Template rendered. ')
			#log(contents.encode('utf-8'))
		except Exception as e:
			log('ERROR: Templating Error: ' + str(e))
			log('!! ERROR: The above error occured during templating. You might want to restore your templates backup..')
			contents = bckp_contents

		#write it
		f_result = codecs.open(file,"w",encoding="utf-8")
		try:
			log('Writing back to ' + str(file))
			#log(contents.encode('utf-8'))
			f_result.write(contents)
		finally:
			f_result.close()

	if found == True:
		#zip it back to a docx
		log('Zipping report from template back to a docx; ' + os.getcwd() + '/scripts/' + templates_dir + template + lang_dir + template_dir + str(i) + '/')
		zipf = zipfile.ZipFile(final_file, "w", compression=zipfile.ZIP_DEFLATED )
		try:
			recursive_zip(zipf, os.getcwd() + '/scripts/' + templates_dir + template + lang_dir + template_dir + str(i) + '/')
		finally:
			zipf.close()

		#cleanup
		log('Cleaning up .bckp files')
		for file in glob.glob(os.getcwd() + '/' + templates_dir + template + lang_dir + template_dir + str(i) + "/word/*.bckp"):
			if (os.path.isfile(file)):
				move(file, file.rstrip(".bckp"))
		log('Report written to ' + final_file)
	else:
		log('ERROR: No templates found for language ' + lang_dir.rstrip('/') + '!')

	return data


def checkSpreadsheetHeaders( dataHeaders ):
# checkSpreadsheetHeaders : Makes sure all columns are there in the Excel file (preserves case)
	log('- checkSpreadsheetHeaders')

	in_book = open_workbook(spreadsheet_file)
	in_sheet = in_book.sheet_by_index(sheet_index)

	out_book = copy(in_book)
	out_sheet = out_book.get_sheet(0)

	cols  = [item.value.lower() for item in in_sheet.row(0)] #make every item in the list lowercase
	ncols =  len(cols)

	for header in dataHeaders:
		header_caption = str(header.value).lower()
		log('col: ' + str(header_caption))
		if header_caption not in cols:
			# We need to add a column
			log('Writing header ' + header + ' to Spreadsheet on (0, ' + ncols +1 + ').')
			out_sheet.write(0, ncols +1, str(header))
			ncols = ncols + 1 #For when we need to add another column afterwards

	#cleanup; replace the old spreadsheet with the new one
	out_book.save(spreadsheet_file.rstrip("xls") + "_new.xls")
	os.remove(spreadsheet_file)
	copyfile(spreadsheet_file.rstrip("xls") + "_new.xls", spreadsheet_file)
	os.remove(spreadsheet_file.rstrip("xls") + "_new.xls")


def updateSpreadsheet( data ):
# updateSpreadsheet : writes a new row to the spreadsheet_file where the column == report parameter.
	if not os.path.isfile(spreadsheet_file):
		log('ERROR: ' + spreadsheet_file + ' not found! Skipping updateSpreadsheet.')
	else:
		if isinstance(data, list):
			#If we get multiple inputs, execute for each input seperately
			for datapiece in data:
				updateSpreadsheet(datapiece)
			return None

		in_book = open_workbook(spreadsheet_file)
		in_sheet = in_book.sheet_by_index(sheet_index)

		row = in_sheet.nrows
		#safety check
		if row == 0:
			log('Spreadsheet is empty.. Exiting..(' + str(row) + ' rows)')
			quit()

		log('# cols: ' + str(in_sheet.ncols))
		cols = in_sheet.row(0)

		out_book = copy(in_book)
		out_sheet = out_book.get_sheet(0)

		log('We will write on row ' + str(row))
		log('# cols: ' + str(in_sheet.ncols))
		cols = in_sheet.row(0)
		#log(data)
		i=0
		log('commencing write..')
		for cell in cols:
			col_caption = str(cell.value)
			log('col: ' + str(col_caption))
			if col_caption in data.keys():
				log('write on ' + str(row) + 'x' + str(i))
				log(str(data[col_caption]))
				out_sheet.write(row,i, str(data[col_caption]))
				log('Wrote ' + str(data[col_caption]) + ' to ' + str(col_caption) + ' on ' + str(row) + 'x' + str(i))
			i = i + 1
		#cleanup	
		out_book.save(spreadsheet_file.rstrip("xls") + "_new.xls")
		os.remove(spreadsheet_file)
		copyfile(spreadsheet_file.rstrip("xls") + "_new.xls", spreadsheet_file)
		os.remove(spreadsheet_file.rstrip("xls") + "_new.xls")


def addQuestionnaire( data ):
	# add questionnaire data
	data_t = data[0]
	global questionnaire
	if questionnaire is not None:
		log('Questionnaire set! File: ' + questionnaire)
		content = openFile(questionnaire)
		contents = content.split("\n") 
		for line in contents:
			if (len(line) > 1):
				parts = line.split("\t")
				if (len(parts) == 2):
					data_t[parts[0]] = parts[1]
					log('QL; ' + parts[0] + ' : ' + parts[1])
				else:
					log("Notice: bad line in questionnaire file; " + line)
	data[0] = data_t 
	return data

def processData( data ):
	# e.g.: if (data[x]['nom'] == 'bla'): ...
	log('-- ProcessData')
	# PLACEHOLDER
	return data

def resize(l, newsize, filling=None):    
# resize : resize a dictionary                                                                              
    if newsize > len(l):                                                                                 
        l.extend([filling for x in xrange(len(l), newsize)])                                                 
    else:                                                                                                
        del l[newsize:]     

class Usage(Exception):
    def __init__(self, msg):
        self.msg = msg

def main(argv=None):
# main : This is ran when you start the script.
	datafile = None
	global spreadsheet_file
	global lang_dir
	global templates_dir
	global template

	checkOS() #for the docfraq path

	#Commandline parameter handling
	if argv is None:
		parser = argparse.ArgumentParser()
		parser.add_argument("Template", help="The used template. Directory in templates/")
		parser.add_argument("Datafile", help="The raw data report(s) (.RTF/.HTML/text) to extract data from. file1,file2,file3,...")
		parser.add_argument("-l","--language", help="Language code to write our template in. (nl/fr)")
		parser.add_argument("-e","--excel", help="Excel file to write our lines to. (.xls)")
		parser.add_argument("-o", "--output", help="Output file to be saved. (.docx at the end)")
		parser.add_argument("-p", "--parameters", help="Default file is report_parameters. Specify the parameters file with this.")
		parser.add_argument("-r", "--raw", help="Where to store our temporary RAW datafile with the extracted results.")
		parser.add_argument("-q", "--questionnaire", help="Extra datafile for parameters, each line; VARIABLE _TAB_ VALUE")
		args = parser.parse_args()
		if (args.Datafile is not None and args.Template is not None):
			template = args.Template + '/'
			datafile = args.Datafile.split(',')
			if (args.language is not None):
				lang_dir = args.language + '/'
			if (args.excel is not None):
				spreadsheet_file = args.excel
			if (args.output is not None):
				global final_file
				final_file = args.output
			if (args.parameters is not None):
				global parameters_file
				parameters_file = args.parameters
			if (args.raw is not None):
				global report_rawdata
				results_file = args.raw
			if (args.questionnaire):
				global questionnaire
				questionnaire = args.questionnaire
		else:
			raise Exception("Must provide two arguments!")
			Usage()
	else:
		lang_dir = argv[1] + '/'
		spreadsheet_file = argv[2]
		datafile = argv[3].split(',')

	#-- Start Script

	#basic check
	url = os.getcwd() + '/scripts/' + templates_dir + template
	if (not os.path.isdir(url)):
		log("ERROR: " + url + " not found! Quitting..")
		quit()

	#convert and read RTF file.
	c = ''
	data = []
	resize(data, len(datafile))

	global templatedir
	templatedir = 'template_' + str(len(datafile)) + '/'

	log("Reading file(s)")
	i = 0 #counter for data[i]
	for dataf in datafile:
	#some checks
		log('-- night ' + str(i) + '; ' + dataf)
		#Extra check if file exists
		if (os.path.isfile(dataf) == False):
			raise Exception("Inputfile " + dataf + " not found!")	
			quit()
		log("Extracting parameters from " + parameters_file + " (" + str(i) + ")")
		c = readout(dataf)
		data[i] = readParameters(c)
		i = i + 1

	#-- placeholder for whenever we need to modify data
	data = processData(data)
	#fill in the template
	log("Applying template " + template_file)
	writeParameters(data, i)
	#lean up the mess
	log("Removing " + results_file)
	#os.remove(results_file)

	if (0 != os.path.isfile(spreadsheet_file)):	
		#adjust the spreadsheet
		log("Doing spreadsheet business on " + spreadsheet_file)
		updateSpreadsheet(data)


class SilentUndefined(Undefined):
    '''
    Dont break template pageloads because vars arent there!
    '''
    def _fail_with_undefined_error(self, *args, **kwargs):
        notfound(*args)
        return None

#==========================#
#      START MAIN ()	   #
#==========================#
if __name__ == "__main__": #
    sys.exit(main())	   #
#==========================#
