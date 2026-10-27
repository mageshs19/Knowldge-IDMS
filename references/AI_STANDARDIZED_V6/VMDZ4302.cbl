000010 CBL ARITH(EXTEND)                                                00010000
000020 IDENTIFICATION DIVISION.                                         00020000
000030*========================                                         00030000
000040 PROGRAM-ID.   VMDZ4302.                                          00040000
000050 AUTHOR.       ANUJA DHURI.                                       00050000
000060 DATE-WRITTEN. APRIL 2026.                                        00060000
000070                                                                  00070000
000080*-----------------------------------------------------------------00080000
000090*     COLLECTION OF SECURITIES WITH REDEMPTION EVENTS             00090000
000100*         EVENTS ONE MONTH PRIOR TO MATURITY                      00100000
000110*-----------------------------------------------------------------00110000
000120*                                                                 00120000
000130* THIS PROGRAM IS BEING USED TO EXTRACT THE INPUT KASBONS DATA    00130000
000140* FROM FOLLOWING (3) KASBONS DB2 TABLES AND CHECK THE VALID       00140000
000150* DATA AND WRITE THOSE RETRIEVED DATE INTO OUTPUT FILE.           00150000
000160*                                                                 00160000
000170* DZWCEFTB(PARENT) ----> DZBEFFTB(PARENT) ----> DZEVEFTB(CHILD)   00170000
000180*                                                                 00180000
000190* DZWCEFTB - SELECT                                               00190000
000200* DZBEFFTB - SELECT                                               00200000
000210* DZEVEFTB - SELECT                                               00210000
000220*-----------------------------------------------------------------00220000
000230 ENVIRONMENT DIVISION.                                            00230000
000240*-----------------------------------------------------------------00240000
000250 INPUT-OUTPUT SECTION.                                            00250000
000260 FILE-CONTROL.                                                    00260000
000270     SELECT EMISSIONS-I ASSIGN TO UT-S-DD010.                     00270000
000280     SELECT EFFEKT-O    ASSIGN TO UT-S-DD005.                     00280000
000290*                                                                 00290000
000300*-----------------------------------------------------------------00300000
000310 DATA DIVISION.                                                   00310000
000320*-----------------------------------------------------------------00320000
000330 FILE SECTION.                                                    00330000
000340 FD  EMISSIONS-I                                                  00340000
000350     BLOCK CONTAINS 0 RECORDS                                     00350000
000360     RECORD CONTAINS 40 CHARACTERS                                00360000
000370     RECORDING MODE F                                             00370000
000380     LABEL RECORDS STANDARD.                                      00380000
000390 01  EMISSIONS-I-REC PIC X(40).                                   00390000
000400*                                                                 00400000
000410 FD  EFFEKT-O                                                     00410000
000420     BLOCK CONTAINS 0 RECORDS                                     00420000
000430     RECORD CONTAINS 90 CHARACTERS                                00430000
000440     RECORDING MODE F                                             00440000
000450     LABEL RECORDS STANDARD.                                      00450000
000460 01  REFFEKT-O   PIC X(90).                                       00460000
000470*                                                                 00470000
000480*-----------------------------------------------------------------00480000
000490 WORKING-STORAGE SECTION.                                         00490000
000500*-----------------------------------------------------------------00500000
000510 01  USERABEN                     PIC X(8)    VALUE 'USERABEN'.   00510000
000520 01  CS-VM9BC50T                  PIC X(8)    VALUE 'VM9BC50T'.   00520000
000530 01  WS-VM9BC50I.                                                 00530000
000540     COPY VM9BC50I     REPLACING ==:VM9BC50T:== BY ==BC50I==.     00540000
000550 01  WS-VM9BC50O.                                                 00550000
000560     COPY VM9BC50O     REPLACING ==:VM9BC50T:== BY ==BC50O==.     00560000
000570 01  WS-VM9BC50T.                                                 00570000
000580     05  TE-INTERFACE             PIC  X(001) OCCURS 32000.       00580000
000590 01  INPUT-RECORD.                                                00590000
000600     02  I-CO-INTERNE             PIC X(11).                      00600000
000610     02  I-DA-UB.                                                 00610000
000620         03  DD                   PIC 99.                         00620000
000630         03  FILLER               PIC X.                          00630000
000640         03  MM                   PIC 99.                         00640000
000650         03  FILLER               PIC X.                          00650000
000660         03  CCYY                 PIC 9999.                       00660000
000670     02 I-DA-UE.                                                  00670000
000680         03  DD                   PIC 99.                         00680000
000690         03  FILLER               PIC X.                          00690000
000700         03  MM                   PIC 99.                         00700000
000710         03  FILLER               PIC X.                          00710000
000720         03  CCYY                 PIC 9999.                       00720000
000730     02 FILLER                    PIC X(9).                       00730000
000740*                                                                 00740000
000750 01  VARIABLES.                                                   00750000
000760     03  WS-DA-UE-MIN-1MAAND.                                     00760000
000770         05 CCYY                  PIC 9(4).                       00770000
000780         05 MM                    PIC 99.                         00780000
000790         05 DD                    PIC 99.                         00790000
000800     03  SW-168                   PIC X       VALUE 'N'.          00800000
000810     03  LAATSTE-DA-CR-EVENT-PROD PIC 9(8)    VALUE 0.            00810000
000820     03  LAATSTE-CI               PIC X(6)    VALUE '000000'.     00820000
000830     03  WS-NB-READ-COUNT         PIC 9(7)    COMP-3 VALUE ZEROES.00830000
000840     03  WS-NB-BEFF-COUNT         PIC 9(7)    COMP-3 VALUE ZEROES.00840000
000850     03  WS-NB-OUTPUT-COUNT       PIC 9(7)    COMP-3 VALUE ZEROES.00850000
000860     03  CS-PROGRAM               PIC X(8)    VALUE 'VMDZ4302'.   00860000
000870     03  HULP-NR-ID-GOOD.                                         00870000
000880         05  FILLER               PIC 9(8)    VALUE ZEROES.       00880000
000890         05  HULP-DA-UB-TRANSF    PIC 9(8)    VALUE ZEROES.       00890000
000900         05  FILLER               PIC 9(6)    VALUE ZEROES.       00900000
000910         05  CT-OPD               PIC 9(3)    VALUE ZEROES.       00910000
000920         05  FILLER               PIC 9(3)    VALUE ZEROES.       00920000
000930                                                                  00930000
000940 01  UITREC.                                                      00940000
000950     03  UIT-NR-CI                PIC 9(06).                      00950000
000960     03  UIT-AM-CN-STOCK          PIC S9(12)V9(6).                00960000
000970     03  UIT-CO-DEVISE            PIC X(03).                      00970000
000980     03  FILLER                   PIC X(22)   VALUE SPACE.        00980000
000990     03  UIT-CO-INTERNE           PIC X(11).                      00990000
001000     03  FILLER                   PIC X(12)   VALUE SPACE.        01000000
001010     03  UIT-NR-ID-STOCK-CD       PIC 9(13).                      01010000
001020     03  FILLER                   PIC X(05)   VALUE SPACES.       01020000
001030*                                                                 01030000
001040 01  HELP-NR-STOCK.                                               01040000
001050     02  HELP-NR-IDSTOCK          PIC 9(12)   VALUE ZEROES.       01050000
001060     02  HELP-NR-CDSTOCK          PIC 9(1)    VALUE ZEROES.       01060000
001070                                                                  01070000
001080 01  HELP-NR-CIO-FORM.                                            01080000
001090     02  HELP-NR-CIO-AS-1POS      PIC X(1)    VALUE SPACES.       01090000
001100     02  HELP-NR-CIO-AS-26POS     PIC X(5)    VALUE SPACES.       01100000
001110                                                                  01110000
001120 01  WS-DZBFFSC1-FLAG             PIC X.                          01120000
001130     88  DZBEFFC1-NOT-EOC         VALUE 'N'.                      01130000
001140     88  DZBEFFC1-EOC             VALUE 'Y'.                      01140000
001150                                                                  01150000
001160 01  WS-DZEVEFC2-FLAG             PIC X.                          01160000
001170     88  DZEVEFC2-NOT-EOC         VALUE 'N'.                      01170000
001180     88  DZEVEFC2-EOC             VALUE 'Y'.                      01180000
001190                                                                  01190000
001200 01  SW-EMISSIONS                 PIC X.                          01200000
001210     88 EMISSIONS-NOT-EOF         VALUE 'N'.                      01210000
001220     88 EMISSIONS-EOF             VALUE 'Y'.                      01220000
001230                                                                  01230000
001240 01  WS-TIMESTAMP-FIELDS.                                         01240000
001250     05 TS-SYSTEM.                                                01250000
001260        10  DA-SYS.                                               01260000
001270            15  DA-SYS-CCYY.                                      01270000
001280                20  CC            PIC X(2).                       01280000
001290                20  YY            PIC X(2).                       01290000
001300            15  MM                PIC X(2).                       01300000
001310            15  DD                PIC X(2).                       01310000
001320        10  HR-SYS.                                               01320000
001330            15  HH                PIC X(2).                       01330000
001340            15  MI                PIC X(2).                       01340000
001350            15  SS                PIC X(2).                       01350000
001360            15  TT                PIC X(2).                       01360000
001370     05 TS-TIMESTAMP.                                             01370000
001380        10  CC                    PIC X(2).                       01380000
001390        10  YY                    PIC X(2).                       01390000
001400        10  TE-MARKER1            PIC X             VALUE '-'.    01400000
001410        10  MM                    PIC X(2).                       01410000
001420        10  TE-MARKER2            PIC X             VALUE '-'.    01420000
001430        10  DD                    PIC X(2).                       01430000
001440        10  TE-MARKER3            PIC X             VALUE '-'.    01440000
001450        10  HH                    PIC X(2).                       01450000
001460        10  TE-MARKER4            PIC X             VALUE '.'.    01460000
001470        10  MI                    PIC X(2).                       01470000
001480        10  TE-MARKER5            PIC X             VALUE '.'.    01480000
001490        10  SS                    PIC X(2).                       01490000
001500        10  TE-MARKER6            PIC X             VALUE '.'.    01500000
001510        10  TT                    PIC X(2).                       01510000
001520        10  NNNN                  PIC 9(04)         VALUE 0.      01520000
001530                                                                  01530000
001540 01 WS-DATUMVELDEN.                                               01540000
001550    03  DA-YYMMDD.                                                01550000
001560        05  YY                    PIC 99       VALUE ZERO.        01560000
001570        05  MM                    PIC 99       VALUE ZERO.        01570000
001580        05  DD                    PIC 99       VALUE ZERO.        01580000
001590    03  DA-DDMMCCYY.                                              01590000
001600        05  DD                    PIC 99       VALUE ZERO.        01600000
001610        05  MM                    PIC 99       VALUE ZERO.        01610000
001620        05  CC                    PIC 99       VALUE ZERO.        01620000
001630        05  YY                    PIC 99       VALUE ZERO.        01630000
001640    03  DA-CCYYMMDD.                                              01640000
001650        05  CC                    PIC 99       VALUE ZERO.        01650000
001660        05  YY                    PIC 99       VALUE ZERO.        01660000
001670        05  MM                    PIC 99       VALUE ZERO.        01670000
001680        05  DD                    PIC 99       VALUE ZERO.        01680000
001690    03  DA-CCYYMMDD-R REDEFINES DA-CCYYMMDD.                      01690000
001700        05  CCYY                  PIC 9999.                       01700000
001710        05  MM                    PIC 99.                         01710000
001720        05  DD                    PIC 99.                         01720000
001730    03  DA-DD-MM-CCYY.                                            01730000
001740        05  DD                    PIC 9(02).                      01740000
001750        05  TE-MARKER5            PIC X        VALUE '.'.         01750000
001760        05  MM                    PIC 9(02).                      01760000
001770        05  TE-MARKER6            PIC X        VALUE '.'.         01770000
001780        05  CCYY                  PIC 9(04).                      01780000
001790                                                                  01790000
001800 01  ZONE-DATONLY.                                                01800000
001810     02  WS-DA-YMD.                                               01810000
001820         03  YY                   PIC 99.                         01820000
001830         03  MM                   PIC 99.                         01830000
001840         03  DD                   PIC 99.                         01840000
001850*                                                                 01850000
001860     02  WS-DA-DMY.                                               01860000
001870         03  DD                   PIC 99.                         01870000
001880         03  MM                   PIC 99.                         01880000
001890         03  YY                   PIC 99.                         01890000
001900*                                                                 01900000
001910     02  WS-DA-CYMD-N             PIC 9(8).                       01910000
001920     02  WS-DA-CYMD REDEFINES WS-DA-CYMD-N.                       01920000
001930         03  CCYY                 PIC 9999.                       01930000
001940         03  MM                   PIC 99.                         01940000
001950         03  DD                   PIC 99.                         01950000
001960*                                                                 01960000
001970     02  WS-DA-UE.                                                01970000
001980         03  CCYY                 PIC 9999.                       01980000
001990         03  MM                   PIC 99.                         01990000
002000         03  DD                   PIC 99.                         02000000
002010*                                                                 02010000
002020*---- INCLUDE FOR DB2 ------------------------------------------* 02020000
002030     EXEC SQL INCLUDE SQLERRWS END-EXEC.                          02030000
002040     EXEC SQL INCLUDE SQLCA    END-EXEC.                          02040000
002050                                                                  02050000
002060*---- INCLUDE VIEWS --------------------------------------------* 02060000
002070     EXEC SQL INCLUDE DZWCEFTV END-EXEC.                          02070000
002080     EXEC SQL INCLUDE DZBEFFTV END-EXEC.                          02080000
002090     EXEC SQL INCLUDE DZEVEFTV END-EXEC.                          02090000
002100*                                                                 02100000
002110* DECLARE CURSOR FOR BEFF TABLE                                   02110000
002120* ------------------------------                                  02120000
002130*                                                                 02130000
002140     EXEC SQL DECLARE DZBEFFC1 CURSOR WITH HOLD FOR               02140000
002150       SELECT AM_CNSTK_479BEFF                                    02150000
002160            , CT_RKTPROD_479BEFF                                  02160000
002170            , NR_IDSTOCK_479BEFF                                  02170000
002180            , NR_CDSTK_479BEFF                                    02180000
002190            , NS_DBSTK_479BEFF                                    02190000
002200       FROM DZBEFFTV                                              02200000
002210      WHERE CO_IDISSUS_479WCEF = :DCLDZWCEFTV.CO-IDISSUS-479WCEF  02210000
002220        AND NS_IRMOS_479WCEF   = :DCLDZWCEFTV.NS-IRMOS-479WCEF    02220000
002230        AND DA_UBSECIS_479WCEF = :DCLDZWCEFTV.DA-UBSECIS-479WCEF  02230000
002240       FOR READ ONLY                                              02240000
002250              QUERYNO 238                                         02250000
002260     END-EXEC                                                     02260000
002270*                                                                 02270000
002280* DECLARE CURSOR FOR EVEF TABLE                                   02280000
002290* ------------------------------                                  02290000
002300*                                                                 02300000
002310     EXEC SQL DECLARE DZEVEFC2 CURSOR WITH HOLD FOR               02310000
002320       SELECT NR_CI1POS_479EVEF                                   02320000
002330            , NR_CI26POS_479EVEF                                  02330000
002340            , CT_RKTEVPR_479EVEF                                  02340000
002350            , DA_CREVTPD_479EVEF                                  02350000
002360            , NR_IDGOOD_479EVEF                                   02360000
002370            , NR_ID_479EVEF                                       02370000
002380       FROM DZEVEFTV                                              02380000
002390      WHERE CT_RKTPROD_479BEFF = :DCLDZBEFFTV.CT-RKTPROD-479BEFF  02390000
002400        AND NR_IDSTOCK_479BEFF = :DCLDZBEFFTV.NR-IDSTOCK-479BEFF  02400000
002410        AND NR_CDSTK_479BEFF   = :DCLDZBEFFTV.NR-CDSTK-479BEFF    02410000
002420        AND NS_DBSTK_479BEFF   = :DCLDZBEFFTV.NS-DBSTK-479BEFF    02420000
002430      ORDER BY NR_ID_479EVEF DESC                                 02430000
002440      FOR READ ONLY                                               02440000
002450              QUERYNO 258                                         02450000
002460     END-EXEC.                                                    02460000
002470                                                                  02470000
002480*-----------------------------------------------------------------02480000
002490 LINKAGE SECTION.                                                 02490000
002500*-----------------------------------------------------------------02500000
002510 01  PARAM-DATONLY.                                               02510000
002520     03  LS-PARAM                 PIC S9(4) COMP.                 02520000
002530     03  LS-DATE-IND              PIC X.                          02530000
002540     03  LS-DA-DMY.                                               02540000
002550         05  DD                   PIC 99.                         02550000
002560         05  MM                   PIC 99.                         02560000
002570         05  YY                   PIC 99.                         02570000
002580/                                                                 02580000
002590*-----------------------------------------------------------------02590000
002600 PROCEDURE DIVISION USING PARAM-DATONLY.                          02600000
002610 0000-MAIN-PROCEDURE.                                             02610000
002620     PERFORM 1000-INITIALIZE-PROGRAM.                             02620000
002630     PERFORM 2000-PROCESS-PROGRAM.                                02630000
002640     PERFORM 3000-FINALIZE-PROGRAM.                               02640000
002650     STOP RUN.                                                    02650000
002660 1000-INITIALIZE-PROGRAM.                                         02660000
002670*-----------------------------------------------------------------02670000
002680*                                                                 02680000
002690* INITIAL PROCESSING                                              02690000
002700*                                                                 02700000
002710     IF LS-DATE-IND = '0'                                         02710000
002720        ACCEPT WS-DA-YMD FROM DATE                                02720000
002730        MOVE CORR WS-DA-YMD TO WS-DA-DMY                          02730000
002740     ELSE                                                         02740000
002750        MOVE LS-DA-DMY TO WS-DA-DMY                               02750000
002760     END-IF                                                       02760000
002770     MOVE CORR WS-DA-DMY TO WS-DA-CYMD.                           02770000
002780     MOVE YY OF WS-DA-DMY TO CCYY OF WS-DA-CYMD.                  02780000
002790*                                                                 02790000
002800     IF CCYY OF WS-DA-CYMD LESS 80                                02800000
002810        ADD 2000 TO CCYY OF WS-DA-CYMD                            02810000
002820     ELSE                                                         02820000
002830        ADD 1900 TO CCYY OF WS-DA-CYMD                            02830000
002840     END-IF                                                       02840000
002850                                                                  02850000
002860     MOVE CS-PROGRAM             TO PROGRAM-NAME                  02860000
002870     PERFORM 600-GET-TIMESTAMP                                    02870000
002880     SET EMISSIONS-NOT-EOF       TO TRUE                          02880000
002890                                                                  02890000
002900     OPEN INPUT  EMISSIONS-I                                      02900000
002910          OUTPUT EFFEKT-O.                                        02910000
002920                                                                  02920000
002930     PERFORM READ-INPUT.                                          02930000
002940 2000-PROCESS-PROGRAM.                                            02940000
002950     PERFORM VERWERK-EMISSIONS UNTIL EMISSIONS-EOF.               02950000
002960 3000-FINALIZE-PROGRAM.                                           02960000
002970     CLOSE EMISSIONS-I                                            02970000
002980           EFFEKT-O.                                              02980000
002990                                                                  02990000
003000     DISPLAY 'TOTAL INPUT RECORDS  : ' WS-NB-READ-COUNT           03000000
003010     DISPLAY 'TOTAL DZBEFF RECORDS : ' WS-NB-BEFF-COUNT           03010000
003020     DISPLAY 'TOTAL OUTPUT RECORDS : ' WS-NB-OUTPUT-COUNT.        03020000
003030                                                                  03030000
003040 READ-INPUT.                                                      03040000
003050*-----------------------------------------------------------------03050000
003060     INITIALIZE INPUT-RECORD                                      03060000
003070                                                                  03070000
003080     READ EMISSIONS-I INTO INPUT-RECORD                           03080000
003090        AT END SET EMISSIONS-EOF TO TRUE                          03090000
003100     END-READ.                                                    03100000
003110                                                                  03110000
003120     IF EMISSIONS-NOT-EOF                                         03120000
003130        ADD +1                   TO WS-NB-READ-COUNT              03130000
003140     END-IF                                                       03140000
003150     .                                                            03150000
003160*-----------------------------------------------------------------03160000
003170 VERWERK-EMISSIONS.                                               03170000
003180*-----------------------------------------------------------------03180000
003190     MOVE CORR I-DA-UE TO WS-DA-UE                                03190000
003200*                                                                 03200000
003210     INITIALIZE DCLDZWCEFTV                                       03210000
003220                                                                  03220000
003230     PERFORM CALL-VM9BC50T                                        03230000
003240                                                                  03240000
003250     MOVE BC50O-NR-ID-SECU    TO CO-IDISSUS-479WCEF OF DCLDZWCEFTV03250000
003260     MOVE BC50O-NS-SEQ-IRMO   TO NS-IRMOS-479WCEF   OF DCLDZWCEFTV03260000
003270     MOVE ZEROES              TO DA-CCYYMMDD                      03270000
003280     MOVE BC50O-DA-UBSEC-ISSU TO DA-CCYYMMDD                      03280000
003290     IF DA-CCYYMMDD = ZERO OR DA-CCYYMMDD = SPACES                03290000
003300        MOVE 00010101         TO DA-CCYYMMDD                      03300000
003310     END-IF                                                       03310000
003320     MOVE CORR DA-CCYYMMDD-R  TO DA-DD-MM-CCYY                    03320000
003330     MOVE DA-DD-MM-CCYY       TO DA-UBSECIS-479WCEF OF DCLDZWCEFTV03330000
003340*                                                                 03340000
003350     PERFORM 700-SELECT-DZWCEFTV                                  03350000
003360                                                                  03360000
003370     PERFORM READ-INPUT                                           03370000
003380     .                                                            03380000
003390/                                                                 03390000
003400*-----------------------------------------------------------------03400000
003410 200-PROCESS-DZBEFFC1.                                            03410000
003420*-----------------------------------------------------------------03420000
003430     INITIALIZE DCLDZBEFFTV                                       03430000
003440                                                                  03440000
003450**** READ PARENT TABLE BEFF                                       03450000
003460     PERFORM 2100-OPEN-DZBEFFC1                                   03460000
003470     PERFORM 2200-FETCH-DZBEFFC1 UNTIL DZBEFFC1-EOC               03470000
003480     PERFORM 2300-CLOSE-DZBEFFC1                                  03480000
003490     .                                                            03490000
003500*-----------------------------------------------------------------03500000
003510 200-CHECK-CHILD-EVEF.                                            03510000
003520*-----------------------------------------------------------------03520000
003530     MOVE 0                 TO LAATSTE-DA-CR-EVENT-PROD.          03530000
003540     MOVE '000000'          TO LAATSTE-CI.                        03540000
003550     MOVE 0                 TO SW-168                             03550000
003560                                                                  03560000
003570     INITIALIZE DCLDZEVEFTV                                       03570000
003580                UITREC                                            03580000
003590                                                                  03590000
003600**** READ CHILD TABLE EVEF                                        03600000
003610     PERFORM 2400-OPEN-DZEVEFC2                                   03610000
003620                                                                  03620000
003630     PERFORM 2500-FETCH-DZEVEFC2 UNTIL DZEVEFC2-EOC               03630000
003640                                                                  03640000
003650     PERFORM 2600-CLOSE-DZEVEFC2                                  03650000
003660                                                                  03660000
003670**** WRITE THE VALID RECORDS INTO OUTPUT FILE                     03670000
003680     IF SW-168 = 1                                                03680000
003690        MOVE LAATSTE-CI         TO UIT-NR-CI                      03690000
003700        MOVE AM-CNSTK-479BEFF OF DCLDZBEFFTV   TO UIT-AM-CN-STOCK 03700000
003710        MOVE I-CO-INTERNE       TO UIT-CO-INTERNE                 03710000
003720        MOVE ZEROES             TO HELP-NR-STOCK                  03720000
003730        MOVE NR-IDSTOCK-479BEFF OF DCLDZBEFFTV TO HELP-NR-IDSTOCK 03730000
003740        MOVE NR-CDSTK-479BEFF OF DCLDZBEFFTV   TO HELP-NR-CDSTOCK 03740000
003750        MOVE HELP-NR-STOCK      TO UIT-NR-ID-STOCK-CD             03750000
003760        MOVE BC50O-CO-CURR-SECU TO UIT-CO-DEVISE                  03760000
003770        WRITE REFFEKT-O     FROM UITREC                           03770000
003780        ADD 1 TO WS-NB-OUTPUT-COUNT                               03780000
003790     END-IF.                                                      03790000
003800*                                                                 03800000
003810*-----------------------------------------------------------------03810000
003820 NEXT-EVEF.                                                       03820000
003830*-----------------------------------------------------------------03830000
003840**** SELECT THE NR-CI OF THE VALID CHILD RECORD.                  03840000
003850     INITIALIZE HULP-NR-ID-GOOD                                   03850000
003860     MOVE NR-IDGOOD-479EVEF TO HULP-NR-ID-GOOD                    03860000
003870     MOVE ZEROES            TO DA-DD-MM-CCYY                      03870000
003880                               DA-CCYYMMDD                        03880000
003890 DA-CCYYMMDD-R                                                    03890000
003900     MOVE DA-CREVTPD-479EVEF OF DCLDZEVEFTV  TO DA-DD-MM-CCYY     03900000
003910     EVALUATE TRUE                                                03910000
003920      WHEN DA-DD-MM-CCYY = '01.01.0001'                           03920000
003930           MOVE ZEROES                TO DA-CCYYMMDD-R            03930000
003940      WHEN DA-DD-MM-CCYY = '31.12.9999'                           03940000
003950           MOVE '99999999'            TO DA-CCYYMMDD-R            03950000
003960      WHEN OTHER                                                  03960000
003970           MOVE CCYY OF DA-DD-MM-CCYY TO CCYY OF DA-CCYYMMDD-R    03970000
003980           MOVE MM   OF DA-DD-MM-CCYY TO MM   OF DA-CCYYMMDD-R    03980000
003990           MOVE DD   OF DA-DD-MM-CCYY TO DD   OF DA-CCYYMMDD-R    03990000
004000     END-EVALUATE                                                 04000000
004010                                                                  04010000
004020     IF HULP-DA-UB-TRANSF = 00010101                              04020000
004030        MOVE ZEROES TO HULP-DA-UB-TRANSF                          04030000
004040     END-IF                                                       04040000
004050                                                                  04050000
004060     IF CT-RKTEVPR-479EVEF OF DCLDZEVEFTV = '0168' AND            04060000
004070        CT-OPD = 91 AND                                           04070000
004080         DA-CCYYMMDD-R < WS-DA-CYMD                               04080000
004090                                                                  04090000
004100        MOVE WS-DA-UE TO WS-DA-UE-MIN-1MAAND                      04100000
004110        IF MM OF WS-DA-UE-MIN-1MAAND < 2                          04110000
004120           MOVE 12      TO MM   OF WS-DA-UE-MIN-1MAAND            04120000
004130           SUBTRACT 1 FROM CCYY OF WS-DA-UE-MIN-1MAAND            04130000
004140        ELSE                                                      04140000
004150           SUBTRACT 1 FROM MM   OF WS-DA-UE-MIN-1MAAND            04150000
004160        END-IF                                                    04160000
004170                                                                  04170000
004180      IF WS-DA-UE-MIN-1MAAND NOT > DA-CCYYMMDD-R                  04180000
004190           MOVE 1 TO SW-168                                       04190000
004200        END-IF                                                    04200000
004210     END-IF.                                                      04210000
004220*                                                                 04220000
004230     IF CT-RKTEVPR-479EVEF OF DCLDZEVEFTV = '0060' AND            04230000
004240         DA-CCYYMMDD-R NOT < WS-DA-CYMD                           04240000
004250        CONTINUE                                                  04250000
004260     ELSE                                                         04260000
004270        IF CT-RKTEVPR-479EVEF OF DCLDZEVEFTV = '0060' AND         04270000
004280           LAATSTE-DA-CR-EVENT-PROD = 0                           04280000
004290           MOVE 1                 TO LAATSTE-DA-CR-EVENT-PROD     04290000
004300           MOVE SPACES  TO HELP-NR-CIO-FORM                       04300000
004310           MOVE NR-CI1POS-479EVEF OF DCLDZEVEFTV                  04310000
004320             TO HELP-NR-CIO-AS-1POS                               04320000
004330           MOVE NR-CI26POS-479EVEF OF DCLDZEVEFTV                 04330000
004340             TO HELP-NR-CIO-AS-26POS                              04340000
004350           MOVE HELP-NR-CIO-FORM TO LAATSTE-CI                    04350000
004360        ELSE                                                      04360000
004370           IF CT-RKTEVPR-479EVEF OF DCLDZEVEFTV = '0092' AND      04370000
004380              HULP-DA-UB-TRANSF > LAATSTE-DA-CR-EVENT-PROD AND    04380000
004390              HULP-DA-UB-TRANSF < WS-DA-CYMD-N                    04390000
004400              MOVE HULP-DA-UB-TRANSF TO LAATSTE-DA-CR-EVENT-PROD  04400000
004410              MOVE SPACES  TO HELP-NR-CIO-FORM                    04410000
004420              MOVE NR-CI1POS-479EVEF  OF DCLDZEVEFTV              04420000
004430                TO HELP-NR-CIO-AS-1POS                            04430000
004440              MOVE NR-CI26POS-479EVEF OF DCLDZEVEFTV              04440000
004450                TO HELP-NR-CIO-AS-26POS                           04450000
004460              MOVE HELP-NR-CIO-FORM  TO LAATSTE-CI                04460000
004470           END-IF                                                 04470000
004480        END-IF                                                    04480000
004490     END-IF                                                       04490000
004500     .                                                            04500000
004510*                                                                 04510000
004520*-----------------------------------------------------------------04520000
004530 CALL-VM9BC50T.                                                   04530000
004540*-----------------------------------------------------------------04540000
004550     INITIALIZE WS-VM9BC50I.                                      04550000
004560     INITIALIZE WS-VM9BC50O.                                      04560000
004570     MOVE CS-PROGRAM       TO BC50I-NM-CALLER                     04570000
004580     MOVE 'VM9BC50T'       TO BC50I-NM-BB                         04580000
004590     MOVE 'P'              TO BC50I-CO-TRANSMISSION               04590000
004600     MOVE 'QUERY001'       TO BC50I-NM-FUNCTION                   04600000
004610     MOVE '2'              TO BC50I-CO-CLE                        04610000
004620     MOVE I-CO-INTERNE     TO BC50I-NR-CLE-NO-INTERNE             04620000
004630     MOVE 'Y'              TO BC50I-CO-DONNEES-FIXES.             04630000
004640     MOVE 'Y'              TO BC50I-CO-CONDITIONS-EMISSION.       04640000
004650     MOVE 'Y'              TO BC50I-CO-CONDITIONS-VENTE.          04650000
004660     MOVE WS-DA-CYMD       TO BC50I-DA-DEMANDE.                   04660000
004670     MOVE WS-VM9BC50I      TO WS-VM9BC50T.                        04670000
004680     CALL CS-VM9BC50T USING WS-VM9BC50T.                          04680000
004690     MOVE WS-VM9BC50T      TO WS-VM9BC50O                         04690000
004700     .                                                            04700000
004710                                                                  04710000
004720*-----------------------------------------------------------------04720000
004730 600-GET-TIMESTAMP.                                               04730000
004740*-----------------------------------------------------------------04740000
004750D    DISPLAY '600-GET-TIMESTAMP.'                                 04750000
004760     MOVE FUNCTION CURRENT-DATE            TO TS-SYSTEM.          04760000
004770     MOVE CC OF TS-SYSTEM                  TO CC OF TS-TIMESTAMP  04770000
004780     MOVE YY OF TS-SYSTEM                  TO YY OF TS-TIMESTAMP  04780000
004790     MOVE MM OF TS-SYSTEM                  TO MM OF TS-TIMESTAMP  04790000
004800     MOVE DD OF TS-SYSTEM                  TO DD OF TS-TIMESTAMP  04800000
004810     MOVE HH OF TS-SYSTEM                  TO HH OF TS-TIMESTAMP  04810000
004820     MOVE MI OF TS-SYSTEM                  TO MI OF TS-TIMESTAMP  04820000
004830     MOVE SS OF TS-SYSTEM                  TO SS OF TS-TIMESTAMP  04830000
004840     MOVE TT OF TS-SYSTEM                  TO TT OF TS-TIMESTAMP  04840000
004850     DISPLAY 'TIMESTAMP: ' TS-TIMESTAMP                           04850000
004860     .                                                            04860000
004870*---------------------------------------------------------------* 04870000
004880*    SELECT DZWCEFTV                                              04880000
004890*---------------------------------------------------------------* 04890000
004900 700-SELECT-DZWCEFTV.                                             04900000
004910D    DISPLAY '700-SELECT-DZWCEFTV.'                               04910000
004920     MOVE 700    TO SQL-LOCATION                                  04920000
004930                                                                  04930000
004940     EXEC SQL                                                     04940000
004950      SELECT CO_IDISSUS_479WCEF                                   04950000
004960       INTO :DCLDZWCEFTV.CO-IDISSUS-479WCEF                       04960000
004970       FROM DZWCEFTV                                              04970000
004980      WHERE CO_IDISSUS_479WCEF = :DCLDZWCEFTV.CO-IDISSUS-479WCEF  04980000
004990        AND NS_IRMOS_479WCEF   = :DCLDZWCEFTV.NS-IRMOS-479WCEF    04990000
005000        AND DA_UBSECIS_479WCEF = :DCLDZWCEFTV.DA-UBSECIS-479WCEF  05000000
005010      QUERYNO 495                                                 05010000
005020     END-EXEC                                                     05020000
005030                                                                  05030000
005040     EVALUATE SQLCODE                                             05040000
005050       WHEN ZERO                                                  05050000
005060            PERFORM 200-PROCESS-DZBEFFC1                          05060000
005070       WHEN 100                                                   05070000
005080            DISPLAY 'NO DATA FOUND FOR SELECT DZWCEFTV'           05080000
005090            DISPLAY 'CO-IDISSUS  = ' CO-IDISSUS-479WCEF           05090000
005100                                     OF DCLDZWCEFTV               05100000
005110            DISPLAY 'NR-IRMOS    = ' NS-IRMOS-479WCEF             05110000
005120                                     OF DCLDZWCEFTV               05120000
005130            DISPLAY 'DA-UBSECIS  = ' DA-UBSECIS-479WCEF           05130000
005140                                     OF DCLDZWCEFTV               05140000
005150       WHEN OTHER                                                 05150000
005160            DISPLAY 'ERROR WHILE SELECTING DZWCEFTV'              05160000
005170            DISPLAY 'CO-IDISSUS  = ' CO-IDISSUS-479WCEF           05170000
005180                                     OF DCLDZWCEFTV               05180000
005190            DISPLAY 'NR-IRMOS    = ' NS-IRMOS-479WCEF             05190000
005200                                     OF DCLDZWCEFTV               05200000
005210            DISPLAY 'DA-UBSECIS  = ' DA-UBSECIS-479WCEF           05210000
005220                                     OF DCLDZWCEFTV               05220000
005230            PERFORM SQLERROR                                      05230000
005240     END-EVALUATE                                                 05240000
005250     .                                                            05250000
005260*---------------------------------------------------------------* 05260000
005270*    OPEN CURSOR                                                  05270000
005280*---------------------------------------------------------------* 05280000
005290 2100-OPEN-DZBEFFC1.                                              05290000
005300D    DISPLAY '71O-OPEN-DZBEFFC1.'                                 05300000
005310     MOVE 2100   TO SQL-LOCATION                                  05310000
005320                                                                  05320000
005330     EXEC SQL                                                     05330000
005340       OPEN DZBEFFC1                                              05340000
005350     END-EXEC                                                     05350000
005360                                                                  05360000
005370     EVALUATE SQLCODE                                             05370000
005380       WHEN ZERO                                                  05380000
005390            SET DZBEFFC1-NOT-EOC TO TRUE                          05390000
005400       WHEN OTHER                                                 05400000
005410            DISPLAY 'ERROR WHILE OPENING CURSOR DZBEFFC1'         05410000
005420            PERFORM SQLERROR                                      05420000
005430     END-EVALUATE                                                 05430000
005440     .                                                            05440000
005450*---------------------------------------------------------------* 05450000
005460*    FETCH CURSOR                                                 05460000
005470*---------------------------------------------------------------* 05470000
005480 2200-FETCH-DZBEFFC1.                                             05480000
005490D    DISPLAY '2200-FETCH-DZBEFFC1.'                               05490000
005500     MOVE 2200   TO SQL-LOCATION                                  05500000
005510                                                                  05510000
005520     EXEC SQL                                                     05520000
005530       FETCH DZBEFFC1                                             05530000
005540        INTO :DCLDZBEFFTV.AM-CNSTK-479BEFF                        05540000
005550           , :DCLDZBEFFTV.CT-RKTPROD-479BEFF                      05550000
005560           , :DCLDZBEFFTV.NR-IDSTOCK-479BEFF                      05560000
005570           , :DCLDZBEFFTV.NR-CDSTK-479BEFF                        05570000
005580           , :DCLDZBEFFTV.NS-DBSTK-479BEFF                        05580000
005590     END-EXEC                                                     05590000
005600                                                                  05600000
005610     EVALUATE SQLCODE                                             05610000
005620       WHEN ZERO                                                  05620000
005630            ADD 1 TO WS-NB-BEFF-COUNT                             05630000
005640            PERFORM 200-CHECK-CHILD-EVEF                          05640000
005650       WHEN 100                                                   05650000
005660            SET DZBEFFC1-EOC TO TRUE                              05660000
005670       WHEN OTHER                                                 05670000
005680            DISPLAY 'ERROR WHILE FETCHING CURSOR DZBEFFC1'        05680000
005690            DISPLAY 'CO-IDISSUS  = ' CO-IDISSUS-479WCEF           05690000
005700                                     OF DCLDZWCEFTV               05700000
005710            DISPLAY 'NR-IRMOS    = ' NS-IRMOS-479WCEF             05710000
005720                                     OF DCLDZWCEFTV               05720000
005730            DISPLAY 'DA-UBSECIS  = ' DA-UBSECIS-479WCEF           05730000
005740                                     OF DCLDZWCEFTV               05740000
005750            PERFORM SQLERROR                                      05750000
005760     END-EVALUATE                                                 05760000
005770     .                                                            05770000
005780*---------------------------------------------------------------* 05780000
005790*    CLOSE CURSOR                                                 05790000
005800*---------------------------------------------------------------* 05800000
005810 2300-CLOSE-DZBEFFC1.                                             05810000
005820D    DISPLAY '2300-CLOSE-DZBEFFC1.'                               05820000
005830     MOVE 2300   TO SQL-LOCATION                                  05830000
005840                                                                  05840000
005850     EXEC SQL                                                     05850000
005860       CLOSE DZBEFFC1                                             05860000
005870     END-EXEC                                                     05870000
005880                                                                  05880000
005890     EVALUATE SQLCODE                                             05890000
005900       WHEN ZERO                                                  05900000
005910            CONTINUE                                              05910000
005920       WHEN OTHER                                                 05920000
005930            DISPLAY 'ERROR WHILE CLOSING CURSOR DZBEFFC1'         05930000
005940            PERFORM SQLERROR                                      05940000
005950     END-EVALUATE                                                 05950000
005960     .                                                            05960000
005970*---------------------------------------------------------------* 05970000
005980*    OPEN CURSOR                                                  05980000
005990*---------------------------------------------------------------* 05990000
006000 2400-OPEN-DZEVEFC2.                                              06000000
006010D    DISPLAY '2400-OPEN-DZEVEFC2'                                 06010000
006020     MOVE 2400   TO SQL-LOCATION                                  06020000
006030                                                                  06030000
006040     EXEC SQL                                                     06040000
006050       OPEN DZEVEFC2                                              06050000
006060     END-EXEC                                                     06060000
006070                                                                  06070000
006080     EVALUATE SQLCODE                                             06080000
006090       WHEN ZERO                                                  06090000
006100            SET DZEVEFC2-NOT-EOC TO TRUE                          06100000
006110       WHEN OTHER                                                 06110000
006120            DISPLAY 'ERROR WHILE OPENING CURSOR DZEVEFC2'         06120000
006130            PERFORM SQLERROR                                      06130000
006140     END-EVALUATE                                                 06140000
006150     .                                                            06150000
006160*---------------------------------------------------------------* 06160000
006170*    FETCH CURSOR                                                 06170000
006180*---------------------------------------------------------------* 06180000
006190 2500-FETCH-DZEVEFC2.                                             06190000
006200D    DISPLAY '2500-FETCH-DZEVEFC2.'                               06200000
006210     MOVE 2500   TO SQL-LOCATION                                  06210000
006220                                                                  06220000
006230     EXEC SQL                                                     06230000
006240       FETCH DZEVEFC2                                             06240000
006250        INTO :DCLDZEVEFTV.NR-CI1POS-479EVEF                       06250000
006260           , :DCLDZEVEFTV.NR-CI26POS-479EVEF                      06260000
006270           , :DCLDZEVEFTV.CT-RKTEVPR-479EVEF                      06270000
006280           , :DCLDZEVEFTV.DA-CREVTPD-479EVEF                      06280000
006290           , :DCLDZEVEFTV.NR-IDGOOD-479EVEF                       06290000
006300           , :DCLDZEVEFTV.NR-ID-479EVEF                           06300000
006310     END-EXEC                                                     06310000
006320                                                                  06320000
006330     EVALUATE SQLCODE                                             06330000
006340       WHEN ZERO                                                  06340000
006350            PERFORM NEXT-EVEF                                     06350000
006360       WHEN 100                                                   06360000
006370            SET DZEVEFC2-EOC TO TRUE                              06370000
006380       WHEN OTHER                                                 06380000
006390            DISPLAY 'ERROR WHILE FETCHING CURSOR DZEVEFC2'        06390000
006400            DISPLAY 'CT-RKT-PROD = ' CT-RKTPROD-479BEFF           06400000
006410                                     OF DCLDZBEFFTV               06410000
006420            DISPLAY 'NR-ID-STOCK = ' NR-IDSTOCK-479BEFF           06420000
006430                                     OF DCLDZBEFFTV               06430000
006440            DISPLAY 'NR-CD-STOCK = ' NR-CDSTK-479BEFF             06440000
006450                                     OF DCLDZBEFFTV               06450000
006460            DISPLAY 'NR-DB-STOCK = ' NS-DBSTK-479BEFF             06460000
006470                                     OF DCLDZBEFFTV               06470000
006480            PERFORM SQLERROR                                      06480000
006490     END-EVALUATE                                                 06490000
006500     .                                                            06500000
006510*---------------------------------------------------------------* 06510000
006520*    CLOSE CURSOR                                                 06520000
006530*---------------------------------------------------------------* 06530000
006540 2600-CLOSE-DZEVEFC2.                                             06540000
006550D    DISPLAY '2600-CLOSE-DZEVEFC2.'                               06550000
006560     MOVE 2600   TO SQL-LOCATION                                  06560000
006570                                                                  06570000
006580     EXEC SQL                                                     06580000
006590       CLOSE DZEVEFC2                                             06590000
006600     END-EXEC                                                     06600000
006610                                                                  06610000
006620     EVALUATE SQLCODE                                             06620000
006630       WHEN ZERO                                                  06630000
006640            CONTINUE                                              06640000
006650       WHEN OTHER                                                 06650000
006660            DISPLAY 'ERROR WHILE CLOSING CURSOR DZEVEFC2'         06660000
006670            PERFORM SQLERROR                                      06670000
006680     END-EVALUATE                                                 06680000
006690     .                                                            06690000
006700* SQLERROR ROUTINE.                                               06700000
006710     EXEC SQL                                                     06710000
006720          INCLUDE SQLERROR                                        06720000
006730     END-EXEC.                                                    06730000
