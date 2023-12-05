Some Diagnostics compiled from https://ibm-1401.info/1401Diagnostics.html

CPU related diag routines only.

Import card deck into VDC or use SIMH:<br><br>
<code>reset all
detach all
reset all
delete simh-printout.txt
set cpu 16K
set cpu oldconversions
at cdr diag-simh-old.txt
at lpt simh-printout.txt
d ssa 1
boot cdr
quit
</code>
