000010 CBL ARITH(EXTEND)                                                00010000
000020 IDENTIFICATION DIVISION.                                         00020000
000030*------------------------                                         00030000
000040 PROGRAM-ID. VMDZ1526.                                            00040000
000050 AUTHOR.       PYTHON-AUTOMATION-USING-AI.                        00050000
000060 DATE-WRITTEN. 2026-10-26.                                        00060000
000070 DATE-COMPILED.                                                   00070000
000080                                                                  00080000
000090*************************************************************     00090000
000100*                                                           *     00100000
000110*  VERSIE IKB2BIS MET NIEUWE TYPES                          *     00110000
000120*  NEERLEGING - VERNIETIGINGEN EFFECT                       *     00120000
000130*                                                           *     00130000
000140* MODIFIED BY J. CLEMENT : INPUT 400 ---> 600               *     00140000
000150*                          VMBD205A  ---> VMBD205S          *     00150000
000160*                                                           *     00160000
000170* MODIFIED BY P. VERBEEK : AANPASSINGEN JAAR 2000           *     00170000
000180*                                                           *     00180000
000190* MODIFIED BY S. POMPONIO: AANPASSINGEN EURO2000            *     00190000
000200*                          INPUT 600 ---> 800               *     00200000
000210*                          VMBD205S  ---> VMBD205X          *     00210000
000220* MODIFIED BY JEROEN "JEROD" DE SCHUTTER (DOLMEN) - 09/2003 *     00220000
000230*  . AANPASSINGEN IKV. INTEGRATIEPROJECT 6212 :             *     00230000
000240*    DAISY SECURITIES KASBONS                               *     00240000
000250*                                                           *     00250000
000260*************************************************************     00260000
000270                                                                  00270000
000280 ENVIRONMENT DIVISION.                                            00280000
000290*---------------------                                            00290000
000300 CONFIGURATION SECTION.                                           00300000
000310 SOURCE-COMPUTER. IBM-370.                                        00310000
000320 OBJECT-COMPUTER. IBM-370.                                        00320000
000330                                                                  00330000
000340 INPUT-OUTPUT SECTION.                                            00340000
000350 FILE-CONTROL.                                                    00350000
000360     SELECT INFIL ASSIGN TO UT-S-DD020.                           00360000
000370                                                                  00370000
000380                                                                  00380000
000390 DATA DIVISION.                                                   00390000
000400*--------------                                                   00400000
000410 FILE SECTION.                                                    00410000
000420 FD  INFIL                                                        00420000
000430     BLOCK CONTAINS 0 RECORDS                                     00430000
000440     LABEL RECORD IS STANDARD                                     00440000
000450     RECORDING MODE F                                             00450000
000460     DATA RECORD IS VMDZ205I.                                     00460000
000470                                                                  00470000
000480     COPY VMDZ205I.                                               00480000
000490                                                                  00490000
000500                                                                  00500000
000510 WORKING-STORAGE SECTION.                                         00510000
000520     EXEC SQL INCLUDE DZ01RSTV END-EXEC.                          00520000
000530                                                                  00530000
000540 01  WS-SWITCHES.                                                 00540000
000550     02  SW-VMDZ205I            PIC X     VALUE 'N'.              00550000
000560         88  VMDZ205I-NOT-EOF       VALUE 'N'.                    00560000
000570         88  VMDZ205I-EOF           VALUE 'Y'.                    00570000
000580                                                                  00580000
000590 01  HELP-VARIABLE.                                               00590000
000600     02  WS-RESTART-REC.                                          00600000
000610         03  NB-READ            PIC 9(15)   VALUE ZERO.           00610000
000620         03  KY-RESTART         PIC X(1200) VALUE SPACES.         00620000
000630     02  WS-INPUT-KASBONS       PIC X(1200) VALUE SPACES.         00630000
000640     02  WS-TELLER              PIC 9(9)   COMP-3 VALUE ZERO.     00640000
000650     02  WS-NB-INPUT-UPD-I      PIC 9(7)   COMP-3 VALUE ZERO.     00650000
000660     02  WS-NB-BFAR-UPD-I       PIC S9(11) COMP-3 VALUE +0.       00660000
000670                                                                  00670000
000680 01  WS-DATE-CONVERSION.                                          00680000
000690     03  DA-YYMMDD.                                               00690000
000700         05  YY                     PIC 99    VALUE ZERO.         00700000
000710         05  MM                     PIC 99    VALUE ZERO.         00710000
000720         05  DD                     PIC 99    VALUE ZERO.         00720000
000730     03  DA-DDMMCCYY.                                             00730000
000740         05  DD                     PIC 99    VALUE ZERO.         00740000
000750         05  MM                     PIC 99    VALUE ZERO.         00750000
000760         05  CC                     PIC 99    VALUE ZERO.         00760000
000770         05  YY                     PIC 99    VALUE ZERO.         00770000
000780     03  DA-CCYYMMDD.                                             00780000
000790         05  CC                     PIC 99    VALUE ZERO.         00790000
000800         05  YY                     PIC 99    VALUE ZERO.         00800000
000810         05  MM                     PIC 99    VALUE ZERO.         00810000
000820         05  DD                     PIC 99    VALUE ZERO.         00820000
000830     03  DA-CCYYMMDD-R REDEFINES DA-CCYYMMDD.                     00830000
000840         05  CCYY                   PIC 9999.                     00840000
000850         05  MM                     PIC 99.                       00850000
000860         05  DD                     PIC 99.                       00860000
000870     03  DA-DD-MM-CCYY.                                           00870000
000880         05  DD                     PIC 9(02).                    00880000
000890         05  TE-MARKER1             PIC X     VALUE '.'.          00890000
000900         05  MM                     PIC 9(02).                    00900000
000910         05  TE-MARKER2             PIC X     VALUE '.'.          00910000
000920         05  CCYY                   PIC 9(04).                    00920000
000930                                                                  00930000
000940 01  WS-HULPVELDEN.                                               00940000
000950     05  SW-EOF              VALUE +0          PIC S9    COMP.    00950000
000960         88 EOF              VALUE +1.                            00960000
000970     05  SW-FFRECAB          VALUE +0          PIC S9    COMP.    00970000
000980         88 FFRECAB-AANW     VALUE +0.                            00980000
000990     05  TELLER                                PIC S9(5) COMP-3.  00990000
001000     05  USERABEN            VALUE 'USERABEN'  PIC X(8).          01000000
001010                                                                  01010000
001020 01  HULP-NR-ID-GOOD.                                             01020000
001030     03  HULP-NR-CIO     PIC 9(8)    COMP-3.                      01030000
001040     03  HULP-DA-CREA    PIC 9(8)    COMP-3.                      01040000
001050     03  HULP-NR-ID      PIC 9(6)    COMP-3.                      01050000
001060     03  HULP-CT-OPD     PIC 999     COMP-3.                      01060000
001070     03  HULP-CT-OPG     PIC 999     COMP-3.                      01070000
001080     03  FILLER          PIC XX      VALUE SPACES.                01080000
001090 01  STOP-DATONLY.                                                01090000
001100     02  DATE-YMD.                                                01100000
001110         03  D-YEAR      PIC 99.                                  01110000
001120         03  D-MONTH     PIC 99.                                  01120000
001130         03  D-DAY       PIC 99.                                  01130000
001140     02  DATE-DMY.                                                01140000
001150         03  D-DAY       PIC 99.                                  01150000
001160         03  D-MONTH     PIC 99.                                  01160000
001170         03  D-YEAR      PIC 99.                                  01170000
001180     02  DATE-YMD8.                                               01180000
001190         03  D-CENT      PIC 99.                                  01190000
001200         03  D-YEAR      PIC 99.                                  01200000
001210         03  D-MONTH     PIC 99.                                  01210000
001220         03  D-DAY       PIC 99.                                  01220000
001230     02  DATE-DMY8.                                               01230000
001240         03  D-DAY       PIC 99.                                  01240000
001250         03  D-MONTH     PIC 99.                                  01250000
001260         03  D-CENT      PIC 99.                                  01260000
001270         03  D-YEAR      PIC 99.                                  01270000
001280                                                                  01280000
001290                                                                  01290000
001300     EXEC SQL INCLUDE SQLERRWS END-EXEC.                          01300000
001310     EXEC SQL INCLUDE SQLCA END-EXEC.                             01310000
001320     EXEC SQL INCLUDE DZEVEFTV END-EXEC.                          01320000
001330     EXEC SQL INCLUDE DZBEFFTV END-EXEC.                          01330000
001340                                                                  01340000
001350                                                                  01350000
001360 01  WS-DB2-GENERATED.                                            01360000
001370     10  CS-PROGRAM               PIC X(8)    VALUE 'VMDZ1526'.   01370000
001380                                                                  01380000
001390 01  WS-TIMESTAMP-FIELDS.                                         01390000
001400     05 TS-SYSTEM.                                                01400000
001410        10  DA-SYS.                                               01410000
001420            15  DA-SYS-CCYY.                                      01420000
001430                20  CC            PIC X(2).                       01430000
001440                20  YY            PIC X(2).                       01440000
001450            15  MM                PIC X(2).                       01450000
001460            15  DD                PIC X(2).                       01460000
001470        10  HR-SYS.                                               01470000
001480            15  HH                PIC X(2).                       01480000
001490            15  MI                PIC X(2).                       01490000
001500            15  SS                PIC X(2).                       01500000
001510            15  TT                PIC X(2).                       01510000
001520     05 TS-TIMESTAMP.                                             01520000
001530        10  CC                    PIC X(2).                       01530000
001540        10  YY                    PIC X(2).                       01540000
001550        10  TE-MARKER1            PIC X             VALUE '-'.    01550000
001560        10  MM                    PIC X(2).                       01560000
001570        10  TE-MARKER2            PIC X             VALUE '-'.    01570000
001580        10  DD                    PIC X(2).                       01580000
001590        10  TE-MARKER3            PIC X             VALUE '-'.    01590000
001600        10  HH                    PIC X(2).                       01600000
001610        10  TE-MARKER4            PIC X             VALUE '.'.    01610000
001620        10  MI                    PIC X(2).                       01620000
001630        10  TE-MARKER5            PIC X             VALUE '.'.    01630000
001640        10  SS                    PIC X(2).                       01640000
001650        10  TE-MARKER6            PIC X             VALUE '.'.    01650000
001660        10  TT                    PIC X(2).                       01660000
001670        10  NNNN                  PIC 9(04)         VALUE 0.      01670000
001680                                                                  01680000
001690                                                                  01690000
001700 LINKAGE SECTION.                                                 01700000
001710 01  PARAM-DATONLY.                                               01710000
001720     03 L-PARAM          PIC S9(4)  COMP.                         01720000
001730     03 DATUMLS.                                                  01730000
001740        05 DAT-IND       PIC X.                                   01740000
001750        05 DATE8-LS      PIC X(8).                                01750000
001760                                                                  01760000
001770 01 WS-LRF-SPLIT-1.                                               01770000
001780    05 WS-LRF-SPLIT-1-RAW PIC X(13).                              01780000
001790    05 WS-LRF-SPLIT-1-R REDEFINES WS-LRF-SPLIT-1-RAW.             01790000
001800       10 WS-LRF-SPLIT-1-C1 PIC X(12).                            01800000
001810       10 WS-LRF-SPLIT-1-C2 PIC 9(1).                             01810000
001820 01 WS-LRF-SPLIT-2.                                               01820000
001830    05 WS-LRF-SPLIT-2-RAW PIC X(6).                               01830000
001840    05 WS-LRF-SPLIT-2-R REDEFINES WS-LRF-SPLIT-2-RAW.             01840000
001850       10 WS-LRF-SPLIT-2-C1 PIC X(1).                             01850000
001860       10 WS-LRF-SPLIT-2-C2 PIC X(5).                             01860000
001870                                                                  01870000
001880 PROCEDURE DIVISION USING PARAM-DATONLY.                          01880000
001890 0000-MAIN-PROCEDURE.                                             01890000
001900     DISPLAY '0000-MAIN-PROCEDURE.'.                              01900000
001910     PERFORM 1000-INITIALIZE-PROGRAM.                             01910000
001920     PERFORM 2000-PROCESS-PROGRAM.                                01920000
001930     PERFORM 3000-FINALIZE-PROGRAM.                               01930000
001940     STOP RUN.                                                    01940000
001950 1000-INITIALIZE-PROGRAM.                                         01950000
001960     DISPLAY '1000-INITIALIZE-PROGRAM.'.                          01960000
001970*---------------------------------------                          01970000
001980                                                                  01980000
001990     PERFORM 1100-GET-TIMESTAMP.                                  01990000
002000                                                                  02000000
002010     PERFORM 100-INITIALISATIE.                                   02010000
002020     PERFORM 700-RESTART-CONTROL.                                 02020000
002030                                                                  02030000
002040 2000-PROCESS-PROGRAM.                                            02040000
002050     DISPLAY '2000-PROCESS-PROGRAM.'.                             02050000
002060     PERFORM 200-VERWERK-INFIL UNTIL VMDZ205I-EOF.                02060000
002070 3000-FINALIZE-PROGRAM.                                           02070000
002080     DISPLAY '3000-FINALIZE-PROGRAM.'.                            02080000
002090                                                                  02090000
002100     PERFORM 800-PROCESS-COMMIT.                                  02100000
002110                                                                  02110000
002120     DISPLAY 'NUMBER OF RECORDS PROCESSED : ' WS-NB-INPUT-UPD-I.  02120000
002130     DISPLAY 'NUMBER OF UPDATE BFAR       : ' WS-NB-BFAR-UPD-I.   02130000
002140     CLOSE INFIL.                                                 02140000
002150                                                                  02150000
002160 100-INITIALISATIE.                                               02160000
002170     DISPLAY '100-INITIALISATIE.'.                                02170000
002180     MOVE DATE8-LS       TO DATE-DMY8.                            02180000
002190     MOVE CORR DATE-DMY8 TO DATE-DMY.                             02190000
002200     MOVE CORR DATE-DMY8 TO DATE-YMD.                             02200000
002210     MOVE CORR DATE-DMY8 TO DATE-YMD8.                            02210000
002220                                                                  02220000
002230     OPEN INPUT INFIL.                                            02230000
002240     MOVE +0 TO TELLER.                                           02240000
002250     PERFORM 900-LEES-INFIL.                                      02250000
002260                                                                  02260000
002270 110-POSITIONEREN-INFIL.                                          02270000
002280     DISPLAY '110-POSITIONEREN-INFIL.'.                           02280000
002290     ADD +1 TO TELLER.                                            02290000
002300     PERFORM 900-LEES-INFIL.                                      02300000
002310     IF VMDZ205I-EOF                                              02310000
002320        PERFORM STOP01.                                           02320000
002330                                                                  02330000
002340 200-VERWERK-INFIL.                                               02340000
002350     DISPLAY '200-VERWERK-INFIL.'.                                02350000
002360     ADD +1 TO TELLER.                                            02360000
002370     IF CO-STCIRC-OORD = '1'                                      02370000
002380        THEN PERFORM 210-STORE-EFF                                02380000
002390     ELSE PERFORM 220-MOD-EVEF                                    02390000
002400     END-IF.                                                      02400000
002410     IF TELLER NOT < +100                                         02410000
002420        PERFORM 800-TEST-FFRECAB                                  02420000
002430        MOVE +0 TO TELLER.                                        02430000
002440                                                                  02440000
002450                                                                  02450000
002460        IF WS-TELLER > 99                                         02460000
002470           PERFORM 800-PROCESS-COMMIT                             02470000
002480        END-IF.                                                   02480000
002490                                                                  02490000
002500        PERFORM 900-LEES-INFIL.                                   02500000
002510                                                                  02510000
002520 210-STORE-EFF.                                                   02520000
002530     DISPLAY '210-STORE-EFF.'.                                    02530000
002540     INITIALIZE DCLDZBEFFTV DCLDZEVEFTV.                          02540000
002550     MOVE '1002' TO CT-RKTPROD-479BEFF OF DCLDZBEFFTV             02550000
002560     MOVE NR-ST-FORM-AS OF VMDZ205I TO WS-LRF-SPLIT-1-RAW.        02560000
002570     MOVE WS-LRF-SPLIT-1-C1 TO NR-IDSTOCK-479BEFF OF DCLDZBEFFTV. 02570000
002580     MOVE WS-LRF-SPLIT-1-C2 TO NR-CDSTK-479BEFF OF DCLDZBEFFTV.   02580000
002590     MOVE NS-DB-STOCK-FORM-AS-R TO NS-DBSTK-479BEFF               02590000
002600       OF DCLDZBEFFTV.                                            02600000
002610     MOVE NR-ID-040SECU TO CO-IDPRKSK-479BEFF OF DCLDZBEFFTV.     02610000
002620     MOVE NS-SEQ-040IRMO TO NS-IRMOSTK-479BEFF OF DCLDZBEFFTV.    02620000
002630     MOVE ZEROES TO DA-CCYYMMDD                                   02630000
002640     MOVE DA-UB-FORM-AS OF VMDZ205I TO DA-CCYYMMDD                02640000
002650     IF DA-CCYYMMDD = ZERO OR DA-CCYYMMDD = SPACES                02650000
002660        MOVE 00010101 TO DA-CCYYMMDD                              02660000
002670     END-IF                                                       02670000
002680     MOVE CORR DA-CCYYMMDD-R TO DA-DD-MM-CCYY                     02680000
002690     MOVE DA-DD-MM-CCYY TO DA-UBSECIS-479BEFF OF DCLDZBEFFTV      02690000
002700     MOVE 0 TO NR-IDISSUE-479BEFF OF DCLDZBEFFTV.                 02700000
002710     MOVE 0 TO NR-CDISSUE-479BEFF OF DCLDZBEFFTV.                 02710000
002720     MOVE ZEROES TO DA-CCYYMMDD                                   02720000
002730     MOVE DATE-YMD8 TO DA-CCYYMMDD                                02730000
002740     MOVE CORR DA-CCYYMMDD-R TO DA-DD-MM-CCYY                     02740000
002750     MOVE DA-DD-MM-CCYY TO DA-CREVTPD-479EVEF OF DCLDZEVEFTV      02750000
002760     MOVE '0168' TO CT-RKTEVPR-479EVEF OF DCLDZEVEFTV.            02760000
002770     MOVE '0219' TO CT-RKTGDSV-479EVEF OF DCLDZEVEFTV.            02770000
002780     MOVE NR-CIO-FORM-AS-R TO HULP-NR-CIO.                        02780000
002790     MOVE DA-CREA-FORM-AS-R TO HULP-DA-CREA.                      02790000
002800     MOVE NR-ID-FORM-AS OF VMDZ205I TO HULP-NR-ID.                02800000
002810     MOVE CT-OPD-FORM-AS-R TO HULP-CT-OPD.                        02810000
002820     MOVE CT-OPG-FORM-AS-R TO HULP-CT-OPG.                        02820000
002830     MOVE HULP-NR-ID-GOOD TO NR-IDGOOD-479EVEF OF DCLDZEVEFTV.    02830000
002840     MOVE NR-CIO-FORM-AS OF VMDZ205I TO DB-NR-CI.                 02840000
002850                                                                  02850000
002860*                                                                 02860000
002870* STOCKEREN VAN DE RECORDS :                                      02870000
002880*    - VMBWCEF                                                    02880000
002890     MOVE NR-CIO-FORM-AS OF VMDZ205I TO WS-LRF-SPLIT-2-RAW.       02890000
002900     MOVE WS-LRF-SPLIT-2-C1 TO NR-CI1POS-479EVEF OF DCLDZEVEFTV.  02900000
002910     MOVE WS-LRF-SPLIT-2-C2 TO NR-CI26POS-479EVEF OF DCLDZEVEFTV. 02910000
002920     MOVE 'SELECT-VMBEFF' TO SQL-LOCATION.                        02920000
002930     EXEC SQL                                                     02930000
002940    SELECT                                                        02940000
002950       CT_RKTPROD_479BEFF,                                        02950000
002960       NR_IDSTOCK_479BEFF,                                        02960000
002970       NR_CDSTK_479BEFF,                                          02970000
002980       NS_DBSTK_479BEFF,                                          02980000
002990       AM_CNDSTK_479BEFF,                                         02990000
003000       AM_CNSTK_479BEFF,                                          03000000
003010       CT_RKTPRDX_479BEFF,                                        03010000
003020       NR_IDISSUE_479BEFF,                                        03020000
003030       NR_CDISSUE_479BEFF,                                        03030000
003040       NX_CPCRESK_479BEFF,                                        03040000
003050       NX_CPAIDSK_479BEFF,                                        03050000
003060       NX_CPFDUSK_479BEFF,                                        03060000
003070       AM_INTERSK_479BEFF,                                        03070000
003080       CO_IDPRKSK_479BEFF,                                        03080000
003090       NS_IRMOSTK_479BEFF,                                        03090000
003100       DA_UBSECIS_479BEFF                                         03100000
003110    INTO                                                          03110000
003120       :DCLDZBEFFTV.CT-RKTPROD-479BEFF,                           03120000
003130       :DCLDZBEFFTV.NR-IDSTOCK-479BEFF,                           03130000
003140       :DCLDZBEFFTV.NR-CDSTK-479BEFF,                             03140000
003150       :DCLDZBEFFTV.NS-DBSTK-479BEFF,                             03150000
003160       :DCLDZBEFFTV.AM-CNDSTK-479BEFF,                            03160000
003170       :DCLDZBEFFTV.AM-CNSTK-479BEFF,                             03170000
003180       :DCLDZBEFFTV.CT-RKTPRDX-479BEFF,                           03180000
003190       :DCLDZBEFFTV.NR-IDISSUE-479BEFF,                           03190000
003200       :DCLDZBEFFTV.NR-CDISSUE-479BEFF,                           03200000
003210       :DCLDZBEFFTV.NX-CPCRESK-479BEFF,                           03210000
003220       :DCLDZBEFFTV.NX-CPAIDSK-479BEFF,                           03220000
003230       :DCLDZBEFFTV.NX-CPFDUSK-479BEFF,                           03230000
003240       :DCLDZBEFFTV.AM-INTERSK-479BEFF,                           03240000
003250       :DCLDZBEFFTV.CO-IDPRKSK-479BEFF,                           03250000
003260       :DCLDZBEFFTV.NS-IRMOSTK-479BEFF,                           03260000
003270       :DCLDZBEFFTV.DA-UBSECIS-479BEFF                            03270000
003280    FROM DZBEFFTV                                                 03280000
003290    WHERE                                                         03290000
003300       CT_RKTPROD_479BEFF = :DCLDZBEFFTV.CT-RKTPROD-479BEFF       03300000
003310       AND NR_IDSTOCK_479BEFF = :DCLDZBEFFTV.NR-IDSTOCK-479BEFF   03310000
003320       AND NR_CDSTK_479BEFF = :DCLDZBEFFTV.NR-CDSTK-479BEFF       03320000
003330       AND NS_DBSTK_479BEFF = :DCLDZBEFFTV.NS-DBSTK-479BEFF       03330000
003340    QUERYNO 442                                                   03340000
003350     END-EXEC                                                     03350000
003360     EVALUATE SQLCODE                                             03360000
003370       WHEN 0                                                     03370000
003380            CONTINUE                                              03380000
003390       WHEN 100                                                   03390000
003400            DISPLAY 'NO DATA FOUND FOR SELECT DZBEFFTV'           03400000
003410            PERFORM SQLERROR                                      03410000
003420       WHEN OTHER                                                 03420000
003430            DISPLAY 'ERROR ON LRF KEYED PARENT SELECT '           03430000
003440                  'DZBEFFTV'                                      03440000
003450            PERFORM SQLERROR                                      03450000
003460     END-EVALUATE                                                 03460000
003470     .                                                            03470000
003480     IF SQLCODE = 0                                               03480000
003490        MOVE CT-RKTPROD-479BEFF OF DCLDZBEFFTV                    03490000
003500        TO CT-RKTPROD-479BEFF OF DCLDZEVEFTV                      03500000
003510        MOVE NR-IDSTOCK-479BEFF OF DCLDZBEFFTV                    03510000
003520        TO NR-IDSTOCK-479BEFF OF DCLDZEVEFTV                      03520000
003530        MOVE NR-CDSTK-479BEFF OF DCLDZBEFFTV                      03530000
003540        TO NR-CDSTK-479BEFF OF DCLDZEVEFTV                        03540000
003550        MOVE NS-DBSTK-479BEFF OF DCLDZBEFFTV                      03550000
003560        TO NS-DBSTK-479BEFF OF DCLDZEVEFTV                        03560000
003570        MOVE TS-TIMESTAMP TO TS-CREATE-479EVEF OF DCLDZEVEFTV     03570000
003580        MOVE '9999-12-31-23.59.59.999999'                         03580000
003590     TO TS-UPDATE-479EVEF OF DCLDZEVEFTV                          03590000
003600        MOVE CS-PROGRAM TO ID-USERID-479EVEF OF DCLDZEVEFTV       03600000
003610        MOVE ZERO TO NS-IDMSKEY-479EVEF OF DCLDZEVEFTV            03610000
003620        MOVE 'INSERT-DZEVEFTV' TO SQL-LOCATION                    03620000
003630        EXEC SQL                                                  03630000
003640    INSERT INTO DZEVEFTV                                          03640000
003650       (                                                          03650000
003660        DA_CREVTPD_479EVEF,                                       03660000
003670        CT_RKTEVPR_479EVEF,                                       03670000
003680        CT_RKTGDSV_479EVEF,                                       03680000
003690        NR_IDGOOD_479EVEF,                                        03690000
003700        NR_CI1POS_479EVEF,                                        03700000
003710        NR_CI26POS_479EVEF,                                       03710000
003720        CO_STEVPRN_479EVEF,                                       03720000
003730        CT_RKTPROD_479BEFF,                                       03730000
003740        NR_IDSTOCK_479BEFF,                                       03740000
003750        NR_CDSTK_479BEFF,                                         03750000
003760        NS_DBSTK_479BEFF,                                         03760000
003770        NR_ID_479EVEF,                                            03770000
003780        TS_CREATE_479EVEF,                                        03780000
003790        TS_UPDATE_479EVEF,                                        03790000
003800        ID_USERID_479EVEF,                                        03800000
003810        NS_IDMSKEY_479EVEF                                        03810000
003820       )                                                          03820000
003830    VALUES                                                        03830000
003840       (                                                          03840000
003850        :DCLDZEVEFTV.DA-CREVTPD-479EVEF,                          03850000
003860        :DCLDZEVEFTV.CT-RKTEVPR-479EVEF,                          03860000
003870        :DCLDZEVEFTV.CT-RKTGDSV-479EVEF,                          03870000
003880        :DCLDZEVEFTV.NR-IDGOOD-479EVEF,                           03880000
003890        :DCLDZEVEFTV.NR-CI1POS-479EVEF,                           03890000
003900        :DCLDZEVEFTV.NR-CI26POS-479EVEF,                          03900000
003910        :DCLDZEVEFTV.CO-STEVPRN-479EVEF,                          03910000
003920        :DCLDZEVEFTV.CT-RKTPROD-479BEFF,                          03920000
003930        :DCLDZEVEFTV.NR-IDSTOCK-479BEFF,                          03930000
003940        :DCLDZEVEFTV.NR-CDSTK-479BEFF,                            03940000
003950        :DCLDZEVEFTV.NS-DBSTK-479BEFF,                            03950000
003960        RIGHT(DIGITS(NEXT VALUE FOR DZEVEFSQ), 20),               03960000
003970        :DCLDZEVEFTV.TS-CREATE-479EVEF,                           03970000
003980        :DCLDZEVEFTV.TS-UPDATE-479EVEF,                           03980000
003990        :DCLDZEVEFTV.ID-USERID-479EVEF,                           03990000
004000        :DCLDZEVEFTV.NS-IDMSKEY-479EVEF                           04000000
004010       )                                                          04010000
004020    QUERYNO 442                                                   04020000
004030        END-EXEC                                                  04030000
004040        EVALUATE SQLCODE                                          04040000
004050          WHEN 0                                                  04050000
004060               CONTINUE                                           04060000
004070          WHEN OTHER                                              04070000
004080               DISPLAY 'ERROR ON INSERT DZEVEFTV'                 04080000
004090               PERFORM SQLERROR                                   04090000
004100        END-EVALUATE                                              04100000
004110     END-IF.                                                      04110000
004120     IF SQLCODE NOT = 0                                           04120000
004130        PERFORM IDMS-STOP.                                        04130000
004140                                                                  04140000
004150 220-MOD-EVEF.                                                    04150000
004160     DISPLAY '220-MOD-EVEF.'.                                     04160000
004170     MOVE '1002' TO CT-RKTPROD-479BEFF OF DCLDZBEFFTV.            04170000
004180     MOVE NR-ST-FORM-AS OF VMDZ205I TO WS-LRF-SPLIT-1-RAW.        04180000
004190     MOVE WS-LRF-SPLIT-1-C1 TO NR-IDSTOCK-479BEFF OF DCLDZBEFFTV. 04190000
004200     MOVE WS-LRF-SPLIT-1-C2 TO NR-CDSTK-479BEFF OF DCLDZBEFFTV.   04200000
004210     MOVE NS-DB-STOCK-FORM-AS-R TO NS-DBSTK-479BEFF               04210000
004220       OF DCLDZBEFFTV.                                            04220000
004230*                                                                 04230000
004240     INITIALIZE DCLDZEVEFTV                                       04240000
004250     MOVE 220 TO SQL-LOCATION                                     04250000
004260     EXEC SQL                                                     04260000
004270        SELECT NR_ID_479EVEF                                      04270000
004280        INTO                                                      04280000
004290           :DCLDZEVEFTV.NR-ID-479EVEF                             04290000
004300        FROM DZEVEFTV                                             04300000
004310        WHERE CT_RKTPROD_479BEFF = :DCLDZBEFFTV.CT-RKTPROD-479BEFF04310000
004320        AND NR_IDSTOCK_479BEFF = :DCLDZBEFFTV.NR-IDSTOCK-479BEFF  04320000
004330        AND NR_CDSTK_479BEFF = :DCLDZBEFFTV.NR-CDSTK-479BEFF      04330000
004340        AND NS_DBSTK_479BEFF = :DCLDZBEFFTV.NS-DBSTK-479BEFF      04340000
004350        AND CT_RKTEVPR_479EVEF = '0168'                           04350000
004360        AND CT_RKTGDSV_479EVEF = '0219'                           04360000
004370        ORDER BY NR_ID_479EVEF DESC                               04370000
004380        FETCH FIRST 1 ROW ONLY                                    04380000
004390        QUERYNO 254                                               04390000
004400     END-EXEC                                                     04400000
004410     IF SQLCODE NOT = 0 AND SQLCODE NOT = 100                     04410000
004420        DISPLAY 'ERROR ON LRF SINGLETON SELECT'                   04420000
004430        PERFORM SQLERROR                                          04430000
004440     END-IF.                                                      04440000
004450     IF NOT SQLCODE = 0                                           04450000
004460        DISPLAY ' ** VMDZ1526 RECH EVTS SOUSCRIPTION **'          04460000
004470        DISPLAY 'NR-ST:' NR-ST-FORM-AS OF VMDZ205I                04470000
004480               ' NS-DB:' NS-DB-STOCK-FORM-AS OF VMDZ205I          04480000
004490        CALL USERABEN                                             04490000
004500     END-IF.                                                      04500000
004510                                                                  04510000
004520     MOVE NR-CIO-FORM-AS-R TO HULP-NR-CIO.                        04520000
004530     MOVE DA-CREA-FORM-AS-R TO HULP-DA-CREA.                      04530000
004540     MOVE NR-ID-FORM-AS OF VMDZ205I TO HULP-NR-ID.                04540000
004550     MOVE CT-OPD-FORM-AS-R TO HULP-CT-OPD.                        04550000
004560     MOVE CT-OPG-FORM-AS-R TO HULP-CT-OPG.                        04560000
004570     MOVE HULP-NR-ID-GOOD TO NR-IDGOOD-479EVEF OF DCLDZEVEFTV.    04570000
004580                                                                  04580000
004590     MOVE 220 TO SQL-LOCATION.                                    04590000
004600     MOVE TS-TIMESTAMP TO TS-UPDATE-479EVEF OF DCLDZEVEFTV        04600000
004610     MOVE CS-PROGRAM TO ID-USERID-479EVEF OF DCLDZEVEFTV          04610000
004620     EXEC SQL                                                     04620000
004630    UPDATE DZEVEFTV                                               04630000
004640    SET                                                           04640000
004650       NR_IDGOOD_479EVEF = :DCLDZEVEFTV.NR-IDGOOD-479EVEF,        04650000
004660       TS_UPDATE_479EVEF = :DCLDZEVEFTV.TS-UPDATE-479EVEF,        04660000
004670       ID_USERID_479EVEF = :DCLDZEVEFTV.ID-USERID-479EVEF         04670000
004680    WHERE                                                         04680000
004690       NR_ID_479EVEF = :DCLDZEVEFTV.NR-ID-479EVEF                 04690000
004700    QUERYNO 442                                                   04700000
004710     END-EXEC                                                     04710000
004720     EVALUATE SQLCODE                                             04720000
004730       WHEN 0                                                     04730000
004740            CONTINUE                                              04740000
004750       WHEN OTHER                                                 04750000
004760            DISPLAY 'ERROR ON UPDATE DZEVEFTV'                    04760000
004770            PERFORM SQLERROR                                      04770000
004780     END-EVALUATE                                                 04780000
004790     .                                                            04790000
004800     IF NOT SQLCODE = 0                                           04800000
004810        DISPLAY ' ** VMDZ1526 UPDATE CLÉ FORM **'                 04810000
004820        DISPLAY 'NR-ST:' NR-ST-FORM-AS OF VMDZ205I                04820000
004830               ' NS-DB:' NS-DB-STOCK-FORM-AS OF VMDZ205I          04830000
004840        CALL USERABEN                                             04840000
004850     END-IF.                                                      04850000
004860                                                                  04860000
004870 800-TEST-FFRECAB.                                                04870000
004880     DISPLAY '800-TEST-FFRECAB.'.                                 04880000
004890                                                                  04890000
004900 900-LEES-INFIL.                                                  04900000
004910     DISPLAY '900-LEES-INFIL.'.                                   04910000
004920     INITIALIZE VMDZ205I.                                         04920000
004930                                                                  04930000
004940     READ INFIL INTO VMDZ205I                                     04940000
004950        AT END SET VMDZ205I-EOF TO TRUE.                          04950000
004960                                                                  04960000
004970        IF VMDZ205I-NOT-EOF                                       04970000
004980           THEN                                                   04980000
004990           ADD +1 TO WS-TELLER                                    04990000
005000           ADD +1 TO WS-NB-INPUT-UPD-I                            05000000
005010           MOVE VMDZ205I TO WS-INPUT-KASBONS                      05010000
005020        END-IF.                                                   05020000
005030                                                                  05030000
005040 STOP01.                                                          05040000
005050     DISPLAY 'STOP01.'.                                           05050000
005060     DISPLAY '##&&VMDZ1526 - STOP01 : TE WEINIG REC OP INFIL'.    05060000
005070     CALL USERABEN.                                               05070000
005080                                                                  05080000
005090 IDMS-STOP.                                                       05090000
005100     DISPLAY 'IDMS-STOP.'.                                        05100000
005110*: ', LR-STATUS.                                                  05110000
005120*'##&&ERROR-STATUS : ', ERROR-STATUS.                             05120000
005130*'##&&DML-SEQUENCE : ', DML-SEQUENCE.                             05130000
005140     MOVE 'ROLLBACK' TO SQL-LOCATION.                             05140000
005150     EXEC SQL                                                     05150000
005160    ROLLBACK                                                      05160000
005170     END-EXEC.                                                    05170000
005180     CALL USERABEN.                                               05180000
005190                                                                  05190000
005200                                                                  05200000
005210 1100-GET-TIMESTAMP.                                              05210000
005220     DISPLAY '1100-GET-TIMESTAMP.'.                               05220000
005230D    DISPLAY '600-GET-TIMESTAMP.'                                 05230000
005240     MOVE FUNCTION CURRENT-DATE TO TS-SYSTEM.                     05240000
005250     MOVE CC OF TS-SYSTEM       TO CC OF TS-TIMESTAMP             05250000
005260     MOVE YY OF TS-SYSTEM       TO YY OF TS-TIMESTAMP             05260000
005270     MOVE MM OF TS-SYSTEM       TO MM OF TS-TIMESTAMP             05270000
005280     MOVE DD OF TS-SYSTEM       TO DD OF TS-TIMESTAMP             05280000
005290     MOVE HH OF TS-SYSTEM       TO HH OF TS-TIMESTAMP             05290000
005300     MOVE MI OF TS-SYSTEM       TO MI OF TS-TIMESTAMP             05300000
005310     MOVE SS OF TS-SYSTEM       TO SS OF TS-TIMESTAMP             05310000
005320     MOVE TT OF TS-SYSTEM       TO TT OF TS-TIMESTAMP             05320000
005330     DISPLAY 'TIMESTAMP: ' TS-TIMESTAMP                           05330000
005340     .                                                            05340000
005350                                                                  05350000
005360*SQLERROR ROUTINE.                                                05360000
005370     EXEC SQL                                                     05370000
005380          INCLUDE SQLERROR                                        05380000
005390     END-EXEC.                                                    05390000
005400                                                                  05400000
005410 700-RESTART-CONTROL.                                             05410000
005420     DISPLAY '700-RESTART-CONTROL.'.                              05420000
005430     MOVE CS-PROGRAM TO NM-ID-RS-PROGRAM OF DCLDZ01RSTV.          05430000
005440     MOVE DA-DD-MM-CCYY   TO DA-CR-RS       OF DCLDZ01RSTV.       05440000
005450     MOVE 1     TO NB-ID-RS-PHASE      OF DCLDZ01RSTV.            05450000
005460                                                                  05460000
005470     PERFORM 700-SELECT-DZ01RSTV.                                 05470000
005480                                                                  05480000
005490     EVALUATE SQLCODE                                             05490000
005500       WHEN 0        PERFORM 710-JOB-IS-RESTART                   05500000
005510       WHEN 100 PERFORM 720-WRITE-RESTART-REC                     05510000
005520       WHEN OTHER               PERFORM SQLERROR                  05520000
005530     END-EVALUATE.                                                05530000
005540                                                                  05540000
005550     MOVE 0 TO WS-TELLER.                                         05550000
005560                                                                  05560000
005570 700-SELECT-DZ01RSTV.                                             05570000
005580     DISPLAY '700-SELECT-DZ01RSTV.'.                              05580000
005590                                                                  05590000
005600     MOVE 700 TO SQL-LOCATION                                     05600000
005610     EXEC SQL                                                     05610000
005620      SELECT NM_ID_RS_PROGRAM                                     05620000
005630           , NB_ID_RS_PHASE                                       05630000
005640           , DA_CR_RS                                             05640000
005650           , CO_ID_RS                                             05650000
005660           , NB_DAY_RS                                            05660000
005670           , TE_CH_RS_DATA                                        05670000
005680        INTO :DCLDZ01RSTV.NM-ID-RS-PROGRAM                        05680000
005690           , :DCLDZ01RSTV.NB-ID-RS-PHASE                          05690000
005700           , :DCLDZ01RSTV.DA-CR-RS                                05700000
005710           , :DCLDZ01RSTV.CO-ID-RS                                05710000
005720           , :DCLDZ01RSTV.NB-DAY-RS                               05720000
005730           , :DCLDZ01RSTV.TE-CH-RS-DATA                           05730000
005740        FROM DZ01RSTV                                             05740000
005750       WHERE NM_ID_RS_PROGRAM = :DCLDZ01RSTV.NM-ID-RS-PROGRAM     05750000
005760         AND NB_ID_RS_PHASE = :DCLDZ01RSTV.NB-ID-RS-PHASE         05760000
005770         AND DA_CR_RS = :DCLDZ01RSTV.DA-CR-RS                     05770000
005780      QUERYNO 376                                                 05780000
005790     END-EXEC                                                     05790000
005800                                                                  05800000
005810     EVALUATE SQLCODE                                             05810000
005820       WHEN 0                                                     05820000
005830       WHEN 100                                                   05830000
005840            CONTINUE                                              05840000
005850       WHEN OTHER                                                 05850000
005860            DISPLAY 'ERROR ON SELECT DZ01RSTV'                    05860000
005870            PERFORM SQLERROR                                      05870000
005880     END-EVALUATE                                                 05880000
005890     .                                                            05890000
005900                                                                  05900000
005910 700-UPDATE-DZ01RSTV.                                             05910000
005920     DISPLAY '700-UPDATE-DZ01RSTV.'.                              05920000
005930                                                                  05930000
005940     MOVE 700 TO SQL-LOCATION                                     05940000
005950     EXEC SQL                                                     05950000
005960      UPDATE DZ01RSTV                                             05960000
005970         SET TE_CH_RS_DATA = :DCLDZ01RSTV.TE-CH-RS-DATA           05970000
005980           , CO_ID_RS = :DCLDZ01RSTV.CO-ID-RS                     05980000
005990       WHERE NM_ID_RS_PROGRAM = :DCLDZ01RSTV.NM-ID-RS-PROGRAM     05990000
006000         AND NB_ID_RS_PHASE = :DCLDZ01RSTV.NB-ID-RS-PHASE         06000000
006010         AND DA_CR_RS = :DCLDZ01RSTV.DA-CR-RS                     06010000
006020      QUERYNO 398                                                 06020000
006030     END-EXEC                                                     06030000
006040                                                                  06040000
006050     EVALUATE SQLCODE                                             06050000
006060       WHEN 0                                                     06060000
006070            CONTINUE                                              06070000
006080       WHEN OTHER                                                 06080000
006090            DISPLAY 'ERROR ON UPDATE DZ01RSTV'                    06090000
006100            PERFORM SQLERROR                                      06100000
006110     END-EVALUATE                                                 06110000
006120     .                                                            06120000
006130                                                                  06130000
006140 700-INSERT-DZ01RSTV.                                             06140000
006150     DISPLAY '700-INSERT-DZ01RSTV.'.                              06150000
006160                                                                  06160000
006170     MOVE 700 TO SQL-LOCATION                                     06170000
006180     EXEC SQL                                                     06180000
006190      INSERT INTO DZ01RSTV                                        06190000
006200             VALUES (:DCLDZ01RSTV)                                06200000
006210     END-EXEC                                                     06210000
006220                                                                  06220000
006230     EVALUATE SQLCODE                                             06230000
006240       WHEN 0                                                     06240000
006250            CONTINUE                                              06250000
006260       WHEN OTHER                                                 06260000
006270            DISPLAY 'ERROR ON INSERT DZ01RSTV'                    06270000
006280            PERFORM SQLERROR                                      06280000
006290     END-EVALUATE                                                 06290000
006300     .                                                            06300000
006310                                                                  06310000
006320 710-JOB-IS-RESTART.                                              06320000
006330     DISPLAY '710-JOB-IS-RESTART.'.                               06330000
006340     MOVE TE-CH-RS-DATA-TEXT OF DCLDZ01RSTV                       06340000
006350       TO WS-RESTART-REC.                                         06350000
006360                                                                  06360000
006370     IF CO-ID-RS OF DCLDZ01RSTV = '1'                             06370000
006380        THEN DISPLAY ' PREVIOUS RUN COMPLETE '                    06380000
006390        PERFORM 810000-CALL-USERABEN                              06390000
006400     ELSE PERFORM NB-READ OF WS-RESTART-REC TIMES                 06400000
006410        PERFORM 900-LEES-INFIL                                    06410000
006420        MOVE NB-READ OF WS-RESTART-REC                            06420000
006430            TO WS-NB-INPUT-UPD-I                                  06430000
006440     END-PERFORM                                                  06440000
006450     END-IF.                                                      06450000
006460                                                                  06460000
006470 720-WRITE-RESTART-REC.                                           06470000
006480     DISPLAY '720-WRITE-RESTART-REC.'.                            06480000
006490     MOVE '0' TO CO-ID-RS    OF DCLDZ01RSTV.                      06490000
006500     MOVE 7      TO NB-DAY-RS OF DCLDZ01RSTV.                     06500000
006510     MOVE 0                     TO WS-NB-INPUT-UPD-I.             06510000
006520     MOVE WS-NB-INPUT-UPD-I       TO NB-READ OF WS-RESTART-REC.   06520000
006530     INITIALIZE KY-RESTART.                                       06530000
006540     MOVE 1215                                                    06540000
006550       TO TE-CH-RS-DATA-LEN OF DCLDZ01RSTV.                       06550000
006560     MOVE WS-RESTART-REC                                          06560000
006570       TO TE-CH-RS-DATA-TEXT   OF DCLDZ01RSTV.                    06570000
006580                                                                  06580000
006590     PERFORM 700-INSERT-DZ01RSTV.                                 06590000
006600                                                                  06600000
006610 800-PROCESS-COMMIT.                                              06610000
006620     DISPLAY '800-PROCESS-COMMIT.'.                               06620000
006630     MOVE 0               TO WS-TELLER.                           06630000
006640     MOVE WS-NB-INPUT-UPD-I TO NB-READ  OF WS-RESTART-REC.        06640000
006650     MOVE WS-INPUT-KASBONS                                        06650000
006660       TO KY-RESTART OF WS-RESTART-REC.                           06660000
006670                                                                  06670000
006680     IF VMDZ205I-EOF                                              06680000
006690        THEN MOVE '1'   TO CO-ID-RS OF DCLDZ01RSTV                06690000
006700     ELSE MOVE '0' TO CO-ID-RS OF DCLDZ01RSTV                     06700000
006710     END-IF.                                                      06710000
006720                                                                  06720000
006730     MOVE 15                                                      06730000
006740       TO TE-CH-RS-DATA-LEN OF DCLDZ01RSTV.                       06740000
006750     MOVE WS-RESTART-REC                                          06750000
006760       TO TE-CH-RS-DATA-TEXT   OF DCLDZ01RSTV.                    06760000
006770                                                                  06770000
006780     PERFORM 700-UPDATE-DZ01RSTV.                                 06780000
006790                                                                  06790000
006800     MOVE 800 TO SQL-LOCATION                                     06800000
006810     EXEC SQL                                                     06810000
006820      COMMIT                                                      06820000
006830     END-EXEC.                                                    06830000
006840                                                                  06840000
006850     EVALUATE SQLCODE                                             06850000
006860       WHEN 0                                                     06860000
006870            CONTINUE                                              06870000
006880       WHEN OTHER                                                 06880000
006890            DISPLAY 'ERROR REC NUMBER : ' WS-NB-INPUT-UPD-I       06890000
006900            PERFORM SQLERROR                                      06900000
006910     END-EVALUATE.                                                06910000
006920                                                                  06920000
006930 810000-CALL-USERABEN.                                            06930000
006940     DISPLAY '810000-CALL-USERABEN.'.                             06940000
006950     CALL USERABEN.                                               06950000
