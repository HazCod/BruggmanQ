#!/usr/bin/python

#  manage_parameters.py
#  ----------------
#  Compatibility: Python >= 2.7 (because of the Excel-file handling)
#  Usage: None. It is used by the GUI.
#  Root privileges required: no
#  Author: Niels Hofmans (hazcod[|__apostrofe__|]outlook.be)
#  Want to make this better? -> https://github.com/HazCod/Bruggman

import os
# everything is imported from readout_data, so sit back and relax!
from readout_data import log, parameters_file, spreadsheet_file, sheet_index
from xlutils.copy import copy
from xlrd import open_workbook
from xlwt import Utils
from shutil import copyfile, rmtree, move


def addValue(name = None):
# addValue ; Will add a name and regex variable to the parameters_file. If specified, will append a new column in spreadsheet_file.
	in_book = open_workbook(spreadsheet_file)
	in_sheet = in_book.sheet_by_index(sheet_index)
	cols = [x.lower() for x in in_sheet.row(0)]
	col = len(cols)
	if name.lower() not in cols:
		log('Adding parameter to Excel file ' + spreadsheet_file)
		out_book = copy(in_book)
		out_sheet = out_book.get_sheet(0)

		out_sheet.write(0, col, str(name)) #write!
		log('Wrote ' + str(name) + ' to col ' + str(col))

		#cleanup	
		out_book.save(spreadsheet_file.rstrip("xls") + "_new.xls")
		os.remove(spreadsheet_file)
		copyfile(spreadsheet_file.rstrip("xls") + "_new.xls", spreadsheet_file)
		os.remove(spreadsheet_file.rstrip("xls") + "_new.xls")


def removeValue(name):
		in_book = open_workbook(spreadsheet_file)
		in_sheet = in_book.sheet_by_index(sheet_index)

		out_book = copy(in_book)
		out_sheet = out_book.get_sheet(0)

		cols = in_sheet.row(0) #all column cells
		coln = 0
		col = None
		if name in cols:
			log('Removing ' + name + ' from our parameters file.')
			for cell in cols:
				if str(cell.value).lower() == name.lower():
					col = coln
					break
				coln = coln + 1
			if (col != None): #if the column is found
				log('Column to remove is col number ' + str(col))

				rows = in_sheet.col(0)
				i = 0
				for row in rows:
					out_sheet.write(i, col, None)
					i = i + 1
				log('Wrote empty string to column number ' + str(col))

				#cleanup	
				out_book.save(spreadsheet_file.rstrip("xls") + "_new.xls")
				os.remove(spreadsheet_file)
				copyfile(spreadsheet_file.rstrip("xls") + "_new.xls", spreadsheet_file)
				os.remove(spreadsheet_file.rstrip("xls") + "_new.xls")
			else:
				log('Column not found for variable ' + name)
# WARNING!!!!: \t must be written as \\t
#				name cant be duplicated in other names; eg: _IN_ cant be re-used in _EXAMPLE_IN_
