# TapeToDiskWild

- Take tape 120 from the shelf
- In the Menu "Import/Export" choose "tape import from PC text file" (highlight "VDC" before in the right side)
- Mount the tape in drive #2
- Import "TapeToDiskWild.simh-new.cd" into the 1402 (highlight "simh new" before in the right side)
- At the 14012 control panel:
  -  press "START/RESET"
  -  set mode switch to "ALTER"
  -  set numeric dials to all "0"
  -  press "START"
  -  set mode switch to "RUN" 
- At the 1402 press "LOAD"

The program will read in two records from the tape and write it to one disk sector, using the first 6 digits as disk address. This will be repeated until the tape mark is reached after 2000 records.
