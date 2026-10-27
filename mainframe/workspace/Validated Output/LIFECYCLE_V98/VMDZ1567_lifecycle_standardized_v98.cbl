000010 CBL ARITH(EXTEND)                                                00010000
000020 IDENTIFICATION DIVISION.                                         00020000
000030*-----------------------.                                         00030000
000040 PROGRAM-ID. VMDZ1567.                                            00040000
000050 AUTHOR.       PYTHON-AUTOMATION-USING-AI.                        00050000
000060 DATE-WRITTEN. 2026-10-26.                                        00060000
000070 DATE-COMPILED.                                                   00070000
000080                                                                  00080000
000090****************************************************************  00090000
000100*REMARKS.       AANDUIDEN BOEKING IN DB FORMULIER              *  00100000
000110*               VOOR EFFECTENDOSSIERS.                         *  00110000
000120*                                                              *  00120000
000130*COMMITS        MICHELINE BEEVERS (DATAPROCESS BELGIUM).       *  00130000
000140*                                                              *  00140000
000150*  MODIFIED BY J.CLEMENT                                       *  00150000
000160*  07/92 : AANPASSING SLIK : RECORDS 475 ---> 575              *  00160000
000170*                            VMBD510C    ---> VMBD510V         *  00170000
000180*                                                              *  00180000
000190*  MODIFIED BY S. POMPONIO                                     *  00190000
000200*  01/97 : AANPASSING EURO2000 : RECORDS 750 ---> 1050         *  00200000
000210*                                VMBD510V    ---> VMBD510X     *  00210000
000220*                                DATEPARM EN 8 POSITIONS       *  00220000
000230*                                                              *  00230000
000240*  MODIFIED BY JEROEN "JEROD" DE SCHUTTER (DOLMEN) :           *  00240000
000250*  08/2003 : AANPASSINGEN IKV. INTEGRATIEPROJECT 6212 :        *  00250000
000260*            DAISY SECURITIES KASBONS : VMBD510X --> VMBD205I  *  00260000
000270*                                                              *  00270000
000280****************************************************************  00280000
000290                                                                  00290000
000300 ENVIRONMENT DIVISION.                                            00300000
000310*--------------------.                                            00310000
000320 CONFIGURATION SECTION.                                           00320000
000330 SPECIAL-NAMES.                                                   00330000
000340     DECIMAL-POINT IS COMMA.                                      00340000
000350 INPUT-OUTPUT SECTION.                                            00350000
000360 FILE-CONTROL.                                                    00360000
000370     SELECT OPERATIES ASSIGN TO UT-S-DD010.                       00370000
000380                                                                  00380000
000390 DATA DIVISION.                                                   00390000
000400*-------------.                                                   00400000
000410 FILE SECTION.                                                    00410000
000420 FD   OPERATIES                                                   00420000
000430      BLOCK CONTAINS 0 RECORDS                                    00430000
000440      RECORD CONTAINS 1200 CHARACTERS                             00440000
000450      RECORDING F                                                 00450000
000460      LABEL RECORDS STANDARD.                                     00460000
000470 01   OPERATIES-REC             PIC X(1200).                      00470000
000480                                                                  00480000
000490                                                                  00490000
000500 WORKING-STORAGE SECTION.                                         00500000
000510     EXEC SQL INCLUDE DZ01RSTV END-EXEC.                          00510000
000520                                                                  00520000
000530 01  WS-SWITCHES.                                                 00530000
000540     02  SW-VMDZ205I            PIC X     VALUE 'N'.              00540000
000550         88  VMDZ205I-NOT-EOF       VALUE 'N'.                    00550000
000560         88  VMDZ205I-EOF           VALUE 'Y'.                    00560000
000570                                                                  00570000
000580 01  HELP-VARIABLE.                                               00580000
000590     02  WS-RESTART-REC.                                          00590000
000600         03  NB-READ            PIC 9(15)   VALUE ZERO.           00600000
000610         03  KY-RESTART         PIC X(1200) VALUE SPACES.         00610000
000620     02  WS-INPUT-KASBONS       PIC X(1200) VALUE SPACES.         00620000
000630     02  WS-TELLER              PIC 9(9)   COMP-3 VALUE ZERO.     00630000
000640     02  WS-NB-INPUT-UPD-I      PIC 9(7)   COMP-3 VALUE ZERO.     00640000
000650     02  WS-NB-BFAR-UPD-I       PIC S9(11) COMP-3 VALUE +0.       00650000
000660                                                                  00660000
000670 01  WS-DATE-CONVERSION.                                          00670000
000680     03  DA-YYMMDD.                                               00680000
000690         05  YY                     PIC 99    VALUE ZERO.         00690000
000700         05  MM                     PIC 99    VALUE ZERO.         00700000
000710         05  DD                     PIC 99    VALUE ZERO.         00710000
000720     03  DA-DDMMCCYY.                                             00720000
000730         05  DD                     PIC 99    VALUE ZERO.         00730000
000740         05  MM                     PIC 99    VALUE ZERO.         00740000
000750         05  CC                     PIC 99    VALUE ZERO.         00750000
000760         05  YY                     PIC 99    VALUE ZERO.         00760000
000770     03  DA-CCYYMMDD.                                             00770000
000780         05  CC                     PIC 99    VALUE ZERO.         00780000
000790         05  YY                     PIC 99    VALUE ZERO.         00790000
000800         05  MM                     PIC 99    VALUE ZERO.         00800000
000810         05  DD                     PIC 99    VALUE ZERO.         00810000
000820     03  DA-CCYYMMDD-R REDEFINES DA-CCYYMMDD.                     00820000
000830         05  CCYY                   PIC 9999.                     00830000
000840         05  MM                     PIC 99.                       00840000
000850         05  DD                     PIC 99.                       00850000
000860     03  DA-DD-MM-CCYY.                                           00860000
000870         05  DD                     PIC 9(02).                    00870000
000880         05  TE-MARKER1             PIC X     VALUE '.'.          00880000
000890         05  MM                     PIC 9(02).                    00890000
000900         05  TE-MARKER2             PIC X     VALUE '.'.          00900000
000910         05  CCYY                   PIC 9(04).                    00910000
000920 77  USERABEN                   PIC X(8) VALUE 'USERABEN'.        00920000
000930                                                                  00930000
000940 01  STOP-DATONLY.                                                00940000
000950     02  DATE-YMD.                                                00950000
000960         03  D-YEAR             PIC 99.                           00960000
000970         03  D-MONTH            PIC 99.                           00970000
000980         03  D-DAY              PIC 99.                           00980000
000990     02  DATE-DMY.                                                00990000
001000         03  D-DAY              PIC 99.                           01000000
001010         03  D-MONTH            PIC 99.                           01010000
001020         03  D-YEAR             PIC 99.                           01020000
001030     02  DATE-YMD8.                                               01030000
001040         03  D-CENT             PIC 99.                           01040000
001050         03  D-YEAR             PIC 99.                           01050000
001060         03  D-MONTH            PIC 99.                           01060000
001070         03  D-DAY              PIC 99.                           01070000
001080     02  DATE-DMY8.                                               01080000
001090         03  D-DAY              PIC 99.                           01090000
001100         03  D-MONTH            PIC 99.                           01100000
001110         03  D-CENT             PIC 99.                           01110000
001120         03  D-YEAR             PIC 99.                           01120000
001130                                                                  01130000
001140     COPY VMDZ205I.                                               01140000
001150                                                                  01150000
001160                                                                  01160000
001170     EXEC SQL INCLUDE SQLERRWS END-EXEC.                          01170000
001180     EXEC SQL INCLUDE SQLCA END-EXEC.                             01180000
001190     EXEC SQL INCLUDE DZBFARTV END-EXEC.                          01190000
001200                                                                  01200000
001210                                                                  01210000
001220 01  WS-DB2-GENERATED.                                            01220000
001230     10  CS-PROGRAM               PIC X(8)    VALUE 'VMDZ1567'.   01230000
001240                                                                  01240000
001250 01  WS-TIMESTAMP-FIELDS.                                         01250000
001260     05 TS-SYSTEM.                                                01260000
001270        10  DA-SYS.                                               01270000
001280            15  DA-SYS-CCYY.                                      01280000
001290                20  CC            PIC X(2).                       01290000
001300                20  YY            PIC X(2).                       01300000
001310            15  MM                PIC X(2).                       01310000
001320            15  DD                PIC X(2).                       01320000
001330        10  HR-SYS.                                               01330000
001340            15  HH                PIC X(2).                       01340000
001350            15  MI                PIC X(2).                       01350000
001360            15  SS                PIC X(2).                       01360000
001370            15  TT                PIC X(2).                       01370000
001380     05 TS-TIMESTAMP.                                             01380000
001390        10  CC                    PIC X(2).                       01390000
001400        10  YY                    PIC X(2).                       01400000
001410        10  TE-MARKER1            PIC X             VALUE '-'.    01410000
001420        10  MM                    PIC X(2).                       01420000
001430        10  TE-MARKER2            PIC X             VALUE '-'.    01430000
001440        10  DD                    PIC X(2).                       01440000
001450        10  TE-MARKER3            PIC X             VALUE '-'.    01450000
001460        10  HH                    PIC X(2).                       01460000
001470        10  TE-MARKER4            PIC X             VALUE '.'.    01470000
001480        10  MI                    PIC X(2).                       01480000
001490        10  TE-MARKER5            PIC X             VALUE '.'.    01490000
001500        10  SS                    PIC X(2).                       01500000
001510        10  TE-MARKER6            PIC X             VALUE '.'.    01510000
001520        10  TT                    PIC X(2).                       01520000
001530        10  NNNN                  PIC 9(04)         VALUE 0.      01530000
001540                                                                  01540000
001550                                                                  01550000
001560 LINKAGE SECTION.                                                 01560000
001570 01  PARAM-DATONLY.                                               01570000
001580     03  L-PARAM                PIC S9(4) COMP.                   01580000
001590     03  DATUMLS.                                                 01590000
001600         05  DATE-IND           PIC X.                            01600000
001610         05  DATE8-LS           PIC X(8).                         01610000
001620                                                                  01620000
001630 PROCEDURE DIVISION USING PARAM-DATONLY.                          01630000
001640 0000-MAIN-PROCEDURE.                                             01640000
001650     PERFORM 1000-INITIALIZE-PROGRAM.                             01650000
001660     PERFORM 2000-PROCESS-PROGRAM.                                01660000
001670     PERFORM 3000-FINALIZE-PROGRAM.                               01670000
001680     STOP RUN.                                                    01680000
001690 1000-INITIALIZE-PROGRAM.                                         01690000
001700*--------------------------------------.                          01700000
001710*                                                                 01710000
001720* INITIALISATIE                                                   01720000
001730*                                                                 01730000
001740     PERFORM 600-GET-TIMESTAMP.                                   01740000
001750     MOVE DATE8-LS       TO DATE-DMY8.                            01750000
001760     MOVE CORR DATE-DMY8 TO DATE-YMD.                             01760000
001770     MOVE CORR DATE-DMY8 TO DATE-DMY.                             01770000
001780     MOVE CORR DATE-DMY8 TO DATE-YMD8.                            01780000
001790                                                                  01790000
001800     MOVE CS-PROGRAM   TO PROGRAM-NAME.                           01800000
001810     SET VMDZ205I-NOT-EOF TO TRUE.                                01810000
001820     INITIALIZE HELP-VARIABLE.                                    01820000
001830     MOVE ZEROES TO DA-CCYYMMDD.                                  01830000
001840     MOVE DATE-YMD8 TO DA-CCYYMMDD.                               01840000
001850     MOVE CORR DA-CCYYMMDD-R TO DA-DD-MM-CCYY.                    01850000
001860                                                                  01860000
001870     OPEN INPUT OPERATIES.                                        01870000
001880                                                                  01880000
001890     PERFORM 700-RESTART-CONTROL.                                 01890000
001900                                                                  01900000
001910     PERFORM READ-FLAT-FILE.                                      01910000
001920                                                                  01920000
001930 2000-PROCESS-PROGRAM.                                            01930000
001940     PERFORM VERWERKING UNTIL VMDZ205I-EOF.                       01940000
001950 3000-FINALIZE-PROGRAM.                                           01950000
001960                                                                  01960000
001970     PERFORM 800-PROCESS-COMMIT.                                  01970000
001980                                                                  01980000
001990     DISPLAY 'NUMBER OF RECORDS PROCESSED : ' WS-NB-INPUT-UPD-I.  01990000
002000     DISPLAY 'NUMBER OF UPDATE BFAR       : ' WS-NB-BFAR-UPD-I.   02000000
002010     CLOSE OPERATIES.                                             02010000
002020 VERWERKING.                                                      02020000
002030*-----------                                                      02030000
002040     INITIALIZE DCLDZBFARTV.                                      02040000
002050     MOVE '1815' TO CT-TGDSERV-479BFAR OF DCLDZBFARTV             02050000
002060     MOVE NR-CIO-FORM-AS-R TO NR-CIOFMAS-479BFAR OF DCLDZBFARTV   02060000
002070     MOVE ZEROES TO DA-CCYYMMDD                                   02070000
002080     MOVE DA-CREA-FORM-AS-R TO DA-CCYYMMDD                        02080000
002090     IF DA-CCYYMMDD = ZERO OR DA-CCYYMMDD = SPACES                02090000
002100        MOVE 00010101 TO DA-CCYYMMDD                              02100000
002110     END-IF                                                       02110000
002120     MOVE CORR DA-CCYYMMDD-R TO DA-DD-MM-CCYY                     02120000
002130     MOVE DA-DD-MM-CCYY TO DA-CRFMAS-479BFAR OF DCLDZBFARTV       02130000
002140     MOVE NR-ID-FORM-AS OF VMDZ205I TO NR-IDFMAS-479BFAR          02140000
002150       OF DCLDZBFARTV                                             02150000
002160     MOVE CT-OPG-FORM-AS-R TO CT-OPGFMAS-479BFAR OF DCLDZBFARTV   02160000
002170     MOVE CT-OPD-FORM-AS-R TO CT-OPDFMAS-479BFAR OF DCLDZBFARTV   02170000
002180     MOVE ZEROES TO DA-CCYYMMDD                                   02180000
002190     MOVE DATE-YMD8 TO DA-CCYYMMDD                                02190000
002200     MOVE CORR DA-CCYYMMDD-R TO DA-DD-MM-CCYY                     02200000
002210     MOVE DA-DD-MM-CCYY TO DA-INFSDGD-479BFAR OF DCLDZBFARTV      02210000
002220     MOVE SQL-STATEMENT TO SQL-LOCATION                           02220000
002230     PERFORM 1100-UPDATE-DZBFAR.                                  02230000
002240                                                                  02240000
002250*    LEZEN VAN DE INVOER                                          02250000
002260                                                                  02260000
002270                                                                  02270000
002280     IF WS-TELLER > 99                                            02280000
002290        PERFORM 800-PROCESS-COMMIT                                02290000
002300     END-IF.                                                      02300000
002310                                                                  02310000
002320     PERFORM READ-FLAT-FILE.                                      02320000
002330 READ-FLAT-FILE.                                                  02330000
002340     INITIALIZE VMDZ205I.                                         02340000
002350                                                                  02350000
002360     READ OPERATIES INTO VMDZ205I                                 02360000
002370        AT END SET VMDZ205I-EOF TO TRUE.                          02370000
002380                                                                  02380000
002390        IF VMDZ205I-NOT-EOF                                       02390000
002400           THEN                                                   02400000
002410           ADD +1 TO WS-TELLER                                    02410000
002420           ADD +1 TO WS-NB-INPUT-UPD-I                            02420000
002430           MOVE VMDZ205I TO WS-INPUT-KASBONS                      02430000
002440        END-IF.                                                   02440000
002450                                                                  02450000
002460 600-GET-TIMESTAMP.                                               02460000
002470D    DISPLAY '600-GET-TIMESTAMP.'                                 02470000
002480     MOVE FUNCTION CURRENT-DATE TO TS-SYSTEM.                     02480000
002490     MOVE CC OF TS-SYSTEM       TO CC OF TS-TIMESTAMP             02490000
002500     MOVE YY OF TS-SYSTEM       TO YY OF TS-TIMESTAMP             02500000
002510     MOVE MM OF TS-SYSTEM       TO MM OF TS-TIMESTAMP             02510000
002520     MOVE DD OF TS-SYSTEM       TO DD OF TS-TIMESTAMP             02520000
002530     MOVE HH OF TS-SYSTEM       TO HH OF TS-TIMESTAMP             02530000
002540     MOVE MI OF TS-SYSTEM       TO MI OF TS-TIMESTAMP             02540000
002550     MOVE SS OF TS-SYSTEM       TO SS OF TS-TIMESTAMP             02550000
002560     MOVE TT OF TS-SYSTEM       TO TT OF TS-TIMESTAMP             02560000
002570     DISPLAY 'TIMESTAMP: ' TS-TIMESTAMP                           02570000
002580     .                                                            02580000
002590                                                                  02590000
002600                                                                  02600000
002610 1100-UPDATE-DZBFAR.                                              02610000
002620                                                                  02620000
002630     MOVE TS-TIMESTAMP TO TS-UPDATE-479BFAR OF DCLDZBFARTV        02630000
002640     MOVE CS-PROGRAM TO ID-USERID-479BFAR OF DCLDZBFARTV          02640000
002650             MOVE 1100 TO SQL-LOCATION                            02650000
002660     EXEC SQL                                                     02660000
002670        UPDATE DZBFARTV                                           02670000
002680        SET                                                       02680000
002690        DA_INFSDGD_479BFAR = :DCLDZBFARTV.DA-INFSDGD-479BFAR,     02690000
002700        TS_UPDATE_479BFAR = :DCLDZBFARTV.TS-UPDATE-479BFAR,       02700000
002710        ID_USERID_479BFAR = :DCLDZBFARTV.ID-USERID-479BFAR        02710000
002720        WHERE                                                     02720000
002730        CT_TGDSERV_479BFAR = :DCLDZBFARTV.CT-TGDSERV-479BFAR      02730000
002740        AND NR_CIOFMAS_479BFAR = :DCLDZBFARTV.NR-CIOFMAS-479BFAR  02740000
002750        AND DA_CRFMAS_479BFAR = :DCLDZBFARTV.DA-CRFMAS-479BFAR    02750000
002760        AND NR_IDFMAS_479BFAR = :DCLDZBFARTV.NR-IDFMAS-479BFAR    02760000
002770        AND CT_OPDFMAS_479BFAR = :DCLDZBFARTV.CT-OPDFMAS-479BFAR  02770000
002780        AND CT_OPGFMAS_479BFAR = :DCLDZBFARTV.CT-OPGFMAS-479BFAR  02780000
002790        QUERYNO 442                                               02790000
002800     END-EXEC                                                     02800000
002810     EVALUATE SQLCODE                                             02810000
002820       WHEN 0                                                     02820000
002830            ADD 1 TO WS-NB-BFAR-UPD-I                             02830000
002840       WHEN OTHER                                                 02840000
002850            DISPLAY 'ERROR ON UPDATE DZBFARTV'                    02850000
002860            PERFORM SQLERROR                                      02860000
002870     END-EVALUATE                                                 02870000
002880     .                                                            02880000
002890                                                                  02890000
002900*SQLERROR ROUTINE.                                                02900000
002910     EXEC SQL                                                     02910000
002920        INCLUDE SQLERROR                                          02920000
002930     END-EXEC.                                                    02930000
002940                                                                  02940000
002950 700-RESTART-CONTROL.                                             02950000
002960     MOVE CS-PROGRAM TO NM-ID-RS-PROGRAM OF DCLDZ01RSTV.          02960000
002970     MOVE DA-DD-MM-CCYY   TO DA-CR-RS       OF DCLDZ01RSTV.       02970000
002980     MOVE 1     TO NB-ID-RS-PHASE      OF DCLDZ01RSTV.            02980000
002990                                                                  02990000
003000     PERFORM 700-SELECT-DZ01RSTV.                                 03000000
003010                                                                  03010000
003020     EVALUATE SQLCODE                                             03020000
003030       WHEN 0        PERFORM 710-JOB-IS-RESTART                   03030000
003040       WHEN 100 PERFORM 720-WRITE-RESTART-REC                     03040000
003050       WHEN OTHER               PERFORM SQLERROR                  03050000
003060     END-EVALUATE.                                                03060000
003070                                                                  03070000
003080     MOVE 0 TO WS-TELLER.                                         03080000
003090                                                                  03090000
003100 700-SELECT-DZ01RSTV.                                             03100000
003110                                                                  03110000
003120     MOVE 700 TO SQL-LOCATION                                     03120000
003130     EXEC SQL                                                     03130000
003140      SELECT NM_ID_RS_PROGRAM                                     03140000
003150           , NB_ID_RS_PHASE                                       03150000
003160           , DA_CR_RS                                             03160000
003170           , CO_ID_RS                                             03170000
003180           , NB_DAY_RS                                            03180000
003190           , TE_CH_RS_DATA                                        03190000
003200        INTO :DCLDZ01RSTV.NM-ID-RS-PROGRAM                        03200000
003210           , :DCLDZ01RSTV.NB-ID-RS-PHASE                          03210000
003220           , :DCLDZ01RSTV.DA-CR-RS                                03220000
003230           , :DCLDZ01RSTV.CO-ID-RS                                03230000
003240           , :DCLDZ01RSTV.NB-DAY-RS                               03240000
003250           , :DCLDZ01RSTV.TE-CH-RS-DATA                           03250000
003260        FROM DZ01RSTV                                             03260000
003270       WHERE NM_ID_RS_PROGRAM = :DCLDZ01RSTV.NM-ID-RS-PROGRAM     03270000
003280         AND NB_ID_RS_PHASE = :DCLDZ01RSTV.NB-ID-RS-PHASE         03280000
003290         AND DA_CR_RS = :DCLDZ01RSTV.DA-CR-RS                     03290000
003300      QUERYNO 376                                                 03300000
003310     END-EXEC                                                     03310000
003320                                                                  03320000
003330     EVALUATE SQLCODE                                             03330000
003340       WHEN 0                                                     03340000
003350       WHEN 100                                                   03350000
003360            CONTINUE                                              03360000
003370       WHEN OTHER                                                 03370000
003380            DISPLAY 'ERROR ON SELECT DZ01RSTV'                    03380000
003390            PERFORM SQLERROR                                      03390000
003400     END-EVALUATE                                                 03400000
003410     .                                                            03410000
003420                                                                  03420000
003430 700-UPDATE-DZ01RSTV.                                             03430000
003440                                                                  03440000
003450     MOVE 700 TO SQL-LOCATION                                     03450000
003460     EXEC SQL                                                     03460000
003470      UPDATE DZ01RSTV                                             03470000
003480         SET TE_CH_RS_DATA = :DCLDZ01RSTV.TE-CH-RS-DATA           03480000
003490           , CO_ID_RS = :DCLDZ01RSTV.CO-ID-RS                     03490000
003500       WHERE NM_ID_RS_PROGRAM = :DCLDZ01RSTV.NM-ID-RS-PROGRAM     03500000
003510         AND NB_ID_RS_PHASE = :DCLDZ01RSTV.NB-ID-RS-PHASE         03510000
003520         AND DA_CR_RS = :DCLDZ01RSTV.DA-CR-RS                     03520000
003530      QUERYNO 398                                                 03530000
003540     END-EXEC                                                     03540000
003550                                                                  03550000
003560     EVALUATE SQLCODE                                             03560000
003570       WHEN 0                                                     03570000
003580            CONTINUE                                              03580000
003590       WHEN OTHER                                                 03590000
003600            DISPLAY 'ERROR ON UPDATE DZ01RSTV'                    03600000
003610            PERFORM SQLERROR                                      03610000
003620     END-EVALUATE                                                 03620000
003630     .                                                            03630000
003640                                                                  03640000
003650 700-INSERT-DZ01RSTV.                                             03650000
003660                                                                  03660000
003670     MOVE 700 TO SQL-LOCATION                                     03670000
003680     EXEC SQL                                                     03680000
003690      INSERT INTO DZ01RSTV                                        03690000
003700             VALUES (:DCLDZ01RSTV)                                03700000
003710     END-EXEC                                                     03710000
003720                                                                  03720000
003730     EVALUATE SQLCODE                                             03730000
003740       WHEN 0                                                     03740000
003750            CONTINUE                                              03750000
003760       WHEN OTHER                                                 03760000
003770            DISPLAY 'ERROR ON INSERT DZ01RSTV'                    03770000
003780            PERFORM SQLERROR                                      03780000
003790     END-EVALUATE                                                 03790000
003800     .                                                            03800000
003810                                                                  03810000
003820 710-JOB-IS-RESTART.                                              03820000
003830     MOVE TE-CH-RS-DATA-TEXT OF DCLDZ01RSTV                       03830000
003840       TO WS-RESTART-REC.                                         03840000
003850                                                                  03850000
003860     IF CO-ID-RS OF DCLDZ01RSTV = '1'                             03860000
003870        THEN DISPLAY ' PREVIOUS RUN COMPLETE '                    03870000
003880        PERFORM 810000-CALL-USERABEN                              03880000
003890     ELSE PERFORM NB-READ OF WS-RESTART-REC TIMES                 03890000
003900        PERFORM READ-FLAT-FILE                                    03900000
003910        MOVE NB-READ OF WS-RESTART-REC                            03910000
003920            TO WS-NB-INPUT-UPD-I                                  03920000
003930     END-PERFORM                                                  03930000
003940     END-IF.                                                      03940000
003950                                                                  03950000
003960 720-WRITE-RESTART-REC.                                           03960000
003970     MOVE '0' TO CO-ID-RS    OF DCLDZ01RSTV.                      03970000
003980     MOVE 7      TO NB-DAY-RS OF DCLDZ01RSTV.                     03980000
003990     MOVE 0                     TO WS-NB-INPUT-UPD-I.             03990000
004000     MOVE WS-NB-INPUT-UPD-I       TO NB-READ OF WS-RESTART-REC.   04000000
004010     INITIALIZE KY-RESTART.                                       04010000
004020     MOVE 1215                                                    04020000
004030       TO TE-CH-RS-DATA-LEN OF DCLDZ01RSTV.                       04030000
004040     MOVE WS-RESTART-REC                                          04040000
004050       TO TE-CH-RS-DATA-TEXT   OF DCLDZ01RSTV.                    04050000
004060                                                                  04060000
004070     PERFORM 700-INSERT-DZ01RSTV.                                 04070000
004080                                                                  04080000
004090 800-PROCESS-COMMIT.                                              04090000
004100     MOVE 0               TO WS-TELLER.                           04100000
004110     MOVE WS-NB-INPUT-UPD-I TO NB-READ  OF WS-RESTART-REC.        04110000
004120     MOVE WS-INPUT-KASBONS                                        04120000
004130       TO KY-RESTART OF WS-RESTART-REC.                           04130000
004140                                                                  04140000
004150     IF VMDZ205I-EOF                                              04150000
004160        THEN MOVE '1'   TO CO-ID-RS OF DCLDZ01RSTV                04160000
004170     ELSE MOVE '0' TO CO-ID-RS OF DCLDZ01RSTV                     04170000
004180     END-IF.                                                      04180000
004190                                                                  04190000
004200     MOVE 15                                                      04200000
004210       TO TE-CH-RS-DATA-LEN OF DCLDZ01RSTV.                       04210000
004220     MOVE WS-RESTART-REC                                          04220000
004230       TO TE-CH-RS-DATA-TEXT   OF DCLDZ01RSTV.                    04230000
004240                                                                  04240000
004250     PERFORM 700-UPDATE-DZ01RSTV.                                 04250000
004260                                                                  04260000
004270     MOVE 800 TO SQL-LOCATION                                     04270000
004280     EXEC SQL                                                     04280000
004290      COMMIT                                                      04290000
004300     END-EXEC.                                                    04300000
004310                                                                  04310000
004320     EVALUATE SQLCODE                                             04320000
004330       WHEN 0                                                     04330000
004340            CONTINUE                                              04340000
004350       WHEN OTHER                                                 04350000
004360            DISPLAY 'ERROR REC NUMBER : ' WS-NB-INPUT-UPD-I       04360000
004370            PERFORM SQLERROR                                      04370000
004380     END-EVALUATE.                                                04380000
004390                                                                  04390000
004400 810000-CALL-USERABEN.                                            04400000
004410     CALL USERABEN.                                               04410000
