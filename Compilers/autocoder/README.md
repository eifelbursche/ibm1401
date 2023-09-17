All files stored here are coded in ASCII!

File naming conventions:
<br>
NAME.FORMAT.TYPE
<br>
NAME = descriptive file name, can have . by its own<br>
FORMAT = simh-old, simh-new, vdc<br>
TYPE = cd (card desk), tp (tape)<br>

How to use autocoder.weaver.vdc.tp<br>
- move file to ..\The1401RoomN2\Saved as tapeload.txt<br>
- in VDC import the tape content with "data format: vdc"<br>
- mount tape in drive 1<br>
- mount scrap tapes in drives 4, 5 and 6<br>
- put the source card desk in the 1402<br>
- press START RESET<br>
- toggle mode switch, end on RUN<br>
- click on TAPE LOAD<br>
<br>
After compilation,the left stacker holds the complied machine code. The right stacker holds the original source desk.<br>
<br>
To run the compiled program:<br>
- Put the machine code desk in the 1402<br>
- press START RESET<br>
- toggle mode switch, end on RUN<br>
- on the 1402 press LOAD<br>
<br>
<br>
For further information about autocoder on tape see https://bitsavers.org/pdf/ibm/1401/C24-3319-0_Autocoder_on_Tape_Laguage_Specifications_and_Operating_Procedures_Nov64.pdf<br>
Other good readings for 1401 development: https://bitsavers.org/pdf/ibm/1401/A24-1403-5_1401_Reference_Apr62.pdf<br>
