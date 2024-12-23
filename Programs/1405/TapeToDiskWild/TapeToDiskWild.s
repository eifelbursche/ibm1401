               JOB  TAPETODISKWILD.S 07/24/23 14:10:26                     -0626
               CTL  6611     
               ORG  333
     *
     * READS TAPE 120 WITH 2000 RECORDS AND WRITES THEM TO DISK
     * THE RECORDS ARE SPREAD WILD OVER THE RAMAC
     *
     START     SW   GRPWM         * SET WORD MARK TO RECORD
               SW   GRPMRK        * SET WORD MARK TO DISK ADDRESS
     *
               RWD  2             * REWIND TAPE
     RDTAPE    RT   2,INP1        * READ ONE RECORD FROM TAPE
               BEF  FINIS         * END OF TAPE
               RT   2,PNUM2-5     * READ 2nd entry
               BEF  FINIS         * END OF TAPE
               B    WRTDSK
     *
     PRINT     CS   332
               CS
               MCW  PNUM1,206
               MCW  SURNA1,225
               MCW  FOREN1,244
               MCW  DATE1,253
               MCW  ZIP1,259
               MCW  ADDR1,285
               W
               MCW  PNUM2,206
               MCW  SURNA2,225
               MCW  FOREN2,244
               MCW  DATE2,253
               MCW  ZIP2,259
               MCW  ADDR2,285
               W
               B    RDTAPE
     *
     WRTDSK    MCW  DSKNUL,DSKADD
               A    PNUM1-1,DSKADD-1
               MCW  %F0,DSKADD-7
               MCW  %F1,DSKADD-7,W
               MCW  %F3,DSKADD-7
               B    RDTAPE
     *
     FINIS     CS   332
               CS
               MCW  FINMSG,280
               W
               RWD  2
     DONE      H    DONE
               H
     *
     DSKNUL    DCW  00000000
     DSKADD    DCW  00000000
     GRPMRK    DC   @}@
     *
     INP1      DA   1X200
     PNUM1          1,6
     SURNA1         7,24
     FOREN1         25,42
     DATE1          43,50
     ZIP1           51,55
     ADDR1          56,79
     PNUM2          101,106
     SURNA2         107,124
     FOREN2         125,142
     DATE2          143,150
     ZIP2           151,155
     ADDR2          156,179
     GRPWM     DC   @}@
     *
     INCR      DCW  10
     FINMSG    DCW  @**** END OF FILE ****@
               END  START
