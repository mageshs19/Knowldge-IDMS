000010 CBL ARITH(EXTEND)                                                00010000
000020 IDENTIFICATION DIVISION.                                         00020000
000030*========================                                         00030000
000040 PROGRAM-ID.   VMDZ4420.                                          00040000
000050 AUTHOR.       ANUJA DHURI.                                       00050000
000060 DATE-WRITTEN. APRIL 2026.                                        00060000
000070                                                                  00070000
000080******************************************************************00080000
000090*                                                                *00090000
000100*                INFORMATIONAL KASBON 2.                         *00100000
000110*                                                                *00110000
000120******************************************************************00120000
000130*                                                                *00130000
000140*            COMPARISON DATABASE AND INVENTORY                   *00140000
000150*            -----------------------------------                 *00150000
000160*                                                                *00160000
000170*            SECOND PROGRAM :                                    *00170000
000180*                                                                *00180000
000190*            SEARCHING ALL EFFECTS AND ALL EVENTS                *00190000
000200*            WHO ARE STILL ALIVE.                                *00200000
000210*                                                                *00210000
000220******************************************************************00220000
000230* THIS PROGRAM IS BEING USED TO EXTRACT THE INPUT KASBONS DATA   *00230000
000240* FROM FOLLOWING (2) KASBONS DB2 TABLES AND CHECK THE VALID      *00240000
000250* RECORDS AND WRITE THOSE RECORDS INTO OUTPUT FILE.              *00250000
000260*                                                                *00260000
000270* DZBEFFTB(PARENT) ----> DZEVEFTB(CHILD)                         *00270000
000280*                                                                *00280000
000290* DZBEFFTB - SELECT                                              *00290000
000300* DZEVEFTB - SELECT                                              *00300000
000310*                                                                *00310000
000320******************************************************************00320000
000330/                                                                 00330000
000340 ENVIRONMENT DIVISION.                                            00340000
000350*---------------------                                            00350000
000360 INPUT-OUTPUT SECTION.                                            00360000
000370 FILE-CONTROL.                                                    00370000
000380     SELECT UITBST ASSIGN TO UT-S-DD005.                          00380000
000390/                                                                 00390000
000400 DATA DIVISION.                                                   00400000
000410*--------------                                                   00410000
000420 FILE SECTION.                                                    00420000
000430*                                                                 00430000
000440 FD  UITBST                                                       00440000
000450     BLOCK CONTAINS 0 RECORDS                                     00450000
000460     RECORD CONTAINS 50 CHARACTERS                                00460000
000470     RECORDING MODE F                                             00470000
000480     LABEL RECORDS STANDARD.                                      00480000
000490                                                                  00490000
000500 01  UITRECORD.                                                   00500000
000510     03  UIT-AM-CN-STOCK          PIC S9(13)V99 COMP-3.           00510000
000520     03  UIT-AM-CND-STOCK         PIC S9(13)V99 COMP-3.           00520000
000530     03  UIT-NR-CIO-CRE           PIC 9(6).                       00530000
000540     03  UIT-NR-ID                PIC X(04).                      00540000
000550     03  UIT-NS-SEQ               PIC 9(04).                      00550000
000560     03  UIT-DA-UBSEC             PIC X(08).                      00560000
000570     03  UIT-NR-ST                PIC X(12).                      00570000
000580*                                                                 00580000
000590 WORKING-STORAGE SECTION.                                         00590000
000600*                                                                 00600000
000610 01  WS-TE-WORK.                                                  00610000
000620     10  WS-STATUS                PIC X       VALUE SPACE.        00620000
000630     10  SW-STATUS-D              PIC X       VALUE 'N'.          00630000
000640     10  USERABEN                 PIC X(8)    VALUE 'USERABEN'.   00640000
000650     10  WS-NB-BEFF-COUNT         PIC 9(7)    COMP-3 VALUE ZEROES.00650000
000660     10  WS-NB-OUTPUT-COUNT       PIC 9(7)    COMP-3 VALUE ZEROES.00660000
000670     10  CS-PROGRAM               PIC X(8)    VALUE 'VMDZ4420'.   00670000
000680     10  WS-NR-ID-GOOD.                                           00680000
000690         20  WS-NR-CIO-CRE        PIC 9(8)    VALUE ZEROES.       00690000
000700         20  WS-DA-CR-CRE         PIC 9(8)    VALUE ZEROES.       00700000
000710         20  WS-NR-ID-CRE         PIC 9(6)    VALUE ZEROES.       00710000
000720         20  WS-CT-OPD-CRE        PIC 9(3)    VALUE ZEROES.       00720000
000730         20  WS-CT-OPG-CRE        PIC 9(3)    VALUE ZEROES.       00730000
000740*                                                                 00740000
000750 01  WS-DZBFFSC1-FLAG             PIC X.                          00750000
000760     88  DZBEFFC1-NOT-EOC         VALUE 'N'.                      00760000
000770     88  DZBEFFC1-EOC             VALUE 'Y'.                      00770000
000780                                                                  00780000
000790 01  WS-DZEVEFC2-FLAG             PIC X.                          00790000
000800     88  DZEVEFC2-NOT-EOC         VALUE 'N'.                      00800000
000810     88  DZEVEFC2-EOC             VALUE 'Y'.                      00810000
000820                                                                  00820000
000830 01  WS-TIMESTAMP-FIELDS.                                         00830000
000840     05 TS-SYSTEM.                                                00840000
000850        10  DA-SYS.                                               00850000
000860            15  DA-SYS-CCYY.                                      00860000
000870                20  CC            PIC X(2).                       00870000
000880                20  YY            PIC X(2).                       00880000
000890            15  MM                PIC X(2).                       00890000
000900            15  DD                PIC X(2).                       00900000
000910        10  HR-SYS.                                               00910000
000920            15  HH                PIC X(2).                       00920000
000930            15  MI                PIC X(2).                       00930000
000940            15  SS                PIC X(2).                       00940000
000950            15  TT                PIC X(2).                       00950000
000960     05 TS-TIMESTAMP.                                             00960000
000970        10  CC                    PIC X(2).                       00970000
000980        10  YY                    PIC X(2).                       00980000
000990        10  TE-MARKER1            PIC X             VALUE '-'.    00990000
001000        10  MM                    PIC X(2).                       01000000
001010        10  TE-MARKER2            PIC X             VALUE '-'.    01010000
001020        10  DD                    PIC X(2).                       01020000
001030        10  TE-MARKER3            PIC X             VALUE '-'.    01030000
001040        10  HH                    PIC X(2).                       01040000
001050        10  TE-MARKER4            PIC X             VALUE '.'.    01050000
001060        10  MI                    PIC X(2).                       01060000
001070        10  TE-MARKER5            PIC X             VALUE '.'.    01070000
001080        10  SS                    PIC X(2).                       01080000
001090        10  TE-MARKER6            PIC X             VALUE '.'.    01090000
001100        10  TT                    PIC X(2).                       01100000
001110        10  NNNN                  PIC 9(04)         VALUE 0.      01110000
001120                                                                  01120000
001130 01 WS-DATUMVELDEN.                                               01130000
001140    03  DA-CCYYMMDD.                                              01140000
001150        05  CC                    PIC 99       VALUE ZERO.        01150000
001160        05  YY                    PIC 99       VALUE ZERO.        01160000
001170        05  MM                    PIC 99       VALUE ZERO.        01170000
001180        05  DD                    PIC 99       VALUE ZERO.        01180000
001190    03  DA-CCYYMMDD-R REDEFINES DA-CCYYMMDD.                      01190000
001200        05  CCYY                  PIC 9999.                       01200000
001210        05  MM                    PIC 99.                         01210000
001220        05  DD                    PIC 99.                         01220000
001230    03  DA-DD-MM-CCYY.                                            01230000
001240        05  DD                    PIC 9(02).                      01240000
001250        05  TE-MARKER5            PIC X        VALUE '.'.         01250000
001260        05  MM                    PIC 9(02).                      01260000
001270        05  TE-MARKER6            PIC X        VALUE '.'.         01270000
001280        05  CCYY                  PIC 9(04).                      01280000
001290                                                                  01290000
001300*----- FIELDS ESDATMAS ------------------------------------------*01300000
001310     COPY ESDATMAS.                                               01310000
001320*----- FIELDS PARAMETER DATE ------------------------------------*01320000
001330 01  ZONE-DATONLY.                                                01330000
001340     03  DATE6R-WS.                                               01340000
001350         05  D-YEAR               PIC 99.                         01350000
001360         05  D-MONTH              PIC 99.                         01360000
001370         05  D-DAY                PIC 99.                         01370000
001380     03  DATE6 REDEFINES DATE6R-WS.                               01380000
001390         05  D-DAY                PIC 99.                         01390000
001400         05  D-MONTH              PIC 99.                         01400000
001410         05  D-YEAR               PIC 99.                         01410000
001420     03  DATE8.                                                   01420000
001430         05  D-DAY                PIC 99.                         01430000
001440         05  D-MONTH              PIC 99.                         01440000
001450         05  D-CENT               PIC 99.                         01450000
001460         05  D-YEAR               PIC 99.                         01460000
001470     03  PARMDATE.                                                01470000
001480         05  D-YEAR               PIC 9(4).                       01480000
001490         05  D-MONTH              PIC 9(2).                       01490000
001500         05  D-DAY                PIC 9(2).                       01500000
001510*                                                                 01510000
001520*---- INCLUDE FOR DB2 ------------------------------------------* 01520000
001530     EXEC SQL INCLUDE SQLERRWS END-EXEC.                          01530000
001540     EXEC SQL INCLUDE SQLCA    END-EXEC.                          01540000
001550                                                                  01550000
001560*---- INCLUDE VIEWS --------------------------------------------* 01560000
001570     EXEC SQL INCLUDE DZBEFFTV END-EXEC.                          01570000
001580     EXEC SQL INCLUDE DZEVEFTV END-EXEC.                          01580000
001590                                                                  01590000
001600* DECLARE CURSOR FOR BEFF TABLE                                   01600000
001610* ------------------------------                                  01610000
001620*                                                                 01620000
001630     EXEC SQL DECLARE DZBEFFC1 CURSOR WITH HOLD FOR               01630000
001640       SELECT CO_IDPRKSK_479BEFF                                  01640000
001650            , NS_IRMOSTK_479BEFF                                  01650000
001660            , DA_UBSECIS_479BEFF                                  01660000
001670            , AM_CNSTK_479BEFF                                    01670000
001680            , AM_CNDSTK_479BEFF                                   01680000
001690            , CT_RKTPROD_479BEFF                                  01690000
001700            , NR_IDSTOCK_479BEFF                                  01700000
001710            , NR_CDSTK_479BEFF                                    01710000
001720            , NS_DBSTK_479BEFF                                    01720000
001730       FROM DZBEFFTV                                              01730000
001740       FOR READ ONLY                                              01740000
001750              QUERYNO 176                                         01750000
001760     END-EXEC                                                     01760000
001770*                                                                 01770000
001780* DECLARE CURSOR FOR EVEF TABLE                                   01780000
001790* ------------------------------                                  01790000
001800*                                                                 01800000
001810     EXEC SQL DECLARE DZEVEFC2 CURSOR WITH HOLD FOR               01810000
001820       SELECT CO_STEVPRN_479EVEF                                  01820000
001830            , CT_RKTEVPR_479EVEF                                  01830000
001840            , DA_CREVTPD_479EVEF                                  01840000
001850            , NR_IDGOOD_479EVEF                                   01850000
001860            , NR_ID_479EVEF                                       01860000
001870       FROM DZEVEFTV                                              01870000
001880      WHERE CT_RKTPROD_479BEFF = :DCLDZBEFFTV.CT-RKTPROD-479BEFF  01880000
001890        AND NR_IDSTOCK_479BEFF = :DCLDZBEFFTV.NR-IDSTOCK-479BEFF  01890000
001900        AND NR_CDSTK_479BEFF   = :DCLDZBEFFTV.NR-CDSTK-479BEFF    01900000
001910        AND NS_DBSTK_479BEFF   = :DCLDZBEFFTV.NS-DBSTK-479BEFF    01910000
001920       ORDER BY NR_ID_479EVEF DESC                                01920000
001930       FOR READ ONLY                                              01930000
001940              QUERYNO 195                                         01940000
001950     END-EXEC.                                                    01950000
001960*                                                                 01960000
001970 LINKAGE SECTION.                                                 01970000
001980 01  PARAM-DATONLY.                                               01980000
001990     03  L-PARAM                  PIC S9(4) COMP.                 01990000
002000     03  DATUMLS.                                                 02000000
002010         05  DATE-IND             PIC X.                          02010000
002020         05  DATE8-LS             PIC X(8).                       02020000
002030     EJECT                                                        02030000
002040 PROCEDURE DIVISION USING PARAM-DATONLY.                          02040000
002050 0000-MAIN-PROCEDURE.                                             02050000
002060     PERFORM 1000-INITIALIZE-PROGRAM.                             02060000
002070     PERFORM 2000-PROCESS-PROGRAM.                                02070000
002080     PERFORM 3000-FINALIZE-PROGRAM.                               02080000
002090     STOP RUN.                                                    02090000
002100 1000-INITIALIZE-PROGRAM.                                         02100000
002110*                                                                 02110000
002120* INITIALISATIE                                                   02120000
002130*                                                                 02130000
002140     IF DATE-IND = '0'                                            02140000
002150         ACCEPT DATE6R-WS FROM DATE                               02150000
002160         MOVE CORR DATE6R-WS      TO DATE8                        02160000
002170         IF D-YEAR OF DATE8 > 60                                  02170000
002180              MOVE 19 TO D-CENT OF DATE8                          02180000
002190         ELSE MOVE 20 TO D-CENT OF DATE8                          02190000
002200         END-IF                                                   02200000
002210         MOVE CORR DATE8          TO DATE6                        02210000
002220     ELSE                                                         02220000
002230         MOVE DATE8-LS            TO DATE8                        02230000
002240         MOVE CORR DATE8          TO DATE6                        02240000
002250     END-IF.                                                      02250000
002260     MOVE  DATE6                 TO ES-DATUM.                     02260000
002270     MOVE  ZEROES                TO ES-DAGEN, ES-TYPE-DAG.        02270000
002280     MOVE  '+'                   TO ES-PLUS-MIN.                  02280000
002290*                                                                 02290000
002300     CALL ESDATMAS USING ES-DATUM ES-DAGEN ES-TYPE-DAG ES-PLUS-MIN02300000
002310                         ES-ANTWOORD ES-RETURN-CODE ES-WERKZONE.  02310000
002320*                                                                 02320000
002330     IF ES-RETURN-CODE = '0'                                      02330000
002340          MOVE ES-JJJJ             TO D-YEAR OF PARMDATE          02340000
002350          MOVE ES-MM               TO D-MONTH OF PARMDATE         02350000
002360          MOVE ES-DD               TO D-DAY  OF PARMDATE          02360000
002370     ELSE DISPLAY '***********************************'           02370000
002380          DISPLAY ' '                                             02380000
002390          DISPLAY 'PARAMETER DATE IN ERROR = ' DATE6              02390000
002400          DISPLAY ' '                                             02400000
002410          DISPLAY '***********************************'           02410000
002420          CALL USERABEN                                           02420000
002430     END-IF.                                                      02430000
002440*                                                                 02440000
002450     MOVE CS-PROGRAM   TO PROGRAM-NAME                            02450000
002460     PERFORM 600-GET-TIMESTAMP                                    02460000
002470                                                                  02470000
002480     OPEN OUTPUT UITBST.                                          02480000
002490*                                                                 02490000
002500     INITIALIZE DCLDZBEFFTV.                                      02500000
002510**** READ PARENT TABLE BEFF                                       02510000
002520 2000-PROCESS-PROGRAM.                                            02520000
002530     PERFORM 2100-OPEN-DZBEFFC1                                   02530000
002540     PERFORM 2200-FETCH-DZBEFFC1 UNTIL DZBEFFC1-EOC               02540000
002550     PERFORM 2300-CLOSE-DZBEFFC1.                                 02550000
002560 3000-FINALIZE-PROGRAM.                                           02560000
002570     CLOSE UITBST                                                 02570000
002580                                                                  02580000
002590     DISPLAY 'TOTAL BEFF RECORDS   : ' WS-NB-BEFF-COUNT           02590000
002600     DISPLAY 'TOTAL OUTPUT RECORDS : ' WS-NB-OUTPUT-COUNT.        02600000
002610                                                                  02610000
002620 HOOFDVERWERKING.                                                 02620000
002630*                                                                 02630000
002640* SEARCH FOR ALL EVENTS AT AN EFFECT                              02640000
002650*                                                                 02650000
002660     MOVE SPACE TO WS-STATUS                                      02660000
002670     INITIALIZE DCLDZEVEFTV                                       02670000
002680                                                                  02680000
002690**** READ CHILD TABLE EVEF                                        02690000
002700     PERFORM 2400-OPEN-DZEVEFC2                                   02700000
002710                                                                  02710000
002720     MOVE 'N' TO SW-STATUS-D                                      02720000
002730     PERFORM 2500-FETCH-DZEVEFC2 UNTIL DZEVEFC2-EOC OR            02730000
002740                                      SW-STATUS-D = 'Y'           02740000
002750     PERFORM 2600-CLOSE-DZEVEFC2                                  02750000
002760                                                                  02760000
002770**** CHECK THE CONDITION FOR WRITING THE RECORD INTO OUTPUT FILE  02770000
002780     IF NOT SW-STATUS-D = 'Y'                                     02780000
002790        IF WS-STATUS = 'C'                                        02790000
002800           PERFORM WRITE-UITRECORD                                02800000
002810           ADD 1 TO WS-NB-OUTPUT-COUNT                            02810000
002820        END-IF                                                    02820000
002830     END-IF.                                                      02830000
002840*                                                                 02840000
002850 VERWERK-VMBEVEF.                                                 02850000
002860     MOVE ZEROES            TO DA-CCYYMMDD                        02860000
002870     MOVE DA-CREVTPD-479EVEF OF DCLDZEVEFTV  TO DA-DD-MM-CCYY     02870000
002880     EVALUATE TRUE                                                02880000
002890      WHEN DA-DD-MM-CCYY = '01.01.0001'                           02890000
002900           MOVE ZEROES                TO DA-CCYYMMDD-R            02900000
002910      WHEN DA-DD-MM-CCYY = '31.12.9999'                           02910000
002920           MOVE '99999999'            TO DA-CCYYMMDD-R            02920000
002930      WHEN OTHER                                                  02930000
002940           MOVE CCYY OF DA-DD-MM-CCYY TO CCYY OF DA-CCYYMMDD-R    02940000
002950           MOVE MM   OF DA-DD-MM-CCYY TO MM   OF DA-CCYYMMDD-R    02950000
002960           MOVE DD   OF DA-DD-MM-CCYY TO DD   OF DA-CCYYMMDD-R    02960000
002970     END-EVALUATE                                                 02970000
002980                                                                  02980000
002990      IF DA-CCYYMMDD-R NOT > PARMDATE                             02990000
003000        IF CT-RKTEVPR-479EVEF OF DCLDZEVEFTV = '0060' AND         03000000
003010           WS-STATUS NOT = 'D'                                    03010000
003020           MOVE 'C' TO WS-STATUS                                  03020000
003030           MOVE NR-IDGOOD-479EVEF TO WS-NR-ID-GOOD                03030000
003040        ELSE                                                      03040000
003050           IF CT-RKTEVPR-479EVEF OF DCLDZEVEFTV = '0168' AND      03050000
003060              CO-STEVPRN-479EVEF OF DCLDZEVEFTV NOT = '1'         03060000
003070              MOVE 'D' TO WS-STATUS                               03070000
003080              MOVE 'Y' TO SW-STATUS-D                             03080000
003090           ELSE                                                   03090000
003100              IF CT-RKTEVPR-479EVEF OF DCLDZEVEFTV = '0217' AND   03100000
003110                 WS-STATUS = SPACE                                03110000
003120                 MOVE 'S' TO WS-STATUS                            03120000
003130              END-IF                                              03130000
003140           END-IF                                                 03140000
003150        END-IF                                                    03150000
003160     END-IF.                                                      03160000
003170/                                                                 03170000
003180 WRITE-UITRECORD.                                                 03180000
003190     INITIALIZE UITRECORD                                         03190000
003200                                                                  03200000
003210     MOVE AM-CNSTK-479BEFF OF DCLDZBEFFTV   TO UIT-AM-CN-STOCK    03210000
003220     MOVE AM-CNDSTK-479BEFF OF DCLDZBEFFTV  TO UIT-AM-CND-STOCK   03220000
003230     MOVE WS-NR-CIO-CRE                     TO UIT-NR-CIO-CRE     03230000
003240     MOVE CO-IDPRKSK-479BEFF OF DCLDZBEFFTV TO UIT-NR-ID          03240000
003250     MOVE NS-IRMOSTK-479BEFF OF DCLDZBEFFTV TO UIT-NS-SEQ         03250000
003260     MOVE NR-IDSTOCK-479BEFF OF DCLDZBEFFTV TO UIT-NR-ST          03260000
003270                                                                  03270000
003280     MOVE ZEROES                            TO DA-CCYYMMDD        03280000
003290     MOVE DA-UBSECIS-479BEFF OF DCLDZBEFFTV TO DA-DD-MM-CCYY      03290000
003300     EVALUATE TRUE                                                03300000
003310      WHEN DA-DD-MM-CCYY = '01.01.0001'                           03310000
003320           MOVE ZEROES                TO DA-CCYYMMDD-R            03320000
003330      WHEN DA-DD-MM-CCYY = '31.12.9999'                           03330000
003340           MOVE '99999999'            TO DA-CCYYMMDD-R            03340000
003350      WHEN OTHER                                                  03350000
003360           MOVE CCYY OF DA-DD-MM-CCYY TO CCYY OF DA-CCYYMMDD-R    03360000
003370           MOVE MM   OF DA-DD-MM-CCYY TO MM   OF DA-CCYYMMDD-R    03370000
003380           MOVE DD   OF DA-DD-MM-CCYY TO DD   OF DA-CCYYMMDD-R    03380000
003390     END-EVALUATE                                                 03390000
003400     MOVE DA-CCYYMMDD-R               TO UIT-DA-UBSEC             03400000
003410     WRITE UITRECORD.                                             03410000
003420                                                                  03420000
003430 600-GET-TIMESTAMP.                                               03430000
003440D    DISPLAY '600-GET-TIMESTAMP.'                                 03440000
003450     MOVE FUNCTION CURRENT-DATE            TO TS-SYSTEM.          03450000
003460     MOVE CC OF TS-SYSTEM                  TO CC OF TS-TIMESTAMP  03460000
003470     MOVE YY OF TS-SYSTEM                  TO YY OF TS-TIMESTAMP  03470000
003480     MOVE MM OF TS-SYSTEM                  TO MM OF TS-TIMESTAMP  03480000
003490     MOVE DD OF TS-SYSTEM                  TO DD OF TS-TIMESTAMP  03490000
003500     MOVE HH OF TS-SYSTEM                  TO HH OF TS-TIMESTAMP  03500000
003510     MOVE MI OF TS-SYSTEM                  TO MI OF TS-TIMESTAMP  03510000
003520     MOVE SS OF TS-SYSTEM                  TO SS OF TS-TIMESTAMP  03520000
003530     MOVE TT OF TS-SYSTEM                  TO TT OF TS-TIMESTAMP  03530000
003540     DISPLAY 'TIMESTAMP: ' TS-TIMESTAMP                           03540000
003550     .                                                            03550000
003560*---------------------------------------------------------------* 03560000
003570*    OPEN CURSOR                                                  03570000
003580*---------------------------------------------------------------* 03580000
003590 2100-OPEN-DZBEFFC1.                                              03590000
003600D    DISPLAY '71O-OPEN-DZBEFFC1.'                                 03600000
003610     MOVE 2100   TO SQL-LOCATION                                  03610000
003620                                                                  03620000
003630     EXEC SQL                                                     03630000
003640       OPEN DZBEFFC1                                              03640000
003650     END-EXEC                                                     03650000
003660                                                                  03660000
003670     EVALUATE SQLCODE                                             03670000
003680       WHEN ZERO                                                  03680000
003690            SET DZBEFFC1-NOT-EOC TO TRUE                          03690000
003700       WHEN OTHER                                                 03700000
003710            DISPLAY 'ERROR WHILE OPENING CURSOR DZBEFFC1'         03710000
003720            PERFORM SQLERROR                                      03720000
003730     END-EVALUATE                                                 03730000
003740     .                                                            03740000
003750*---------------------------------------------------------------* 03750000
003760*    FETCH CURSOR                                                 03760000
003770*---------------------------------------------------------------* 03770000
003780 2200-FETCH-DZBEFFC1.                                             03780000
003790D    DISPLAY '2200-FETCH-DZBEFFC1.'                               03790000
003800     MOVE 2200   TO SQL-LOCATION                                  03800000
003810                                                                  03810000
003820     EXEC SQL                                                     03820000
003830       FETCH DZBEFFC1                                             03830000
003840        INTO :DCLDZBEFFTV.CO-IDPRKSK-479BEFF                      03840000
003850           , :DCLDZBEFFTV.NS-IRMOSTK-479BEFF                      03850000
003860           , :DCLDZBEFFTV.DA-UBSECIS-479BEFF                      03860000
003870           , :DCLDZBEFFTV.AM-CNSTK-479BEFF                        03870000
003880           , :DCLDZBEFFTV.AM-CNDSTK-479BEFF                       03880000
003890           , :DCLDZBEFFTV.CT-RKTPROD-479BEFF                      03890000
003900           , :DCLDZBEFFTV.NR-IDSTOCK-479BEFF                      03900000
003910           , :DCLDZBEFFTV.NR-CDSTK-479BEFF                        03910000
003920           , :DCLDZBEFFTV.NS-DBSTK-479BEFF                        03920000
003930     END-EXEC                                                     03930000
003940                                                                  03940000
003950     EVALUATE SQLCODE                                             03950000
003960       WHEN ZERO                                                  03960000
003970            ADD 1 TO WS-NB-BEFF-COUNT                             03970000
003980            PERFORM HOOFDVERWERKING                               03980000
003990       WHEN 100                                                   03990000
004000            SET DZBEFFC1-EOC TO TRUE                              04000000
004010       WHEN OTHER                                                 04010000
004020            DISPLAY 'ERROR WHILE FETCHING CURSOR DZBEFFC1'        04020000
004030            PERFORM SQLERROR                                      04030000
004040     END-EVALUATE                                                 04040000
004050     .                                                            04050000
004060*---------------------------------------------------------------* 04060000
004070*    CLOSE CURSOR                                                 04070000
004080*---------------------------------------------------------------* 04080000
004090 2300-CLOSE-DZBEFFC1.                                             04090000
004100D    DISPLAY '2300-CLOSE-DZBEFFC1.'                               04100000
004110     MOVE 2300   TO SQL-LOCATION                                  04110000
004120                                                                  04120000
004130     EXEC SQL                                                     04130000
004140       CLOSE DZBEFFC1                                             04140000
004150     END-EXEC                                                     04150000
004160                                                                  04160000
004170     EVALUATE SQLCODE                                             04170000
004180       WHEN ZERO                                                  04180000
004190            CONTINUE                                              04190000
004200       WHEN OTHER                                                 04200000
004210            DISPLAY 'ERROR WHILE CLOSING CURSOR DZBEFFC1'         04210000
004220            PERFORM SQLERROR                                      04220000
004230     END-EVALUATE                                                 04230000
004240     .                                                            04240000
004250*---------------------------------------------------------------* 04250000
004260*    OPEN CURSOR                                                  04260000
004270*---------------------------------------------------------------* 04270000
004280 2400-OPEN-DZEVEFC2.                                              04280000
004290D    DISPLAY '2400-OPEN-DZEVEFC2'                                 04290000
004300     MOVE 2400   TO SQL-LOCATION                                  04300000
004310                                                                  04310000
004320     EXEC SQL                                                     04320000
004330       OPEN DZEVEFC2                                              04330000
004340     END-EXEC                                                     04340000
004350                                                                  04350000
004360     EVALUATE SQLCODE                                             04360000
004370       WHEN ZERO                                                  04370000
004380            SET DZEVEFC2-NOT-EOC TO TRUE                          04380000
004390       WHEN OTHER                                                 04390000
004400            DISPLAY 'ERROR WHILE OPENING CURSOR DZEVEFC2'         04400000
004410            PERFORM SQLERROR                                      04410000
004420     END-EVALUATE                                                 04420000
004430     .                                                            04430000
004440*---------------------------------------------------------------* 04440000
004450*    FETCH CURSOR                                                 04450000
004460*---------------------------------------------------------------* 04460000
004470 2500-FETCH-DZEVEFC2.                                             04470000
004480D    DISPLAY '2500-FETCH-DZEVEFC2.'                               04480000
004490     MOVE 2500   TO SQL-LOCATION                                  04490000
004500                                                                  04500000
004510     EXEC SQL                                                     04510000
004520       FETCH DZEVEFC2                                             04520000
004530        INTO :DCLDZEVEFTV.CO-STEVPRN-479EVEF                      04530000
004540           , :DCLDZEVEFTV.CT-RKTEVPR-479EVEF                      04540000
004550           , :DCLDZEVEFTV.DA-CREVTPD-479EVEF                      04550000
004560           , :DCLDZEVEFTV.NR-IDGOOD-479EVEF                       04560000
004570           , :DCLDZEVEFTV.NR-ID-479EVEF                           04570000
004580     END-EXEC                                                     04580000
004590                                                                  04590000
004600     EVALUATE SQLCODE                                             04600000
004610       WHEN ZERO                                                  04610000
004620            PERFORM VERWERK-VMBEVEF                               04620000
004630       WHEN 100                                                   04630000
004640            SET DZEVEFC2-EOC TO TRUE                              04640000
004650       WHEN OTHER                                                 04650000
004660            DISPLAY 'ERROR WHILE FETCHING CURSOR DZEVEFC2'        04660000
004670            DISPLAY 'CT-RKT-PROD = ' CT-RKTPROD-479BEFF           04670000
004680                                     OF DCLDZBEFFTV               04680000
004690            DISPLAY 'NR-ID-STOCK = ' NR-IDSTOCK-479BEFF           04690000
004700                                     OF DCLDZBEFFTV               04700000
004710            DISPLAY 'NR-CD-STOCK = ' NR-CDSTK-479BEFF             04710000
004720                                     OF DCLDZBEFFTV               04720000
004730            DISPLAY 'NR-DB-STOCK = ' NS-DBSTK-479BEFF             04730000
004740                                     OF DCLDZBEFFTV               04740000
004750            PERFORM SQLERROR                                      04750000
004760     END-EVALUATE                                                 04760000
004770     .                                                            04770000
004780*---------------------------------------------------------------* 04780000
004790*    CLOSE CURSOR                                                 04790000
004800*---------------------------------------------------------------* 04800000
004810 2600-CLOSE-DZEVEFC2.                                             04810000
004820D    DISPLAY '2600-CLOSE-DZEVEFC2.'                               04820000
004830     MOVE 2600   TO SQL-LOCATION                                  04830000
004840                                                                  04840000
004850     EXEC SQL                                                     04850000
004860       CLOSE DZEVEFC2                                             04860000
004870     END-EXEC                                                     04870000
004880                                                                  04880000
004890     EVALUATE SQLCODE                                             04890000
004900       WHEN ZERO                                                  04900000
004910            CONTINUE                                              04910000
004920       WHEN OTHER                                                 04920000
004930            DISPLAY 'ERROR WHILE CLOSING CURSOR DZEVEFC2'         04930000
004940            PERFORM SQLERROR                                      04940000
004950     END-EVALUATE                                                 04950000
004960     .                                                            04960000
004970                                                                  04970000
004980* SQLERROR ROUTINE.                                               04980000
004990     EXEC SQL                                                     04990000
005000          INCLUDE SQLERROR                                        05000000
005010     END-EXEC.                                                    05010000
