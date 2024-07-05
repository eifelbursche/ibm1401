# AUTOCODER 

**All files stored here are coded in ASCII!**

## File naming conventions
<br>

```NAME.FORMAT.TYPE```

<br>

```NAME``` = descriptive file name, can have . by its own<br>
```FORMAT``` = simh-old, simh-new, vdc<br>
```TYPE``` = cd (card desk), tp (tape)<br>

## How to use autocoder.weaver.vdc.tp
- move file to ```..\The1401RoomN2\Saved``` as ```tapeload.txt``` 
- in VDC import the tape content with "data format: vdc"
- mount tape in drive 1
- mount scrap tapes in drives 4, 5 and 6
- put the source card desk in the 1402
- at the 1401 press ```START RESET``` 
- at the 1401 toggle mode switch to ```RUN``` 
- at the 1401 click on ```TAPE LOAD``` 


After compilation, the left stacker holds the complied machine code. The right stacker holds the original source desk.<br>


## To run the compiled program

- Put the machine code desk in the 1402 <br> 
- at the 1401 press ```START RESET```
- at the 1401 toggle mode switch to ```RUN``` <br>
- at the 1402 click on ```LOAD``` <br>


## Recommended readings

[Autocoder on tape](https://bitsavers.org/pdf/ibm/1401/C24-3319-0_Autocoder_on_Tape_Laguage_Specifications_and_Operating_Procedures_Nov64.pdf)

[1401 development](https://bitsavers.org/pdf/ibm/1401/A24-1403-5_1401_Reference_Apr62.pdf)
