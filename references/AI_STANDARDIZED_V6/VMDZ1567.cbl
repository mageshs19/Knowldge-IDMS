000010 CBL ARITH(EXTEND)                                                00010000
000020 IDENTIFICATION DIVISION.                                         00020000
000030*-----------------------.                                         00030000
000040 PROGRAM-ID.    VMDZ1567.                                         00040000
000050 AUTHOR.        VINAY MAHAJAN.                                    00050000
000060 DATE-WRITTEN.  FEB 2026.                                         00060000
000070 DATE-COMPILED.                                                   00070000
000080                                                                  00080000
000090****************************************************************  00090000
000100*REMARKS.       AANDUIDEN BOEKING IN DB FORMULIER              *  00100000
000110*               VOOR EFFECTENDOSSIERS.                         *  00110000
000120*                                                              *  00120000
000130*  THIS PROGRAM IS BEING USED TO UPDATE WITH THE INPUT KASBONS *  00130000
000140*  DATA (ESPECIALLY ON DATE OF ACCOUNTING REFUNDS FIELD DATA), *  00140000
000150*  IN THE FOLLOWING (1) KASBONS DB2 TABLE: DZBFARTB            *  00150000
000160*                                                              *  00160000
000170*  DZSIARTV (PARENT) ---> DZBFARTV(CHILD)                      *  00170000
000180*                                                              *  00180000
000190*  AND ALSO UPDATE THE DATA (BOTH INSERT & UPDATE) IN THE      *  00190000
000200*  KASBONS DB2 RESTART TABLE: DZ01RSTB.                        *  00200000
000210*                                                              *  00210000
000220****************************************************************  00220000
000230                                                                  00230000
000240 ENVIRONMENT DIVISION.                                            00240000
000250*--------------------.                                            00250000
000260 CONFIGURATION SECTION.                                           00260000
000270 SPECIAL-NAMES.                                                   00270000
000280     DECIMAL-POINT IS COMMA.                                      00280000
000290                                                                  00290000
000300 INPUT-OUTPUT SECTION.                                            00300000
000310 FILE-CONTROL.                                                    00310000
000320     SELECT OPERATIES ASSIGN TO UT-S-DD010.                       00320000
000330                                                                  00330000
000340 DATA DIVISION.                                                   00340000
000350*-------------.                                                   00350000
000360 FILE SECTION.                                                    00360000
000370 FD   OPERATIES                                                   00370000
000380      BLOCK CONTAINS 0 RECORDS                                    00380000
000390      RECORD CONTAINS 1200 CHARACTERS                             00390000
000400      RECORDING F                                                 00400000
000410      LABEL RECORDS STANDARD.                                     00410000
000420 01   OPERATIES-REC             PIC X(1200).                      00420000
000430                                                                  00430000
000440 WORKING-STORAGE SECTION.                                         00440000
000450 77  USERABEN                   PIC X(8) VALUE 'USERABEN'.        00450000
000460 77  CS-PROGRAM                 PIC X(8) VALUE 'VMDZ1567'.        00460000
000470                                                                  00470000
000480 01 WS-SWITCHES.                                                  00480000
000490     02  SW-VMDZ205I            PIC X.                            00490000
000500         88  VMDZ205I-NOT-EOF   VALUE 'N'.                        00500000
000510         88  VMDZ205I-EOF       VALUE 'Y'.                        00510000
000520                                                                  00520000
000530 01  HELP-VARIABLE.                                               00530000
000540     02  WS-RESTART-REC.                                          00540000
000550         03  NB-READ            PIC 9(15).                        00550000
000560         03  KY-RESTART         PIC X(1200).                      00560000
000570                                                                  00570000
000580     02  WS-INPUT-KASBONS       PIC X(1200).                      00580000
000590     02  WS-TELLER              PIC 9(9)   COMP-3 VALUE ZERO.     00590000
000600     02  WS-NB-INPUT-UPD-I      PIC 9(7)   COMP-3 VALUE ZERO.     00600000
000610     02  WS-NB-BFAR-UPD-I       PIC S9(11) COMP-3 VALUE +0.       00610000
000620                                                                  00620000
000630 01  STOP-DATONLY.                                                00630000
000640     02  DATE-YMD.                                                00640000
000650         03  D-YEAR             PIC 99.                           00650000
000660         03  D-MONTH            PIC 99.                           00660000
000670         03  D-DAY              PIC 99.                           00670000
000680     02  DATE-DMY.                                                00680000
000690         03  D-DAY              PIC 99.                           00690000
000700         03  D-MONTH            PIC 99.                           00700000
000710         03  D-YEAR             PIC 99.                           00710000
000720     02  DATE-YMD8.                                               00720000
000730         03  D-CENT             PIC 99.                           00730000
000740         03  D-YEAR             PIC 99.                           00740000
000750         03  D-MONTH            PIC 99.                           00750000
000760         03  D-DAY              PIC 99.                           00760000
000770     02  DATE-DMY8.                                               00770000
000780         03  D-DAY              PIC 99.                           00780000
000790         03  D-MONTH            PIC 99.                           00790000
000800         03  D-CENT             PIC 99.                           00800000
000810         03  D-YEAR             PIC 99.                           00810000
000820                                                                  00820000
000830*                                                                 00830000
000840 01  WS-DATUMVELDEN.                                              00840000
000850     03  DA-YYMMDD.                                               00850000
000860         05  YY                 PIC 99            VALUE ZERO.     00860000
000870         05  MM                 PIC 99            VALUE ZERO.     00870000
000880         05  DD                 PIC 99            VALUE ZERO.     00880000
000890     03  DA-DDMMCCYY.                                             00890000
000900         05  DD                 PIC 99            VALUE ZERO.     00900000
000910         05  MM                 PIC 99            VALUE ZERO.     00910000
000920         05  CC                 PIC 99            VALUE ZERO.     00920000
000930         05  YY                 PIC 99            VALUE ZERO.     00930000
000940     03  DA-CCYYMMDD.                                             00940000
000950         05  CC                 PIC 99            VALUE ZERO.     00950000
000960         05  YY                 PIC 99            VALUE ZERO.     00960000
000970         05  MM                 PIC 99            VALUE ZERO.     00970000
000980         05  DD                 PIC 99            VALUE ZERO.     00980000
000990     03  DA-CCYYMMDD-R REDEFINES DA-CCYYMMDD.                     00990000
001000         05  CCYY               PIC 9999.                         01000000
001010         05  MM                 PIC 99.                           01010000
001020         05  DD                 PIC 99.                           01020000
001030     02  DA-DD-MM-CCYY.                                           01030000
001040         03  DD                 PIC 9(02).                        01040000
001050         03  TE-MARKER5         PIC X             VALUE '.'.      01050000
001060         03  MM                 PIC 9(02).                        01060000
001070         03  TE-MARKER6         PIC X             VALUE '.'.      01070000
001080         03  CCYY               PIC 9(04).                        01080000
001090                                                                  01090000
001100* -----------------------------                                   01100000
001110 01  WS-TIMESTAMP-FIELDS.                                         01110000
001120     05 TS-SYSTEM.                                                01120000
001130        10  DA-SYS.                                               01130000
001140            15  DA-SYS-CCYY.                                      01140000
001150                20  CC          PIC X(2).                         01150000
001160                20  YY          PIC X(2).                         01160000
001170            15  MM              PIC X(2).                         01170000
001180            15  DD              PIC X(2).                         01180000
001190        10  HR-SYS.                                               01190000
001200            15  HH              PIC X(2).                         01200000
001210            15  MI              PIC X(2).                         01210000
001220            15  SS              PIC X(2).                         01220000
001230            15  TT              PIC X(2).                         01230000
001240     05 TS-TIMESTAMP.                                             01240000
001250        10  CC                  PIC X(2).                         01250000
001260        10  YY                  PIC X(2).                         01260000
001270        10  TE-MARKER1          PIC X             VALUE '-'.      01270000
001280        10  MM                  PIC X(2).                         01280000
001290        10  TE-MARKER2          PIC X             VALUE '-'.      01290000
001300        10  DD                  PIC X(2).                         01300000
001310        10  TE-MARKER3          PIC X             VALUE '-'.      01310000
001320        10  HH                  PIC X(2).                         01320000
001330        10  TE-MARKER4          PIC X             VALUE '.'.      01330000
001340        10  MI                  PIC X(2).                         01340000
001350        10  TE-MARKER5          PIC X             VALUE '.'.      01350000
001360        10  SS                  PIC X(2).                         01360000
001370        10  TE-MARKER6          PIC X             VALUE '.'.      01370000
001380        10  TT                  PIC X(2).                         01380000
001390        10  NNNN                PIC 9(04)         VALUE 0.        01390000
001400                                                                  01400000
001410                                                                  01410000
001420*----- INCLUDE FOR DB2 ------------------------------------------*01420000
001430     EXEC SQL INCLUDE SQLERRWS END-EXEC.                          01430000
001440     EXEC SQL INCLUDE SQLCA    END-EXEC.                          01440000
001450                                                                  01450000
001460*----- INCLUDE VIEWS --------------------------------------------*01460000
001470     EXEC SQL INCLUDE DZBFARTV END-EXEC.                          01470000
001480     EXEC SQL INCLUDE DZ01RSTV END-EXEC.                          01480000
001490*                                                                 01490000
001500 COPY VMDZ205I.                                                   01500000
001510                                                                  01510000
001520 LINKAGE SECTION.                                                 01520000
001530 01  PARAM-DATONLY.                                               01530000
001540     03  L-PARAM                PIC S9(4) COMP.                   01540000
001550     03  DATUMLS.                                                 01550000
001560         05  DATE-IND           PIC X.                            01560000
001570         05  DATE8-LS           PIC X(8).                         01570000
001580                                                                  01580000
001590 PROCEDURE DIVISION USING PARAM-DATONLY.                          01590000
001600 0000-MAIN-PROCEDURE.                                             01600000
001610     PERFORM 1000-INITIALIZE-PROGRAM.                             01610000
001620     PERFORM 2000-PROCESS-PROGRAM.                                01620000
001630     PERFORM 3000-FINALIZE-PROGRAM.                               01630000
001640     STOP RUN.                                                    01640000
001650 1000-INITIALIZE-PROGRAM.                                         01650000
001660*--------------------------------------.                          01660000
001670*                                                                 01670000
001680     PERFORM     820000-GET-TIMESTAMP.                            01680000
001690     SET         VMDZ205I-NOT-EOF          TO TRUE.               01690000
001700     INITIALIZE  HELP-VARIABLE.                                   01700000
001710                                                                  01710000
001720     MOVE DATE8-LS                         TO DATE-DMY8.          01720000
001730     MOVE CORR DATE-DMY8                   TO DATE-YMD.           01730000
001740     MOVE CORR DATE-DMY8                   TO DATE-DMY.           01740000
001750     MOVE CORR DATE-DMY8                   TO DATE-YMD8.          01750000
001760                                                                  01760000
001770     MOVE ZEROES                           TO DA-CCYYMMDD.        01770000
001780     MOVE DATE-YMD8                        TO DA-CCYYMMDD.        01780000
001790     MOVE CORR DA-CCYYMMDD-R               TO DA-DD-MM-CCYY.      01790000
001800                                                                  01800000
001810     MOVE CS-PROGRAM TO PROGRAM-NAME.                             01810000
001820     OPEN INPUT OPERATIES.                                        01820000
001830*                                                                 01830000
001840     PERFORM 700-RESTART-CONTROL.                                 01840000
001850                                                                  01850000
001860     PERFORM READ-FLAT-FILE.                                      01860000
001870 2000-PROCESS-PROGRAM.                                            01870000
001880     PERFORM 2100-VERWERKING UNTIL VMDZ205I-EOF.                  01880000
001890 3000-FINALIZE-PROGRAM.                                           01890000
001900     PERFORM 800-PROCESS-COMMIT.                                  01900000
001910                                                                  01910000
001920     DISPLAY 'NUMBER OF RECORDS PROCESSED: ' WS-NB-INPUT-UPD-I.   01920000
001930     DISPLAY 'NUMBER OF UPDATE BFAR      : ' WS-NB-BFAR-UPD-I.    01930000
001940     CLOSE OPERATIES.                                             01940000
001950                                                                  01950000
001960 2100-VERWERKING.                                                 01960000
001970*-----------                                                      01970000
001980     INITIALIZE DCLDZBFARTV.                                      01980000
001990                                                                  01990000
002000     MOVE '1815'                           TO CT-TGDSERV-479BFAR  02000000
002010                                           OF DCLDZBFARTV.        02010000
002020     MOVE NR-CIO-FORM-AS-R                 TO NR-CIOFMAS-479BFAR  02020000
002030                                           OF DCLDZBFARTV.        02030000
002040                                                                  02040000
002050     MOVE ZEROES                           TO DA-CCYYMMDD.        02050000
002060     MOVE DA-CREA-FORM-AS-R                TO DA-CCYYMMDD.        02060000
002070     IF   DA-CCYYMMDD = ZERO OR DA-CCYYMMDD = SPACES              02070000
002080          MOVE 00010101                    TO DA-CCYYMMDD.        02080000
002090     MOVE CORR DA-CCYYMMDD-R               TO DA-DD-MM-CCYY.      02090000
002100     MOVE DA-DD-MM-CCYY                    TO DA-CRFMAS-479BFAR   02100000
002110                                           OF DCLDZBFARTV.        02110000
002120                                                                  02120000
002130     MOVE NR-ID-FORM-AS OF VMDZ205I        TO NR-IDFMAS-479BFAR   02130000
002140                                           OF DCLDZBFARTV.        02140000
002150     MOVE CT-OPG-FORM-AS-R                 TO CT-OPGFMAS-479BFAR  02150000
002160                                           OF DCLDZBFARTV.        02160000
002170     MOVE CT-OPD-FORM-AS-R                 TO CT-OPDFMAS-479BFAR  02170000
002180                                           OF DCLDZBFARTV.        02180000
002190                                                                  02190000
002200     MOVE ZEROES                           TO DA-CCYYMMDD.        02200000
002210     MOVE DATE-YMD8                        TO DA-CCYYMMDD.        02210000
002220     MOVE CORR DA-CCYYMMDD-R               TO DA-DD-MM-CCYY.      02220000
002230     MOVE DA-DD-MM-CCYY                    TO DA-INFSDGD-479BFAR  02230000
002240                                           OF DCLDZBFARTV.        02240000
002250                                                                  02250000
002260     MOVE TS-TIMESTAMP                     TO TS-UPDATE-479BFAR   02260000
002270                                           OF DCLDZBFARTV.        02270000
002280                                                                  02280000
002290     MOVE CS-PROGRAM                       TO ID-USERID-479BFAR   02290000
002300                                           OF DCLDZBFARTV.        02300000
002310                                                                  02310000
002320     PERFORM 1100-UPDATE-VMBFAR.                                  02320000
002330                                                                  02330000
002340     IF WS-TELLER > 99                                            02340000
002350        PERFORM 800-PROCESS-COMMIT                                02350000
002360     END-IF.                                                      02360000
002370                                                                  02370000
002380     PERFORM READ-FLAT-FILE.                                      02380000
002390                                                                  02390000
002400                                                                  02400000
002410                                                                  02410000
002420 READ-FLAT-FILE.                                                  02420000
002430                                                                  02430000
002440     INITIALIZE VMDZ205I.                                         02440000
002450                                                                  02450000
002460     READ OPERATIES INTO VMDZ205I                                 02460000
002470          AT END SET VMDZ205I-EOF          TO TRUE.               02470000
002480                                                                  02480000
002490     IF VMDZ205I-NOT-EOF                                          02490000
002500     THEN                                                         02500000
002510          ADD +1 TO WS-TELLER                                     02510000
002520          ADD +1 TO WS-NB-INPUT-UPD-I                             02520000
002530          MOVE VMDZ205I TO WS-INPUT-KASBONS                       02530000
002540     END-IF.                                                      02540000
002550                                                                  02550000
002560                                                                  02560000
002570                                                                  02570000
002580 820000-GET-TIMESTAMP.                                            02580000
002590D    DISPLAY '820000-GET-TIMESTAMP'.                              02590000
002600     MOVE FUNCTION CURRENT-DATE            TO TS-SYSTEM.          02600000
002610     MOVE CC OF TS-SYSTEM                  TO CC OF TS-TIMESTAMP  02610000
002620     MOVE YY OF TS-SYSTEM                  TO YY OF TS-TIMESTAMP  02620000
002630     MOVE MM OF TS-SYSTEM                  TO MM OF TS-TIMESTAMP  02630000
002640     MOVE DD OF TS-SYSTEM                  TO DD OF TS-TIMESTAMP  02640000
002650     MOVE HH OF TS-SYSTEM                  TO HH OF TS-TIMESTAMP  02650000
002660     MOVE MI OF TS-SYSTEM                  TO MI OF TS-TIMESTAMP  02660000
002670     MOVE SS OF TS-SYSTEM                  TO SS OF TS-TIMESTAMP  02670000
002680     MOVE TT OF TS-SYSTEM                  TO TT OF TS-TIMESTAMP  02680000
002690     DISPLAY 'TIMESTAMP: ' TS-TIMESTAMP                           02690000
002700     .                                                            02700000
002710                                                                  02710000
002720                                                                  02720000
002730 700-RESTART-CONTROL.                                             02730000
002740     MOVE CS-PROGRAM    TO NM-ID-RS-PROGRAM OF DCLDZ01RSTV.       02740000
002750     MOVE DA-DD-MM-CCYY TO DA-CR-RS         OF DCLDZ01RSTV.       02750000
002760     MOVE 1             TO NB-ID-RS-PHASE   OF DCLDZ01RSTV.       02760000
002770                                                                  02770000
002780     PERFORM 700-SELECT-DZ01RSTV.                                 02780000
002790                                                                  02790000
002800     EVALUATE SQLCODE                                             02800000
002810         WHEN 0     PERFORM 710-JOB-IS-RESTART                    02810000
002820         WHEN 100   PERFORM 720-WRITE-RESTART-REC                 02820000
002830         WHEN OTHER PERFORM SQLERROR                              02830000
002840     END-EVALUATE                                                 02840000
002850     .                                                            02850000
002860                                                                  02860000
002870     MOVE 0 TO WS-TELLER.                                         02870000
002880*    SET VMDZ205I-EOF TO TRUE.                                    02880000
002890                                                                  02890000
002900                                                                  02900000
002910 710-JOB-IS-RESTART.                                              02910000
002920*    RESTART RECORD FOUND. THEREFORE RESTART PERFORMED            02920000
002930D    DISPLAY '810-JOB-IS-RESTART'                                 02930000
002940     MOVE TE-CH-RS-DATA-TEXT  TO WS-RESTART-REC                   02940000
002950                                                                  02950000
002960*    IF PREVIOUS VERSION COMPLETE -> THEN WE CAN STOP.            02960000
002970     IF CO-ID-RS IN DCLDZ01RSTV = '1'                             02970000
002980     THEN DISPLAY ' PREVIOUS RUN COMPLETE '                       02980000
002990          PERFORM 810000-CALL-USERABEN                            02990000
003000                                                                  03000000
003010     ELSE PERFORM NB-READ OF WS-RESTART-REC TIMES                 03010000
003020             PERFORM READ-FLAT-FILE                               03020000
003030             MOVE NB-READ OF WS-RESTART-REC TO WS-NB-INPUT-UPD-I  03030000
003040          END-PERFORM                                             03040000
003050                                                                  03050000
003060     END-IF                                                       03060000
003070     .                                                            03070000
003080                                                                  03080000
003090                                                                  03090000
003100 720-WRITE-RESTART-REC.                                           03100000
003110*    RESTART RECORD NOT FOUND => 1ST RUN                          03110000
003120D    DISPLAY '  820-WRITE-RESTART-REC'                            03120000
003130     MOVE '0'                TO CO-ID-RS           IN DCLDZ01RSTV 03130000
003140     MOVE 7                  TO NB-DAY-RS          IN DCLDZ01RSTV 03140000
003150     MOVE 1215               TO TE-CH-RS-DATA-LEN  IN DCLDZ01RSTV 03150000
003160     MOVE 0                  TO WS-NB-INPUT-UPD-I                 03160000
003170     MOVE WS-NB-INPUT-UPD-I  TO NB-READ OF WS-RESTART-REC         03170000
003180     INITIALIZE  KY-RESTART                                       03180000
003190     MOVE WS-RESTART-REC     TO TE-CH-RS-DATA-TEXT IN DCLDZ01RSTV 03190000
003200                                                                  03200000
003210     PERFORM 700-INSERT-DZ01RSTV                                  03210000
003220     .                                                            03220000
003230*                                                                 03230000
003240 810000-CALL-USERABEN.                                            03240000
003250D    DISPLAY '810000-CALL-USERABEN'.                              03250000
003260     CALL USERABEN.                                               03260000
003270                                                                  03270000
003280*                                                                 03280000
003290 800-PROCESS-COMMIT.                                              03290000
003300D    DISPLAY '800-PROCESS-COMMIT'.                                03300000
003310                                                                  03310000
003320     MOVE 0                  TO WS-TELLER.                        03320000
003330     MOVE WS-NB-INPUT-UPD-I  TO NB-READ.                          03330000
003340     MOVE WS-INPUT-KASBONS   TO KY-RESTART.                       03340000
003350     IF   VMDZ205I-EOF                                            03350000
003360     THEN MOVE '1'           TO CO-ID-RS  OF DCLDZ01RSTV          03360000
003370     ELSE MOVE '0'           TO CO-ID-RS  OF DCLDZ01RSTV          03370000
003380     END-IF.                                                      03380000
003390     MOVE 15                 TO TE-CH-RS-DATA-LEN.                03390000
003400     MOVE WS-RESTART-REC     TO TE-CH-RS-DATA-TEXT.               03400000
003410                                                                  03410000
003420     PERFORM 700-UPDATE-DZ01RSTV.                                 03420000
003430                                                                  03430000
003440     MOVE 'COMMIT' TO SQL-LOCATION                                03440000
003450     EXEC SQL                                                     03450000
003460          COMMIT                                                  03460000
003470     END-EXEC.                                                    03470000
003480     EVALUATE SQLCODE                                             03480000
003490        WHEN 0                                                    03490000
003500             CONTINUE                                             03500000
003510        WHEN OTHER                                                03510000
003520             DISPLAY 'ERROR REC NUMBER : ' WS-NB-INPUT-UPD-I      03520000
003530             PERFORM SQLERROR                                     03530000
003540     END-EVALUATE                                                 03540000
003550     .                                                            03550000
003560                                                                  03560000
003570*-----------------------------------------------------------      03570000
003580*                    DB2 SQL CODING                               03580000
003590*-----------------------------------------------------------      03590000
003600                                                                  03600000
003610 700-SELECT-DZ01RSTV.                                             03610000
003620                                                                  03620000
003630D    DISPLAY '700-SELECT-DZ01RSTV'                                03630000
003640     MOVE 'SELECT-DZ01RSTV' TO SQL-LOCATION                       03640000
003650     EXEC SQL                                                     03650000
003660          SELECT NM_ID_RS_PROGRAM                                 03660000
003670               , NB_ID_RS_PHASE                                   03670000
003680               , DA_CR_RS                                         03680000
003690               , CO_ID_RS                                         03690000
003700               , NB_DAY_RS                                        03700000
003710               , TE_CH_RS_DATA                                    03710000
003720            INTO :DCLDZ01RSTV.NM-ID-RS-PROGRAM                    03720000
003730               , :DCLDZ01RSTV.NB-ID-RS-PHASE                      03730000
003740               , :DCLDZ01RSTV.DA-CR-RS                            03740000
003750               , :DCLDZ01RSTV.CO-ID-RS                            03750000
003760               , :DCLDZ01RSTV.NB-DAY-RS                           03760000
003770               , :DCLDZ01RSTV.TE-CH-RS-DATA                       03770000
003780            FROM DZ01RSTV                                         03780000
003790           WHERE NM_ID_RS_PROGRAM = :DCLDZ01RSTV.NM-ID-RS-PROGRAM 03790000
003800             AND NB_ID_RS_PHASE   = :DCLDZ01RSTV.NB-ID-RS-PHASE   03800000
003810             AND DA_CR_RS         = :DCLDZ01RSTV.DA-CR-RS         03810000
003820          QUERYNO 376                                             03820000
003830     END-EXEC                                                     03830000
003840                                                                  03840000
003850     EVALUATE SQLCODE                                             03850000
003860         WHEN 0                                                   03860000
003870         WHEN 100                                                 03870000
003880              CONTINUE                                            03880000
003890         WHEN OTHER                                               03890000
003900              DISPLAY 'ERROR REC NUMBER : ' WS-NB-INPUT-UPD-I     03900000
003910              PERFORM SQLERROR                                    03910000
003920     END-EVALUATE                                                 03920000
003930     .                                                            03930000
003940                                                                  03940000
003950 700-UPDATE-DZ01RSTV.                                             03950000
003960D    DISPLAY '700-UPDATE-DZ01RSTV.'                               03960000
003970     MOVE 'UPDATE-DZ01RSTV' TO SQL-LOCATION                       03970000
003980     EXEC SQL                                                     03980000
003990          UPDATE DZ01RSTV                                         03990000
004000             SET TE_CH_RS_DATA    = :DCLDZ01RSTV.TE-CH-RS-DATA    04000000
004010               , CO_ID_RS         = :DCLDZ01RSTV.CO-ID-RS         04010000
004020           WHERE NM_ID_RS_PROGRAM = :DCLDZ01RSTV.NM-ID-RS-PROGRAM 04020000
004030             AND NB_ID_RS_PHASE   = :DCLDZ01RSTV.NB-ID-RS-PHASE   04030000
004040             AND DA_CR_RS         = :DCLDZ01RSTV.DA-CR-RS         04040000
004050          QUERYNO 398                                             04050000
004060     END-EXEC                                                     04060000
004070                                                                  04070000
004080     EVALUATE SQLCODE                                             04080000
004090         WHEN 0                                                   04090000
004100              CONTINUE                                            04100000
004110         WHEN OTHER                                               04110000
004120              DISPLAY 'ERROR REC NUMBER : ' WS-NB-INPUT-UPD-I     04120000
004130              PERFORM SQLERROR                                    04130000
004140     END-EVALUATE                                                 04140000
004150     .                                                            04150000
004160                                                                  04160000
004170 700-INSERT-DZ01RSTV.                                             04170000
004180D    DISPLAY '700-INSERT-DZ01RSTV.'                               04180000
004190     MOVE 'INSERT-DZ01RSTV' TO SQL-LOCATION                       04190000
004200     EXEC SQL                                                     04200000
004210          INSERT INTO DZ01RSTV                                    04210000
004220                 VALUES (:DCLDZ01RSTV)                            04220000
004230     END-EXEC                                                     04230000
004240                                                                  04240000
004250     EVALUATE SQLCODE                                             04250000
004260         WHEN 0                                                   04260000
004270              CONTINUE                                            04270000
004280         WHEN OTHER                                               04280000
004290              DISPLAY 'ERROR REC NUMBER : ' WS-NB-INPUT-UPD-I     04290000
004300              PERFORM SQLERROR                                    04300000
004310     END-EVALUATE                                                 04310000
004320     .                                                            04320000
004330                                                                  04330000
004340 1100-UPDATE-VMBFAR.                                              04340000
004350D    DISPLAY '1100-UPDATE-VMBFAR.'                                04350000
004360     MOVE 1100 TO SQL-LOCATION                                    04360000
004370                                                                  04370000
004380     EXEC SQL                                                     04380000
004390       UPDATE DZBFARTV                                            04390000
004400         SET DA_INFSDGD_479BFAR = :DCLDZBFARTV.DA-INFSDGD-479BFAR 04400000
004410           , TS_UPDATE_479BFAR  = :DCLDZBFARTV.TS-UPDATE-479BFAR  04410000
004420           , ID_USERID_479BFAR  = :DCLDZBFARTV.ID-USERID-479BFAR  04420000
004430       WHERE CT_TGDSERV_479BFAR = :DCLDZBFARTV.CT-TGDSERV-479BFAR 04430000
004440         AND NR_CIOFMAS_479BFAR = :DCLDZBFARTV.NR-CIOFMAS-479BFAR 04440000
004450         AND DA_CRFMAS_479BFAR  = :DCLDZBFARTV.DA-CRFMAS-479BFAR  04450000
004460         AND NR_IDFMAS_479BFAR  = :DCLDZBFARTV.NR-IDFMAS-479BFAR  04460000
004470         AND CT_OPDFMAS_479BFAR = :DCLDZBFARTV.CT-OPDFMAS-479BFAR 04470000
004480         AND CT_OPGFMAS_479BFAR = :DCLDZBFARTV.CT-OPGFMAS-479BFAR 04480000
004490       QUERYNO 442                                                04490000
004500     END-EXEC                                                     04500000
004510                                                                  04510000
004520     EVALUATE SQLCODE                                             04520000
004530         WHEN 0                                                   04530000
004540              ADD 1 TO WS-NB-BFAR-UPD-I                           04540000
004550         WHEN OTHER                                               04550000
004560              DISPLAY 'ERROR REC NUMBER : ' WS-NB-INPUT-UPD-I     04560000
004570              PERFORM SQLERROR                                    04570000
004580     END-EVALUATE                                                 04580000
004590     .                                                            04590000
004600                                                                  04600000
004610* SQLERROR ROUTINE.                                               04610000
004620     EXEC SQL                                                     04620000
004630          INCLUDE SQLERROR                                        04630000
004640     END-EXEC.                                                    04640000
004650                                                                  04650000
