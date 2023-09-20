               JOB  1407-CALC.S 09/18/23 21:38:50                          -5930
               CTL  6611
     ******************************************************************
     *  RE-WRITE OF THE 1407 CALCULATOR
     ******************************************************************
               ORG  87
     X1        DSA  0                  INDEX REGISTER 1
               ORG  92
     X2        DSA  0                  INDEX REGISTER 2
     *
               ORG  101
     *  SOME PRE-INITIALIZATION
     START     CS   KBIN&98
               LCA  GM,KBOUT&41
               LCA  NUL,A
               LCA  NUL,B
               LCA  TINPUT,KBOUT&40
               MCW  %T0,KBOUT,W
     WAIT      BIN  GO,Q     * GET USER ENTRY
               B    WAIT
     GO        MCW  %T0,KBIN,R
               BIN  START,*
               SBR  X1,000   * SEARCH FOR GM
     *
     TESTGM    BCE  L0,KBIN&X1,g
               MA   ADDONE,X1
               B    TESTGM
     L0        SBR  X2,009   * RIGHT GM FOUND, NOW BACK OVER BLANKS
     SKIP1     MA   SUBONE,X1
               BM   ERRQUI,X1,B
               BCE  SKIP1,KBIN&X1,
     L2        MN   KBIN&X1,A&1&X2   * FIRST DIGIT FOUND, COPY ARG TO BUF
               MA   SUBONE,X2
               MA   SUBONE,X1
               BM   ERRQUI,X1,B
               BCE  L3,KBIN&X1,
               BM   L2,KBIN&X1,2
     L3        BCE  SKIP2,KBIN&X1,   * NEXT PART, SHOULD BE OPERATOR
               B    L5
     SKIP2     MA   SUBONE,X1
               BM   ERRQUI,X1,B
               B    L3
     L5        MCW  KBIN&X1,OP  * COPY OPERATOR
               SBR  X2,009      * NEXT PART, SHOULD BE ARGUMENT A
     SKIP3     MA   SUBONE,X1
               BM   ERRQUI,X1,B
               BCE  SKIP3,KBIN&X1,
     L6        MN   KBIN&X1,A-9&X2  * FIRST DIGIT FOUND, COPY ARG TO BUF
               MA   SUBONE,X2
               MA   SUBONE,X1
               BM   L7,X1,B
               BCE  L7,KBIN&X1,
               BM   L6,KBIN&X1,2
               B    ERRQUI
     L7        BCE  DOADD,OP,&  * END, NUMBERS A & B READY
               BCE  DOSUB,OP,-
               BCE  DOMULT,OP,*
               BCE  DODIV,OP,/
               B    ERRQUI
     DOADD     A    A,B
               B    DOPRT
     DOSUB     S    B,A
               LCA  A,B
               B    DOPRT
     DOMULT    ZA   NUL,MULTB
               MCW  B,MULTB-11
               M    A,MULTB
               MCW  MULTB,B
               B    DOPRT
     DODIV     ZA   A,MULTB
               D    B,MULTB-9
               MCW  MULTB-11,B
               B    DOPRT
     *
     DOPRT     LCA  TRES,KBOUT&25
               SW   KBOUT&7,KBOUT&7
               LCA  GM,KBOUT&26
               MCE  B,KBOUT&25
               MCW  %T0,KBOUT,W
               B    START
     *
     ERRQUI    CS   KBIN&98
               LCA  GM,KBOUT&19
               LCA  TERR,KBOUT&18
               MCW  %T0,KBOUT,W
               B    START
     *
     HALT      H    HALT
               H
     *
               LTORG601
     A         DCW  0000000000
     B         DCW  0000000000
     NUL       DCW  0000000000
               LTORG651
     MULTB     DCW  000000000000000000000
     *
               LTORG700
     OP        DCW  @X@
     SUBONE    DCW  @I9I@
     ADDONE    DCW  001
     GM        DCW  @g@
     TINPUT    DCW  @HIT REQUEST & ENTER EXPRESSION [A &-*/ B]@
     TERR      DCW  @ERROR IN EXPRESSION@
     TRES      DCW  @RESULT:&    ,   ,   ,  0&-@
     *
               LTORG901
     KBIN      DA   1X50
     KBOUT     DA   1X50
     *
               END  START
