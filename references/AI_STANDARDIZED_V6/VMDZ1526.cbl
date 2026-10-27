000010 CBL ARITH(EXTEND)                                                00010000
000020 IDENTIFICATION DIVISION.                                         00020000
000030*------------------------                                         00030000
000040 PROGRAM-ID.    VMDZ1526.                                         00040000
000050 AUTHOR.        GANESHKUMAR JAIN (JAINRG)                         00050000
000060 DATE-WRITTEN.  05-01-26.                                         00060000
000070 DATE-COMPILED.                                                   00070000
000080                                                                  00080000
000090*************************************************************     00090000
000100*                                                           *     00100000
000110* THIS PROGRAM IS BEING USED TO INSERT & UPDATE THE INPUT   *     00110000
000120* KASBONS DATA IN THE FOLLOWING KASBONS DB2 TABLE:          *     00120000
000130* DZEVEFTB - BOTH INSERT & UPDATE                           *     00130000
000140* AND ALSO UPDATE THE DATA (BOTH INSERT & UPDATE) IN THE    *     00140000
000150* KASBONS DB2 RESTART TABLE: DZ01RSTB                       *     00150000
000160*                                                           *     00160000
000170*                                                           *     00170000
000180*************************************************************     00180000
000190                                                                  00190000
000200 ENVIRONMENT DIVISION.                                            00200000
000210*---------------------                                            00210000
000220 CONFIGURATION SECTION.                                           00220000
000230 SOURCE-COMPUTER. IBM-370.                                        00230000
000240 OBJECT-COMPUTER. IBM-370.                                        00240000
000250                                                                  00250000
000260 INPUT-OUTPUT SECTION.                                            00260000
000270 FILE-CONTROL.                                                    00270000
000280     SELECT INFIL ASSIGN TO UT-S-DD020.                           00280000
000290                                                                  00290000
000300                                                                  00300000
000310 DATA DIVISION.                                                   00310000
000320*--------------                                                   00320000
000330 FILE SECTION.                                                    00330000
000340 FD  INFIL                                                        00340000
000350     BLOCK CONTAINS 0 RECORDS                                     00350000
000360     LABEL RECORD IS STANDARD                                     00360000
000370     RECORDING MODE F                                             00370000
000380     DATA RECORD IS VMDZ205I.                                     00380000
000390                                                                  00390000
000400* COPYBOOK                                                        00400000
000410     COPY VMDZ205I.                                               00410000
000420                                                                  00420000
000430                                                                  00430000
000440 WORKING-STORAGE SECTION.                                         00440000
000450                                                                  00450000
000460 01  WS-HULPVELDEN.                                               00460000
000470     02  SW-VMDZ205I                            PIC X.            00470000
000480         88  VMDZ205I-NOT-EOF VALUE 'N'.                          00480000
000490         88  VMDZ205I-EOF     VALUE 'Y'.                          00490000
000500     02  SW-DZEVEFC1                            PIC X.            00500000
000510         88  NOF-DZEVEFC1     VALUE 'N'.                          00510000
000520         88  EOF-DZEVEFC1     VALUE 'Y'.                          00520000
000530 01 HELP-VAR.                                                     00530000
000540     02  TELLER               VALUE +0          PIC S9(5) COMP-3. 00540000
000550     02  USERABEN             VALUE 'USERABEN'  PIC X(8).         00550000
000560     02  WS-NB-INPUT-UPD-I    VALUE +0          PIC S9(5) COMP-3. 00560000
000570     02  WS-INSERT-EVEF       VALUE 0           PIC S9(5) COMP-3. 00570000
000580     02  WS-UPD-EVEF          VALUE 0           PIC S9(5) COMP-3. 00580000
000590     02  CS-PROGRAM           VALUE 'VMDZ1526'  PIC X(8).         00590000
000600     02  WS-RESTART-REC.                                          00600000
000610         03 NB-READ                             PIC 9(15).        00610000
000620         03 KY-RESTART                          PIC X(1200).      00620000
000630     02  WS-INPUT-KASBONS                       PIC X(1200).      00630000
000640     02  WS-NS-DB-TEMP        VALUE 0           PIC 9(2).         00640000
000650     02  MAX-TS-TIMESTAMP                       PIC X(26)         00650000
000660                              VALUE  '9999-12-31-23.59.59.999999'.00660000
000670                                                                  00670000
000680 01  HULP-NR-ID-GOOD.                                             00680000
000690     03  HULP-NR-CIO                            PIC 9(8).         00690000
000700     03  HULP-DA-CREA                           PIC 9(8).         00700000
000710     03  HULP-NR-ID                             PIC 9(6).         00710000
000720     03  HULP-CT-OPD                            PIC 999.          00720000
000730     03  HULP-CT-OPG                            PIC 999.          00730000
000740 01  HELP-NR-CIO-FORM-AS.                                         00740000
000750     03  HELP-NR-CIO-FORM-AS-P6 VALUE 0         PIC 9(6).         00750000
000760     03  HELP-NR-CIO-FORM-AS-P6-R REDEFINES                       00760000
000770                                      HELP-NR-CIO-FORM-AS-P6.     00770000
000780         05  HELP-NR-CIO-FORM-AS-1POS           PIC X(1).         00780000
000790         05  HELP-NR-CIO-FORM-AS-26POS          PIC X(5).         00790000
000800 01  STOP-DATONLY.                                                00800000
000810     02  DATE-YMD.                                                00810000
000820         03  D-YEAR                             PIC 99.           00820000
000830         03  D-MONTH                            PIC 99.           00830000
000840         03  D-DAY                              PIC 99.           00840000
000850     02  DATE-DMY.                                                00850000
000860         03  D-DAY                              PIC 99.           00860000
000870         03  D-MONTH                            PIC 99.           00870000
000880         03  D-YEAR                             PIC 99.           00880000
000890     02  DATE-YMD8.                                               00890000
000900         03  D-CENT                             PIC 99.           00900000
000910         03  D-YEAR                             PIC 99.           00910000
000920         03  D-MONTH                            PIC 99.           00920000
000930         03  D-DAY                              PIC 99.           00930000
000940     02  DATE-DMY8.                                               00940000
000950         03  D-DAY                              PIC 99.           00950000
000960         03  D-MONTH                            PIC 99.           00960000
000970         03  D-CENT                             PIC 99.           00970000
000980         03  D-YEAR                             PIC 99.           00980000
000990                                                                  00990000
001000 01  WS-DATUMVELDEN.                                              01000000
001010     03  DA-CCYYMMDD.                                             01010000
001020         05  CC                     PIC 99           VALUE ZERO.  01020000
001030         05  YY                     PIC 99           VALUE ZERO.  01030000
001040         05  MM                     PIC 99           VALUE ZERO.  01040000
001050         05  DD                     PIC 99           VALUE ZERO.  01050000
001060     03  DA-CCYYMMDD-R REDEFINES DA-CCYYMMDD.                     01060000
001070         05  CCYY                   PIC 9999.                     01070000
001080         05  MM                     PIC 99.                       01080000
001090         05  DD                     PIC 99.                       01090000
001100     02  DA-DD-MM-CCYY.                                           01100000
001110         03  DD                     PIC 9(02).                    01110000
001120         03  TE-MARKER5             PIC X VALUE '.'.              01120000
001130         03  MM                     PIC 9(02).                    01130000
001140         03  TE-MARKER6             PIC X VALUE '.'.              01140000
001150         03  CCYY                   PIC 9(04).                    01150000
001160                                                                  01160000
001170* -----------------------------                                   01170000
001180 01  WS-TIMESTAMP-FIELDS.                                         01180000
001190     05 TS-SYSTEM.                                                01190000
001200        10  DA-SYS.                                               01200000
001210            15  DA-SYS-CCYY.                                      01210000
001220                20  CC              PIC X(2).                     01220000
001230                20  YY              PIC X(2).                     01230000
001240            15  MM                  PIC X(2).                     01240000
001250            15  DD                  PIC X(2).                     01250000
001260        10  HR-SYS.                                               01260000
001270            15  HH                  PIC X(2).                     01270000
001280            15  MI                  PIC X(2).                     01280000
001290            15  SS                  PIC X(2).                     01290000
001300            15  TT                  PIC X(2).                     01300000
001310     05 TS-TIMESTAMP.                                             01310000
001320        10  CC                      PIC X(2).                     01320000
001330        10  YY                      PIC X(2).                     01330000
001340        10  TE-MARKER1              PIC X     VALUE '-'.          01340000
001350        10  MM                      PIC X(2).                     01350000
001360        10  TE-MARKER2              PIC X     VALUE '-'.          01360000
001370        10  DD                      PIC X(2).                     01370000
001380        10  TE-MARKER3              PIC X     VALUE '-'.          01380000
001390        10  HH                      PIC X(2).                     01390000
001400        10  TE-MARKER4              PIC X     VALUE '.'.          01400000
001410        10  MI                      PIC X(2).                     01410000
001420        10  TE-MARKER5              PIC X     VALUE '.'.          01420000
001430        10  SS                      PIC X(2).                     01430000
001440        10  TE-MARKER6              PIC X     VALUE '.'.          01440000
001450        10  TT                      PIC X(2).                     01450000
001460        10  NNNN                    PIC 9(04) VALUE 0.            01460000
001470*                                                                 01470000
001480*----- INCLUDE FOR DB2 ------------------------------------------*01480000
001490     EXEC SQL INCLUDE SQLERRWS END-EXEC.                          01490000
001500     EXEC SQL INCLUDE SQLCA    END-EXEC.                          01500000
001510                                                                  01510000
001520*----- INCLUDE VIEWS --------------------------------------------*01520000
001530     EXEC SQL INCLUDE DZBEFFTV END-EXEC.                          01530000
001540     EXEC SQL INCLUDE DZEVEFTV END-EXEC.                          01540000
001550     EXEC SQL INCLUDE DZ01RSTV END-EXEC.                          01550000
001560*                                                                 01560000
001570*----- DECLARE CURSOR -------------------------------------------*01570000
001580*                                                                 01580000
001590 LINKAGE SECTION.                                                 01590000
001600 01  PARAM-DATONLY.                                               01600000
001610     03 L-PARAM                     PIC S9(4)  COMP.              01610000
001620     03 DATUMLS.                                                  01620000
001630        05 DAT-IND                  PIC X.                        01630000
001640        05 DATE8-LS                 PIC X(8).                     01640000
001650                                                                  01650000
001660 PROCEDURE DIVISION USING PARAM-DATONLY.                          01660000
001670*---------------------------------------                          01670000
001680                                                                  01680000
001690 0000-MAIN-PROCEDURE.                                             01690000
001700     PERFORM 1000-INITIALIZE-PROGRAM.                             01700000
001710     PERFORM 2000-PROCESS-PROGRAM.                                01710000
001720     PERFORM 3000-FINALIZE-PROGRAM.                               01720000
001730     STOP RUN.                                                    01730000
001740 1000-INITIALIZE-PROGRAM.                                         01740000
001750     PERFORM 100-INITIALISATIE.                                   01750000
001760 2000-PROCESS-PROGRAM.                                            01760000
001770     PERFORM 200-VERWERK-INFIL UNTIL VMDZ205I-EOF.                01770000
001780 3000-FINALIZE-PROGRAM.                                           01780000
001790     PERFORM 830-PROCESS-COMMIT.                                  01790000
001800     CLOSE INFIL.                                                 01800000
001810     DISPLAY 'TOTAL INPUT RECORDS:          ' WS-NB-INPUT-UPD-I.  01810000
001820     DISPLAY 'TOTAL INSERTED INTO DZEVEFTV: ' WS-INSERT-EVEF.     01820000
001830     DISPLAY 'TOTAL UPDATED  IN   DZEVEFTV: ' WS-UPD-EVEF.        01830000
001840                                                                  01840000
001850 100-INITIALISATIE.                                               01850000
001860     INITIALIZE STOP-DATONLY.                                     01860000
001870     PERFORM 840-GET-TIMESTAMP.                                   01870000
001880                                                                  01880000
001890     MOVE DATE8-LS                         TO DATE-DMY8.          01890000
001900     MOVE CORR DATE-DMY8                   TO DATE-DMY.           01900000
001910     MOVE CORR DATE-DMY8                   TO DATE-YMD.           01910000
001920     MOVE CORR DATE-DMY8                   TO DATE-YMD8.          01920000
001930                                                                  01930000
001940     MOVE ZEROES                           TO DA-CCYYMMDD.        01940000
001950     MOVE DATE-YMD8                        TO DA-CCYYMMDD.        01950000
001960     MOVE CORR DA-CCYYMMDD-R               TO DA-DD-MM-CCYY.      01960000
001970                                                                  01970000
001980     MOVE CS-PROGRAM TO PROGRAM-NAME.                             01980000
001990     OPEN INPUT INFIL.                                            01990000
002000     PERFORM 800-RESTART-CONTROL.                                 02000000
002010                                                                  02010000
002020     MOVE +0 TO TELLER.                                           02020000
002030     SET VMDZ205I-NOT-EOF                  TO TRUE.               02030000
002040     PERFORM 900-LEES-INFIL.                                      02040000
002050     MOVE VMDZ205I                         TO WS-INPUT-KASBONS.   02050000
002060                                                                  02060000
002070 110-POSITIONEREN-INFIL.                                          02070000
002080     ADD +1 TO TELLER.                                            02080000
002090     PERFORM 900-LEES-INFIL.                                      02090000
002100     MOVE VMDZ205I TO WS-INPUT-KASBONS.                           02100000
002110     IF VMDZ205I-EOF                                              02110000
002120          PERFORM 120-STOP01                                      02120000
002130     END-IF.                                                      02130000
002140                                                                  02140000
002150 200-VERWERK-INFIL.                                               02150000
002160     ADD +1 TO TELLER.                                            02160000
002170     IF CO-STCIRC-OORD = '1'                                      02170000
002180     THEN PERFORM 210-INSERT-EVFF                                 02180000
002190     ELSE PERFORM 220-UPD-EVEF                                    02190000
002200     END-IF.                                                      02200000
002210     IF TELLER NOT < +100                                         02210000
002220          PERFORM 830-PROCESS-COMMIT                              02220000
002230     END-IF.                                                      02230000
002240     PERFORM 900-LEES-INFIL.                                      02240000
002250     MOVE VMDZ205I       TO WS-INPUT-KASBONS.                     02250000
002260                                                                  02260000
002270 210-INSERT-EVFF.                                                 02270000
002280     INITIALIZE DCLDZBEFFTV                                       02280000
002290                DCLDZEVEFTV.                                      02290000
002300     MOVE '1002'                    TO CT-RKTPROD-479BEFF         02300000
002310                                     OF DCLDZBEFFTV.              02310000
002320      MOVE NR-ST-FORM-AS-R2 OF VMDZ205I TO NR-IDSTOCK-479BEFF     02320000
002330                                      OF DCLDZBEFFTV.             02330000
002340      MOVE NR-ST-FORM-AS-P4 OF VMDZ205I TO NR-CDSTK-479BEFF       02340000
002350                                      OF DCLDZBEFFTV.             02350000
002360     MOVE ZEROES                    TO WS-NS-DB-TEMP.             02360000
002370     MOVE NS-DB-STOCK-FORM-AS       TO WS-NS-DB-TEMP.             02370000
002380     MOVE WS-NS-DB-TEMP             TO NS-DBSTK-479BEFF           02380000
002390                                     OF DCLDZBEFFTV.              02390000
002400     MOVE DA-DD-MM-CCYY             TO DA-CREVTPD-479EVEF         02400000
002410                                     OF DCLDZEVEFTV.              02410000
002420     MOVE '0168'                    TO CT-RKTEVPR-479EVEF         02420000
002430                                     OF DCLDZEVEFTV.              02430000
002440     MOVE '0219'                    TO CT-RKTGDSV-479EVEF         02440000
002450                                     OF DCLDZEVEFTV.              02450000
002460     MOVE NR-CIO-FORM-AS-R          TO HULP-NR-CIO.               02460000
002470     MOVE DA-CREA-FORM-AS-R         TO HULP-DA-CREA.              02470000
002480     MOVE NR-ID-FORM-AS OF VMDZ205I TO HULP-NR-ID.                02480000
002490     MOVE CT-OPD-FORM-AS-R          TO HULP-CT-OPD.               02490000
002500     MOVE CT-OPG-FORM-AS-R          TO HULP-CT-OPG.               02500000
002510     MOVE HULP-NR-ID-GOOD           TO NR-IDGOOD-479EVEF          02510000
002520                                     OF DCLDZEVEFTV.              02520000
002530     MOVE NR-CIO-FORM-AS OF VMDZ205I TO HELP-NR-CIO-FORM-AS.      02530000
002540     MOVE HELP-NR-CIO-FORM-AS-1POS  TO NR-CI1POS-479EVEF          02540000
002550                                     OF DCLDZEVEFTV.              02550000
002560     MOVE HELP-NR-CIO-FORM-AS-26POS TO NR-CI26POS-479EVEF         02560000
002570                                     OF DCLDZEVEFTV.              02570000
002580     MOVE '1002'                    TO CT-RKTPROD-479BEFF         02580000
002590                                     OF DCLDZEVEFTV.              02590000
002600*    MOVE NR-ST-FORM-AS             TO NR-IDSTOCK-479BEFF         02600000
002610*                                    OF DCLDZEVEFTV.              02610000
002620      MOVE NR-ST-FORM-AS-R2 OF VMDZ205I TO NR-IDSTOCK-479BEFF     02620000
002630                                      OF DCLDZEVEFTV.             02630000
002640      MOVE NR-ST-FORM-AS-P4 OF VMDZ205I TO NR-CDSTK-479BEFF       02640000
002650                                      OF DCLDZEVEFTV.             02650000
002660     MOVE ZEROES                    TO WS-NS-DB-TEMP.             02660000
002670     MOVE NS-DB-STOCK-FORM-AS       TO WS-NS-DB-TEMP.             02670000
002680     MOVE WS-NS-DB-TEMP             TO NS-DBSTK-479BEFF           02680000
002690                                     OF DCLDZEVEFTV.              02690000
002700     MOVE TS-TIMESTAMP              TO TS-CREATE-479EVEF          02700000
002710                                     OF DCLDZEVEFTV.              02710000
002720     MOVE MAX-TS-TIMESTAMP          TO TS-UPDATE-479EVEF          02720000
002730                                     OF DCLDZEVEFTV.              02730000
002740     MOVE CS-PROGRAM                TO ID-USERID-479EVEF          02740000
002750                                     OF DCLDZEVEFTV.              02750000
002760     PERFORM 211-SELECT-EFF.                                      02760000
002770                                                                  02770000
002780                                                                  02780000
002790 220-UPD-EVEF.                                                    02790000
002800     INITIALIZE DCLDZEVEFTV.                                      02800000
002810*                                                                 02810000
002820     MOVE '1002'                           TO CT-RKTPROD-479BEFF  02820000
002830                                              OF DCLDZEVEFTV.     02830000
002840      MOVE NR-ST-FORM-AS-R2 OF VMDZ205I TO NR-IDSTOCK-479BEFF     02840000
002850                                      OF DCLDZEVEFTV.             02850000
002860      MOVE NR-ST-FORM-AS-P4 OF VMDZ205I TO NR-CDSTK-479BEFF       02860000
002870                                      OF DCLDZEVEFTV.             02870000
002880     MOVE ZEROES                           TO WS-NS-DB-TEMP.      02880000
002890     MOVE NS-DB-STOCK-FORM-AS              TO WS-NS-DB-TEMP.      02890000
002900     MOVE WS-NS-DB-TEMP                    TO NS-DBSTK-479BEFF    02900000
002910                                              OF DCLDZEVEFTV.     02910000
002920     MOVE '0168'                           TO CT-RKTEVPR-479EVEF  02920000
002930                                              OF DCLDZEVEFTV.     02930000
002940     MOVE '0219'                           TO CT-RKTGDSV-479EVEF  02940000
002950                                              OF DCLDZEVEFTV.     02950000
002960     MOVE NR-CIO-FORM-AS-R                 TO HULP-NR-CIO.        02960000
002970     MOVE DA-CREA-FORM-AS-R                TO HULP-DA-CREA.       02970000
002980     MOVE NR-ID-FORM-AS OF VMDZ205I        TO HULP-NR-ID.         02980000
002990     MOVE CT-OPD-FORM-AS-R                 TO HULP-CT-OPD.        02990000
003000     MOVE CT-OPG-FORM-AS-R                 TO HULP-CT-OPG.        03000000
003010     MOVE HULP-NR-ID-GOOD                  TO NR-IDGOOD-479EVEF   03010000
003020                                              OF DCLDZEVEFTV.     03020000
003030     MOVE TS-TIMESTAMP                     TO TS-UPDATE-479EVEF   03030000
003040                                              OF DCLDZEVEFTV.     03040000
003050     MOVE CS-PROGRAM                       TO ID-USERID-479EVEF   03050000
003060                                              OF DCLDZEVEFTV.     03060000
003070     PERFORM 221-SELECT-EVEF.                                     03070000
003080                                                                  03080000
003090                                                                  03090000
003100 900-LEES-INFIL.                                                  03100000
003110     READ INFIL                                                   03110000
003120          AT END SET VMDZ205I-EOF TO TRUE.                        03120000
003130                                                                  03130000
003140     IF VMDZ205I-NOT-EOF                                          03140000
003150     THEN                                                         03150000
003160          ADD +1 TO WS-NB-INPUT-UPD-I                             03160000
003170     END-IF.                                                      03170000
003180 800-RESTART-CONTROL.                                             03180000
003190     MOVE CS-PROGRAM      TO NM-ID-RS-PROGRAM OF DCLDZ01RSTV.     03190000
003200     MOVE DA-DD-MM-CCYY   TO DA-CR-RS         OF DCLDZ01RSTV.     03200000
003210     MOVE 1               TO NB-ID-RS-PHASE   OF DCLDZ01RSTV.     03210000
003220                                                                  03220000
003230     PERFORM 700-SELECT-DZ01RSTV.                                 03230000
003240                                                                  03240000
003250     EVALUATE SQLCODE                                             03250000
003260         WHEN 0     PERFORM 810-JOB-IS-RESTART                    03260000
003270         WHEN 100   PERFORM 820-WRITE-RESTART-REC                 03270000
003280         WHEN OTHER PERFORM SQLERROR                              03280000
003290     END-EVALUATE.                                                03290000
003300                                                                  03300000
003310 810-JOB-IS-RESTART.                                              03310000
003320     MOVE TE-CH-RS-DATA-TEXT TO WS-RESTART-REC.                   03320000
003330     IF CO-ID-RS IN DCLDZ01RSTV = '1'                             03330000
003340          PERFORM 850-CALL-USERABEN                               03340000
003350     ELSE PERFORM NB-READ OF WS-RESTART-REC TIMES                 03350000
003360          PERFORM 110-POSITIONEREN-INFIL                          03360000
003370          END-PERFORM                                             03370000
003380          MOVE NB-READ OF WS-RESTART-REC TO WS-NB-INPUT-UPD-I     03380000
003390     END-IF.                                                      03390000
003400                                                                  03400000
003410 820-WRITE-RESTART-REC.                                           03410000
003420     MOVE '0'                TO CO-ID-RS           IN DCLDZ01RSTV.03420000
003430     MOVE 15                 TO NB-DAY-RS          IN DCLDZ01RSTV.03430000
003440     MOVE 1215               TO TE-CH-RS-DATA-LEN  IN DCLDZ01RSTV.03440000
003450     MOVE 0                  TO WS-NB-INPUT-UPD-I.                03450000
003460     MOVE WS-NB-INPUT-UPD-I  TO NB-READ OF WS-RESTART-REC.        03460000
003470     INITIALIZE  KY-RESTART.                                      03470000
003480     MOVE WS-RESTART-REC     TO TE-CH-RS-DATA-TEXT IN DCLDZ01RSTV.03480000
003490     PERFORM 700-INSERT-DZ01RSTV.                                 03490000
003500                                                                  03500000
003510 830-PROCESS-COMMIT.                                              03510000
003520     MOVE 0                  TO TELLER                            03520000
003530     MOVE WS-NB-INPUT-UPD-I  TO NB-READ                           03530000
003540     MOVE WS-INPUT-KASBONS   TO KY-RESTART                        03540000
003550     IF   VMDZ205I-EOF                                            03550000
003560     THEN MOVE '1'           TO CO-ID-RS  OF DCLDZ01RSTV          03560000
003570     ELSE MOVE '0'           TO CO-ID-RS  OF DCLDZ01RSTV          03570000
003580     END-IF                                                       03580000
003590     MOVE 15                 TO TE-CH-RS-DATA-LEN                 03590000
003600     MOVE WS-RESTART-REC     TO TE-CH-RS-DATA-TEXT                03600000
003610                                                                  03610000
003620     PERFORM 700-UPDATE-DZ01RSTV                                  03620000
003630                                                                  03630000
003640     MOVE 'COMMIT' TO SQL-LOCATION                                03640000
003650     EXEC SQL                                                     03650000
003660          COMMIT                                                  03660000
003670     END-EXEC                                                     03670000
003680     EVALUATE SQLCODE                                             03680000
003690        WHEN 0                                                    03690000
003700             CONTINUE                                             03700000
003710                                                                  03710000
003720        WHEN OTHER                                                03720000
003730             PERFORM SQLERROR                                     03730000
003740     END-EVALUATE                                                 03740000
003750     .                                                            03750000
003760                                                                  03760000
003770 840-GET-TIMESTAMP.                                               03770000
003780     MOVE FUNCTION CURRENT-DATE  TO TS-SYSTEM.                    03780000
003790     MOVE CC OF TS-SYSTEM     TO CC OF TS-TIMESTAMP               03790000
003800     MOVE YY OF TS-SYSTEM     TO YY OF TS-TIMESTAMP               03800000
003810     MOVE MM OF TS-SYSTEM     TO MM OF TS-TIMESTAMP               03810000
003820     MOVE DD OF TS-SYSTEM     TO DD OF TS-TIMESTAMP               03820000
003830     MOVE HH OF TS-SYSTEM     TO HH OF TS-TIMESTAMP               03830000
003840     MOVE MI OF TS-SYSTEM     TO MI OF TS-TIMESTAMP               03840000
003850     MOVE SS OF TS-SYSTEM     TO SS OF TS-TIMESTAMP               03850000
003860     MOVE TT OF TS-SYSTEM     TO TT OF TS-TIMESTAMP               03860000
003870D    DISPLAY 'TIMESTAMP: ' TS-TIMESTAMP                           03870000
003880     .                                                            03880000
003890 850-CALL-USERABEN.                                               03890000
003900     CALL USERABEN.                                               03900000
003910                                                                  03910000
003920 120-STOP01.                                                      03920000
003930     DISPLAY '##&&VMDZ1526 - STOP01 : TE WEINIG REC OP INFIL'.    03930000
003940     PERFORM 850-CALL-USERABEN.                                   03940000
003950                                                                  03950000
003960 700-SELECT-DZ01RSTV.                                             03960000
003970     MOVE 'SELECT-DZ01RSTV' TO SQL-LOCATION                       03970000
003980     EXEC SQL                                                     03980000
003990        SELECT  NM_ID_RS_PROGRAM                                  03990000
004000              , NB_ID_RS_PHASE                                    04000000
004010              , DA_CR_RS                                          04010000
004020              , CO_ID_RS                                          04020000
004030              , NB_DAY_RS                                         04030000
004040              , TE_CH_RS_DATA                                     04040000
004050          INTO  :DCLDZ01RSTV.NM-ID-RS-PROGRAM                     04050000
004060              , :DCLDZ01RSTV.NB-ID-RS-PHASE                       04060000
004070              , :DCLDZ01RSTV.DA-CR-RS                             04070000
004080              , :DCLDZ01RSTV.CO-ID-RS                             04080000
004090              , :DCLDZ01RSTV.NB-DAY-RS                            04090000
004100              , :DCLDZ01RSTV.TE-CH-RS-DATA                        04100000
004110        FROM   DZ01RSTV                                           04110000
004120        WHERE  NM_ID_RS_PROGRAM = :DCLDZ01RSTV.NM-ID-RS-PROGRAM   04120000
004130          AND  NB_ID_RS_PHASE   = :DCLDZ01RSTV.NB-ID-RS-PHASE     04130000
004140          AND  DA_CR_RS         = :DCLDZ01RSTV.DA-CR-RS           04140000
004150        QUERYNO 396                                               04150000
004160     END-EXEC                                                     04160000
004170     EVALUATE SQLCODE                                             04170000
004180        WHEN 0                                                    04180000
004190        WHEN 100                                                  04190000
004200             CONTINUE                                             04200000
004210        WHEN OTHER                                                04210000
004220             PERFORM SQLERROR                                     04220000
004230     END-EVALUATE                                                 04230000
004240     .                                                            04240000
004250                                                                  04250000
004260 700-UPDATE-DZ01RSTV.                                             04260000
004270     MOVE 'UPDATE-DZ01RSTV' TO SQL-LOCATION                       04270000
004280     EXEC SQL                                                     04280000
004290          UPDATE DZ01RSTV                                         04290000
004300             SET TE_CH_RS_DATA    = :DCLDZ01RSTV.TE-CH-RS-DATA    04300000
004310               , CO_ID_RS         = :DCLDZ01RSTV.CO-ID-RS         04310000
004320           WHERE NM_ID_RS_PROGRAM = :DCLDZ01RSTV.NM-ID-RS-PROGRAM 04320000
004330             AND NB_ID_RS_PHASE   = :DCLDZ01RSTV.NB-ID-RS-PHASE   04330000
004340             AND DA_CR_RS         = :DCLDZ01RSTV.DA-CR-RS         04340000
004350          QUERYNO 415                                             04350000
004360     END-EXEC                                                     04360000
004370                                                                  04370000
004380     EVALUATE SQLCODE                                             04380000
004390         WHEN 0                                                   04390000
004400              CONTINUE                                            04400000
004410         WHEN OTHER                                               04410000
004420              PERFORM SQLERROR                                    04420000
004430     END-EVALUATE                                                 04430000
004440     .                                                            04440000
004450                                                                  04450000
004460 700-INSERT-DZ01RSTV.                                             04460000
004470     MOVE 'INSERT-DZ01RSTV' TO SQL-LOCATION                       04470000
004480     EXEC SQL                                                     04480000
004490          INSERT INTO DZ01RSTV                                    04490000
004500                 VALUES (:DCLDZ01RSTV)                            04500000
004510     END-EXEC                                                     04510000
004520                                                                  04520000
004530     EVALUATE SQLCODE                                             04530000
004540         WHEN 0                                                   04540000
004550              CONTINUE                                            04550000
004560         WHEN OTHER                                               04560000
004570              PERFORM SQLERROR                                    04570000
004580     END-EVALUATE                                                 04580000
004590     .                                                            04590000
004600                                                                  04600000
004610 211-SELECT-EFF.                                                  04610000
004620     MOVE 'SELECT-DZBEFFTV' TO SQL-LOCATION                       04620000
004630     EXEC SQL                                                     04630000
004640        SELECT  CT_RKTPROD_479BEFF                                04640000
004650              , NR_IDSTOCK_479BEFF                                04650000
004660              , NR_CDSTK_479BEFF                                  04660000
004670              , NS_DBSTK_479BEFF                                  04670000
004680              , CO_IDISSUS_479WCEF                                04680000
004690              , NS_IRMOS_479WCEF                                  04690000
004700              , DA_UBSECIS_479WCEF                                04700000
004710              , AM_CNDSTK_479BEFF                                 04710000
004720              , AM_CNSTK_479BEFF                                  04720000
004730              , CT_RKTPRDX_479BEFF                                04730000
004740              , NR_IDISSUE_479BEFF                                04740000
004750              , NR_CDISSUE_479BEFF                                04750000
004760              , NX_CPCRESK_479BEFF                                04760000
004770              , NX_CPAIDSK_479BEFF                                04770000
004780              , NX_CPFDUSK_479BEFF                                04780000
004790              , AM_INTERSK_479BEFF                                04790000
004800              , CO_IDPRKSK_479BEFF                                04800000
004810              , NS_IRMOSTK_479BEFF                                04810000
004820              , DA_UBSECIS_479BEFF                                04820000
004830              , TS_CREATE_479BEFF                                 04830000
004840              , TS_UPDATE_479BEFF                                 04840000
004850              , ID_USERID_479BEFF                                 04850000
004860         INTO   :DCLDZBEFFTV.CT-RKTPROD-479BEFF                   04860000
004870              , :DCLDZBEFFTV.NR-IDSTOCK-479BEFF                   04870000
004880              , :DCLDZBEFFTV.NR-CDSTK-479BEFF                     04880000
004890              , :DCLDZBEFFTV.NS-DBSTK-479BEFF                     04890000
004900              , :DCLDZBEFFTV.CO-IDISSUS-479WCEF                   04900000
004910              , :DCLDZBEFFTV.NS-IRMOS-479WCEF                     04910000
004920              , :DCLDZBEFFTV.DA-UBSECIS-479WCEF                   04920000
004930              , :DCLDZBEFFTV.AM-CNDSTK-479BEFF                    04930000
004940              , :DCLDZBEFFTV.AM-CNSTK-479BEFF                     04940000
004950              , :DCLDZBEFFTV.CT-RKTPRDX-479BEFF                   04950000
004960              , :DCLDZBEFFTV.NR-IDISSUE-479BEFF                   04960000
004970              , :DCLDZBEFFTV.NR-CDISSUE-479BEFF                   04970000
004980              , :DCLDZBEFFTV.NX-CPCRESK-479BEFF                   04980000
004990              , :DCLDZBEFFTV.NX-CPAIDSK-479BEFF                   04990000
005000              , :DCLDZBEFFTV.NX-CPFDUSK-479BEFF                   05000000
005010              , :DCLDZBEFFTV.AM-INTERSK-479BEFF                   05010000
005020              , :DCLDZBEFFTV.CO-IDPRKSK-479BEFF                   05020000
005030              , :DCLDZBEFFTV.NS-IRMOSTK-479BEFF                   05030000
005040              , :DCLDZBEFFTV.DA-UBSECIS-479BEFF                   05040000
005050              , :DCLDZBEFFTV.TS-CREATE-479BEFF                    05050000
005060              , :DCLDZBEFFTV.TS-UPDATE-479BEFF                    05060000
005070              , :DCLDZBEFFTV.ID-USERID-479BEFF                    05070000
005080        FROM    DZBEFFTV                                          05080000
005090        WHERE                                                     05090000
005100              CT_RKTPROD_479BEFF =                                05100000
005110                               :DCLDZBEFFTV.CT-RKTPROD-479BEFF    05110000
005120          AND NR_IDSTOCK_479BEFF =                                05120000
005130                               :DCLDZBEFFTV.NR-IDSTOCK-479BEFF    05130000
005140          AND NR_CDSTK_479BEFF   =                                05140000
005150                               :DCLDZBEFFTV.NR-CDSTK-479BEFF      05150000
005160          AND NS_DBSTK_479BEFF   =                                05160000
005170                               :DCLDZBEFFTV.NS-DBSTK-479BEFF      05170000
005180        QUERYNO 496                                               05180000
005190     END-EXEC                                                     05190000
005200     EVALUATE SQLCODE                                             05200000
005210     WHEN 0                                                       05210000
005220          PERFORM 260-INSERT-EVEF                                 05220000
005230     WHEN OTHER                                                   05230000
005240          DISPLAY 'ERROR AT RECORD NUMBER: ' WS-NB-INPUT-UPD-I    05240000
005250          PERFORM SQLERROR                                        05250000
005260     END-EVALUATE                                                 05260000
005270     .                                                            05270000
005280                                                                  05280000
005290 260-INSERT-EVEF.                                                 05290000
005300     MOVE 'INSERT-DZEVEFTV' TO SQL-LOCATION                       05300000
005310     EXEC SQL                                                     05310000
005320          INSERT INTO DZEVEFTV                                    05320000
005330                 (NR_ID_479EVEF                                   05330000
005340                 ,CT_RKTPROD_479BEFF                              05340000
005350                 ,NR_IDSTOCK_479BEFF                              05350000
005360                 ,NR_CDSTK_479BEFF                                05360000
005370                 ,NS_DBSTK_479BEFF                                05370000
005380                 ,DA_CREVTPD_479EVEF                              05380000
005390                 ,CT_RKTEVPR_479EVEF                              05390000
005400                 ,CT_RKTGDSV_479EVEF                              05400000
005410                 ,NR_IDGOOD_479EVEF                               05410000
005420                 ,NR_CI1POS_479EVEF                               05420000
005430                 ,NR_CI26POS_479EVEF                              05430000
005440                 ,CO_STEVPRN_479EVEF                              05440000
005450                 ,TS_CREATE_479EVEF                               05450000
005460                 ,TS_UPDATE_479EVEF                               05460000
005470                 ,ID_USERID_479EVEF                               05470000
005480                 ,NS_IDMSKEY_479EVEF)                             05480000
005490          VALUES ( RIGHT(DIGITS(NEXT VALUE FOR DZEVEFSQ), 20)     05490000
005500                 , :DCLDZEVEFTV.CT-RKTPROD-479BEFF                05500000
005510                 , :DCLDZEVEFTV.NR-IDSTOCK-479BEFF                05510000
005520                 , :DCLDZEVEFTV.NR-CDSTK-479BEFF                  05520000
005530                 , :DCLDZEVEFTV.NS-DBSTK-479BEFF                  05530000
005540                 , :DCLDZEVEFTV.DA-CREVTPD-479EVEF                05540000
005550                 , :DCLDZEVEFTV.CT-RKTEVPR-479EVEF                05550000
005560                 , :DCLDZEVEFTV.CT-RKTGDSV-479EVEF                05560000
005570                 , :DCLDZEVEFTV.NR-IDGOOD-479EVEF                 05570000
005580                 , :DCLDZEVEFTV.NR-CI1POS-479EVEF                 05580000
005590                 , :DCLDZEVEFTV.NR-CI26POS-479EVEF                05590000
005600                 , :DCLDZEVEFTV.CO-STEVPRN-479EVEF                05600000
005610                 , :DCLDZEVEFTV.TS-CREATE-479EVEF                 05610000
005620                 , :DCLDZEVEFTV.TS-UPDATE-479EVEF                 05620000
005630                 , :DCLDZEVEFTV.ID-USERID-479EVEF                 05630000
005640                 , :DCLDZEVEFTV.NS-IDMSKEY-479EVEF)               05640000
005650     END-EXEC                                                     05650000
005660     EVALUATE SQLCODE                                             05660000
005670     WHEN 0                                                       05670000
005680          ADD 1 TO WS-INSERT-EVEF                                 05680000
005690          CONTINUE                                                05690000
005700     WHEN OTHER                                                   05700000
005710          DISPLAY 'ERROR AT RECORD NUMBER: ' WS-NB-INPUT-UPD-I    05710000
005720          PERFORM SQLERROR                                        05720000
005730     END-EVALUATE                                                 05730000
005740     .                                                            05740000
005750 221-SELECT-EVEF.                                                 05750000
005760     MOVE 'SELECT-DZEVEFTV' TO SQL-LOCATION                       05760000
005770     EXEC SQL                                                     05770000
005780        SELECT NR_ID_479EVEF                                      05780000
005790         INTO  :DCLDZEVEFTV.NR-ID-479EVEF                         05790000
005800        FROM   DZEVEFTV                                           05800000
005810        WHERE CT_RKTPROD_479BEFF = :DCLDZEVEFTV.CT-RKTPROD-479BEFF05810000
005820         AND NR_IDSTOCK_479BEFF = :DCLDZEVEFTV.NR-IDSTOCK-479BEFF 05820000
005830         AND NS_DBSTK_479BEFF   = :DCLDZEVEFTV.NS-DBSTK-479BEFF   05830000
005840         AND NR_CDSTK_479BEFF   = :DCLDZEVEFTV.NR-CDSTK-479BEFF   05840000
005850         AND CT_RKTEVPR_479EVEF = :DCLDZEVEFTV.CT-RKTEVPR-479EVEF 05850000
005860         AND CT_RKTGDSV_479EVEF = :DCLDZEVEFTV.CT-RKTGDSV-479EVEF 05860000
005870         ORDER BY NR_ID_479EVEF DESC                              05870000
005880         FETCH FIRST 1 ROW ONLY                                   05880000
005890        QUERYNO 567                                               05890000
005900     END-EXEC                                                     05900000
005910                                                                  05910000
005920     EVALUATE SQLCODE                                             05920000
005930         WHEN 0                                                   05930000
005940              PERFORM 222-UPDATE-EVEF                             05940000
005950              CONTINUE                                            05950000
005960         WHEN 100                                                 05960000
005970              DISPLAY 'ROW NOT FOUND:          ' WS-NB-INPUT-UPD-I05970000
005980              PERFORM SQLERROR                                    05980000
005990         WHEN OTHER                                               05990000
006000              DISPLAY 'ERROR AT RECORD NUMBER: ' WS-NB-INPUT-UPD-I06000000
006010              PERFORM SQLERROR                                    06010000
006020     END-EVALUATE.                                                06020000
006030 222-UPDATE-EVEF.                                                 06030000
006040                                                                  06040000
006050     MOVE 'UPDATE-DZEVEFTV' TO SQL-LOCATION                       06050000
006060     EXEC SQL                                                     06060000
006070        UPDATE DZEVEFTV                                           06070000
006080          SET NR_IDGOOD_479EVEF = :DCLDZEVEFTV.NR-IDGOOD-479EVEF, 06080000
006090              TS_UPDATE_479EVEF = :DCLDZEVEFTV.TS-UPDATE-479EVEF, 06090000
006100              ID_USERID_479EVEF = :DCLDZEVEFTV.ID-USERID-479EVEF  06100000
006110       WHERE NR_ID_479EVEF      = :DCLDZEVEFTV.NR-ID-479EVEF      06110000
006120        QUERYNO 594                                               06120000
006130     END-EXEC                                                     06130000
006140                                                                  06140000
006150     EVALUATE SQLCODE                                             06150000
006160         WHEN 0                                                   06160000
006170              ADD 1 TO WS-UPD-EVEF                                06170000
006180              CONTINUE                                            06180000
006190         WHEN OTHER                                               06190000
006200              DISPLAY 'VMDZ1526 UPDATE CL� FORM'                  06200000
006210              DISPLAY 'NR-ST:' NR-ST-FORM-AS                      06210000
006220              DISPLAY 'NS-DB:' NS-DB-STOCK-FORM-AS                06220000
006230              PERFORM SQLERROR                                    06230000
006240     END-EVALUATE.                                                06240000
006250                                                                  06250000
006260* SQLERROR ROUTINE.                                               06260000
006270     EXEC SQL                                                     06270000
006280          INCLUDE SQLERROR                                        06280000
006290     END-EXEC.                                                    06290000
