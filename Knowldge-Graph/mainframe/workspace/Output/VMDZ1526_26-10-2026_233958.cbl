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
001890*---------------------------------------                          01890000
001900                                                                  01900000
001910     MOVE CS-PROGRAM TO PROGRAM-NAME                              01910000
001920     PERFORM 600-GET-TIMESTAMP.                                   01920000
001930                                                                  01930000
001940 000-STUUR.                                                       01940000
001950     DISPLAY '000-STUUR.'.                                        01950000
001960     PERFORM 100-INITIALISATIE.                                   01960000
001970     PERFORM 700-RESTART-CONTROL.                                 01970000
001980                                                                  01980000
001990     PERFORM 200-VERWERK-INFIL UNTIL VMDZ205I-EOF.                01990000
002000                                                                  02000000
002010     PERFORM 800-PROCESS-COMMIT.                                  02010000
002020                                                                  02020000
002030     DISPLAY 'NUMBER OF RECORDS PROCESSED : ' WS-NB-INPUT-UPD-I.  02030000
002040     DISPLAY 'NUMBER OF UPDATE BFAR       : ' WS-NB-BFAR-UPD-I.   02040000
002050     CLOSE INFIL.                                                 02050000
002060     STOP RUN.                                                    02060000
002070                                                                  02070000
002080 100-INITIALISATIE.                                               02080000
002090     DISPLAY '100-INITIALISATIE.'.                                02090000
002100     MOVE DATE8-LS       TO DATE-DMY8.                            02100000
002110     MOVE CORR DATE-DMY8 TO DATE-DMY.                             02110000
002120     MOVE CORR DATE-DMY8 TO DATE-YMD.                             02120000
002130     MOVE CORR DATE-DMY8 TO DATE-YMD8.                            02130000
002140                                                                  02140000
002150     OPEN INPUT INFIL.                                            02150000
002160     MOVE +0 TO TELLER.                                           02160000
002170     PERFORM 900-LEES-INFIL.                                      02170000
002180                                                                  02180000
002190 110-POSITIONEREN-INFIL.                                          02190000
002200     DISPLAY '110-POSITIONEREN-INFIL.'.                           02200000
002210     ADD +1 TO TELLER.                                            02210000
002220     PERFORM 900-LEES-INFIL.                                      02220000
002230     IF VMDZ205I-EOF                                              02230000
002240        PERFORM STOP01.                                           02240000
002250                                                                  02250000
002260 200-VERWERK-INFIL.                                               02260000
002270     DISPLAY '200-VERWERK-INFIL.'.                                02270000
002280     ADD +1 TO TELLER.                                            02280000
002290     IF CO-STCIRC-OORD = '1'                                      02290000
002300        THEN PERFORM 210-STORE-EFF                                02300000
002310     ELSE PERFORM 220-MOD-EVEF                                    02310000
002320     END-IF.                                                      02320000
002330     IF TELLER NOT < +100                                         02330000
002340        PERFORM 800-TEST-FFRECAB                                  02340000
002350        MOVE +0 TO TELLER.                                        02350000
002360                                                                  02360000
002370                                                                  02370000
002380        IF WS-TELLER > 99                                         02380000
002390           PERFORM 800-PROCESS-COMMIT                             02390000
002400        END-IF.                                                   02400000
002410                                                                  02410000
002420        PERFORM 900-LEES-INFIL.                                   02420000
002430                                                                  02430000
002440 210-STORE-EFF.                                                   02440000
002450     DISPLAY '210-STORE-EFF.'.                                    02450000
002460     INITIALIZE DCLDZBEFFTV DCLDZEVEFTV.                          02460000
002470     MOVE '1002' TO CT-RKTPROD-479BEFF OF DCLDZBEFFTV             02470000
002480     MOVE NR-ST-FORM-AS OF VMDZ205I TO WS-LRF-SPLIT-1-RAW.        02480000
002490     MOVE WS-LRF-SPLIT-1-C1 TO NR-IDSTOCK-479BEFF OF DCLDZBEFFTV. 02490000
002500     MOVE WS-LRF-SPLIT-1-C2 TO NR-CDSTK-479BEFF OF DCLDZBEFFTV.   02500000
002510     MOVE NS-DB-STOCK-FORM-AS-R TO NS-DBSTK-479BEFF               02510000
002520       OF DCLDZBEFFTV.                                            02520000
002530     MOVE NR-ID-040SECU TO CO-IDPRKSK-479BEFF OF DCLDZBEFFTV.     02530000
002540     MOVE NS-SEQ-040IRMO TO NS-IRMOSTK-479BEFF OF DCLDZBEFFTV.    02540000
002550     MOVE ZEROES TO DA-CCYYMMDD                                   02550000
002560     MOVE DA-UB-FORM-AS OF VMDZ205I TO DA-CCYYMMDD                02560000
002570     IF DA-CCYYMMDD = ZERO OR DA-CCYYMMDD = SPACES                02570000
002580        MOVE 00010101 TO DA-CCYYMMDD                              02580000
002590     END-IF                                                       02590000
002600     MOVE CORR DA-CCYYMMDD-R TO DA-DD-MM-CCYY                     02600000
002610     MOVE DA-DD-MM-CCYY TO DA-UBSECIS-479BEFF OF DCLDZBEFFTV      02610000
002620     MOVE 0 TO NR-IDISSUE-479BEFF OF DCLDZBEFFTV.                 02620000
002630     MOVE 0 TO NR-CDISSUE-479BEFF OF DCLDZBEFFTV.                 02630000
002640     MOVE ZEROES TO DA-CCYYMMDD                                   02640000
002650     MOVE DATE-YMD8 TO DA-CCYYMMDD                                02650000
002660     MOVE CORR DA-CCYYMMDD-R TO DA-DD-MM-CCYY                     02660000
002670     MOVE DA-DD-MM-CCYY TO DA-CREVTPD-479EVEF OF DCLDZEVEFTV      02670000
002680     MOVE '0168' TO CT-RKTEVPR-479EVEF OF DCLDZEVEFTV.            02680000
002690     MOVE '0219' TO CT-RKTGDSV-479EVEF OF DCLDZEVEFTV.            02690000
002700     MOVE NR-CIO-FORM-AS-R TO HULP-NR-CIO.                        02700000
002710     MOVE DA-CREA-FORM-AS-R TO HULP-DA-CREA.                      02710000
002720     MOVE NR-ID-FORM-AS OF VMDZ205I TO HULP-NR-ID.                02720000
002730     MOVE CT-OPD-FORM-AS-R TO HULP-CT-OPD.                        02730000
002740     MOVE CT-OPG-FORM-AS-R TO HULP-CT-OPG.                        02740000
002750     MOVE HULP-NR-ID-GOOD TO NR-IDGOOD-479EVEF OF DCLDZEVEFTV.    02750000
002760     MOVE NR-CIO-FORM-AS OF VMDZ205I TO DB-NR-CI.                 02760000
002770                                                                  02770000
002780*                                                                 02780000
002790* STOCKEREN VAN DE RECORDS :                                      02790000
002800*    - VMBWCEF                                                    02800000
002810     MOVE NR-CIO-FORM-AS OF VMDZ205I TO WS-LRF-SPLIT-2-RAW.       02810000
002820     MOVE WS-LRF-SPLIT-2-C1 TO NR-CI1POS-479EVEF OF DCLDZEVEFTV.  02820000
002830     MOVE WS-LRF-SPLIT-2-C2 TO NR-CI26POS-479EVEF OF DCLDZEVEFTV. 02830000
002840     MOVE 'SELECT-VMBEFF' TO SQL-LOCATION.                        02840000
002850     EXEC SQL                                                     02850000
002860     SELECT                                                       02860000
002870       CT_RKTPROD_479BEFF,                                        02870000
002880       NR_IDSTOCK_479BEFF,                                        02880000
002890       NR_CDSTK_479BEFF,                                          02890000
002900       NS_DBSTK_479BEFF,                                          02900000
002910       AM_CNDSTK_479BEFF,                                         02910000
002920       AM_CNSTK_479BEFF,                                          02920000
002930       CT_RKTPRDX_479BEFF,                                        02930000
002940       NR_IDISSUE_479BEFF,                                        02940000
002950       NR_CDISSUE_479BEFF,                                        02950000
002960       NX_CPCRESK_479BEFF,                                        02960000
002970       NX_CPAIDSK_479BEFF,                                        02970000
002980       NX_CPFDUSK_479BEFF,                                        02980000
002990       AM_INTERSK_479BEFF,                                        02990000
003000       CO_IDPRKSK_479BEFF,                                        03000000
003010       NS_IRMOSTK_479BEFF,                                        03010000
003020       DA_UBSECIS_479BEFF                                         03020000
003030     INTO                                                         03030000
003040       :DCLDZBEFFTV.CT-RKTPROD-479BEFF,                           03040000
003050       :DCLDZBEFFTV.NR-IDSTOCK-479BEFF,                           03050000
003060       :DCLDZBEFFTV.NR-CDSTK-479BEFF,                             03060000
003070       :DCLDZBEFFTV.NS-DBSTK-479BEFF,                             03070000
003080       :DCLDZBEFFTV.AM-CNDSTK-479BEFF,                            03080000
003090       :DCLDZBEFFTV.AM-CNSTK-479BEFF,                             03090000
003100       :DCLDZBEFFTV.CT-RKTPRDX-479BEFF,                           03100000
003110       :DCLDZBEFFTV.NR-IDISSUE-479BEFF,                           03110000
003120       :DCLDZBEFFTV.NR-CDISSUE-479BEFF,                           03120000
003130       :DCLDZBEFFTV.NX-CPCRESK-479BEFF,                           03130000
003140       :DCLDZBEFFTV.NX-CPAIDSK-479BEFF,                           03140000
003150       :DCLDZBEFFTV.NX-CPFDUSK-479BEFF,                           03150000
003160       :DCLDZBEFFTV.AM-INTERSK-479BEFF,                           03160000
003170       :DCLDZBEFFTV.CO-IDPRKSK-479BEFF,                           03170000
003180       :DCLDZBEFFTV.NS-IRMOSTK-479BEFF,                           03180000
003190       :DCLDZBEFFTV.DA-UBSECIS-479BEFF                            03190000
003200     FROM DZBEFFTV                                                03200000
003210     WHERE                                                        03210000
003220       CT_RKTPROD_479BEFF = :DCLDZBEFFTV.CT-RKTPROD-479BEFF       03220000
003230       AND NR_IDSTOCK_479BEFF = :DCLDZBEFFTV.NR-IDSTOCK-479BEFF   03230000
003240       AND NR_CDSTK_479BEFF = :DCLDZBEFFTV.NR-CDSTK-479BEFF       03240000
003250       AND NS_DBSTK_479BEFF = :DCLDZBEFFTV.NS-DBSTK-479BEFF       03250000
003260     QUERYNO 442                                                  03260000
003270     END-EXEC                                                     03270000
003280     EVALUATE SQLCODE                                             03280000
003290       WHEN 0                                                     03290000
003300            CONTINUE                                              03300000
003310       WHEN 100                                                   03310000
003320            DISPLAY 'NO DATA FOUND FOR SELECT DZBEFFTV'           03320000
003330            PERFORM SQLERROR                                      03330000
003340       WHEN OTHER                                                 03340000
003350            DISPLAY 'ERROR ON LRF KEYED PARENT SELECT '           03350000
003360                  'DZBEFFTV'                                      03360000
003370            PERFORM SQLERROR                                      03370000
003380     END-EVALUATE                                                 03380000
003390     .                                                            03390000
003400     IF SQLCODE = 0                                               03400000
003410        MOVE CT-RKTPROD-479BEFF OF DCLDZBEFFTV                    03410000
003420        TO CT-RKTPROD-479BEFF OF DCLDZEVEFTV                      03420000
003430        MOVE NR-IDSTOCK-479BEFF OF DCLDZBEFFTV                    03430000
003440        TO NR-IDSTOCK-479BEFF OF DCLDZEVEFTV                      03440000
003450        MOVE NR-CDSTK-479BEFF OF DCLDZBEFFTV                      03450000
003460        TO NR-CDSTK-479BEFF OF DCLDZEVEFTV                        03460000
003470        MOVE NS-DBSTK-479BEFF OF DCLDZBEFFTV                      03470000
003480        TO NS-DBSTK-479BEFF OF DCLDZEVEFTV                        03480000
003490        MOVE TS-TIMESTAMP TO TS-CREATE-479EVEF OF DCLDZEVEFTV     03490000
003500        MOVE '9999-12-31-23.59.59.999999'                         03500000
003510     TO TS-UPDATE-479EVEF OF DCLDZEVEFTV                          03510000
003520        MOVE CS-PROGRAM TO ID-USERID-479EVEF OF DCLDZEVEFTV       03520000
003530        MOVE ZERO TO NS-IDMSKEY-479EVEF OF DCLDZEVEFTV            03530000
003540        MOVE 'INSERT-DZEVEFTV' TO SQL-LOCATION                    03540000
003550        EXEC SQL                                                  03550000
003560     INSERT INTO DZEVEFTV                                         03560000
003570       (                                                          03570000
003580        DA_CREVTPD_479EVEF,                                       03580000
003590        CT_RKTEVPR_479EVEF,                                       03590000
003600        CT_RKTGDSV_479EVEF,                                       03600000
003610        NR_IDGOOD_479EVEF,                                        03610000
003620        NR_CI1POS_479EVEF,                                        03620000
003630        NR_CI26POS_479EVEF,                                       03630000
003640        CO_STEVPRN_479EVEF,                                       03640000
003650        CT_RKTPROD_479BEFF,                                       03650000
003660        NR_IDSTOCK_479BEFF,                                       03660000
003670        NR_CDSTK_479BEFF,                                         03670000
003680        NS_DBSTK_479BEFF,                                         03680000
003690        NR_ID_479EVEF,                                            03690000
003700        TS_CREATE_479EVEF,                                        03700000
003710        TS_UPDATE_479EVEF,                                        03710000
003720        ID_USERID_479EVEF,                                        03720000
003730        NS_IDMSKEY_479EVEF                                        03730000
003740       )                                                          03740000
003750     VALUES                                                       03750000
003760       (                                                          03760000
003770        :DCLDZEVEFTV.DA-CREVTPD-479EVEF,                          03770000
003780        :DCLDZEVEFTV.CT-RKTEVPR-479EVEF,                          03780000
003790        :DCLDZEVEFTV.CT-RKTGDSV-479EVEF,                          03790000
003800        :DCLDZEVEFTV.NR-IDGOOD-479EVEF,                           03800000
003810        :DCLDZEVEFTV.NR-CI1POS-479EVEF,                           03810000
003820        :DCLDZEVEFTV.NR-CI26POS-479EVEF,                          03820000
003830        :DCLDZEVEFTV.CO-STEVPRN-479EVEF,                          03830000
003840        :DCLDZEVEFTV.CT-RKTPROD-479BEFF,                          03840000
003850        :DCLDZEVEFTV.NR-IDSTOCK-479BEFF,                          03850000
003860        :DCLDZEVEFTV.NR-CDSTK-479BEFF,                            03860000
003870        :DCLDZEVEFTV.NS-DBSTK-479BEFF,                            03870000
003880        RIGHT(DIGITS(NEXT VALUE FOR DZEVEFSQ), 20),               03880000
003890        :DCLDZEVEFTV.TS-CREATE-479EVEF,                           03890000
003900        :DCLDZEVEFTV.TS-UPDATE-479EVEF,                           03900000
003910        :DCLDZEVEFTV.ID-USERID-479EVEF,                           03910000
003920        :DCLDZEVEFTV.NS-IDMSKEY-479EVEF                           03920000
003930       )                                                          03930000
003940     QUERYNO 442                                                  03940000
003950        END-EXEC                                                  03950000
003960        EVALUATE SQLCODE                                          03960000
003970          WHEN 0                                                  03970000
003980               CONTINUE                                           03980000
003990          WHEN OTHER                                              03990000
004000               DISPLAY 'ERROR ON INSERT DZEVEFTV'                 04000000
004010               PERFORM SQLERROR                                   04010000
004020        END-EVALUATE                                              04020000
004030     END-IF.                                                      04030000
004040     IF SQLCODE NOT = 0                                           04040000
004050        PERFORM IDMS-STOP.                                        04050000
004060                                                                  04060000
004070 220-MOD-EVEF.                                                    04070000
004080     DISPLAY '220-MOD-EVEF.'.                                     04080000
004090     MOVE '1002' TO CT-RKTPROD-479BEFF OF DCLDZBEFFTV.            04090000
004100     MOVE NR-ST-FORM-AS OF VMDZ205I TO WS-LRF-SPLIT-1-RAW.        04100000
004110     MOVE WS-LRF-SPLIT-1-C1 TO NR-IDSTOCK-479BEFF OF DCLDZBEFFTV. 04110000
004120     MOVE WS-LRF-SPLIT-1-C2 TO NR-CDSTK-479BEFF OF DCLDZBEFFTV.   04120000
004130     MOVE NS-DB-STOCK-FORM-AS-R TO NS-DBSTK-479BEFF               04130000
004140       OF DCLDZBEFFTV.                                            04140000
004150*                                                                 04150000
004160     INITIALIZE DCLDZEVEFTV                                       04160000
004170     MOVE 220 TO SQL-LOCATION                                     04170000
004180     EXEC SQL                                                     04180000
004190        SELECT NR_ID_479EVEF                                      04190000
004200        INTO                                                      04200000
004210           :DCLDZEVEFTV.NR-ID-479EVEF                             04210000
004220        FROM DZEVEFTV                                             04220000
004230        WHERE CT_RKTPROD_479BEFF = :DCLDZBEFFTV.CT-RKTPROD-479BEFF04230000
004240        AND NR_IDSTOCK_479BEFF = :DCLDZBEFFTV.NR-IDSTOCK-479BEFF  04240000
004250        AND NR_CDSTK_479BEFF = :DCLDZBEFFTV.NR-CDSTK-479BEFF      04250000
004260        AND NS_DBSTK_479BEFF = :DCLDZBEFFTV.NS-DBSTK-479BEFF      04260000
004270        AND CT_RKTEVPR_479EVEF = '0168'                           04270000
004280        AND CT_RKTGDSV_479EVEF = '0219'                           04280000
004290        ORDER BY NR_ID_479EVEF DESC                               04290000
004300        FETCH FIRST 1 ROW ONLY                                    04300000
004310        QUERYNO 254                                               04310000
004320     END-EXEC                                                     04320000
004330     IF SQLCODE NOT = 0 AND SQLCODE NOT = 100                     04330000
004340        DISPLAY 'ERROR ON LRF SINGLETON SELECT'                   04340000
004350        PERFORM SQLERROR                                          04350000
004360     END-IF.                                                      04360000
004370     IF NOT SQLCODE = 0                                           04370000
004380        DISPLAY ' ** VMDZ1526 RECH EVTS SOUSCRIPTION **'          04380000
004390        DISPLAY 'NR-ST:' NR-ST-FORM-AS OF VMDZ205I                04390000
004400               ' NS-DB:' NS-DB-STOCK-FORM-AS OF VMDZ205I          04400000
004410        CALL USERABEN                                             04410000
004420     END-IF.                                                      04420000
004430                                                                  04430000
004440     MOVE NR-CIO-FORM-AS-R TO HULP-NR-CIO.                        04440000
004450     MOVE DA-CREA-FORM-AS-R TO HULP-DA-CREA.                      04450000
004460     MOVE NR-ID-FORM-AS OF VMDZ205I TO HULP-NR-ID.                04460000
004470     MOVE CT-OPD-FORM-AS-R TO HULP-CT-OPD.                        04470000
004480     MOVE CT-OPG-FORM-AS-R TO HULP-CT-OPG.                        04480000
004490     MOVE HULP-NR-ID-GOOD TO NR-IDGOOD-479EVEF OF DCLDZEVEFTV.    04490000
004500                                                                  04500000
004510     MOVE 220 TO SQL-LOCATION.                                    04510000
004520     MOVE TS-TIMESTAMP TO TS-UPDATE-479EVEF OF DCLDZEVEFTV        04520000
004530     MOVE CS-PROGRAM TO ID-USERID-479EVEF OF DCLDZEVEFTV          04530000
004540     EXEC SQL                                                     04540000
004550     UPDATE DZEVEFTV                                              04550000
004560     SET                                                          04560000
004570       NR_IDGOOD_479EVEF = :DCLDZEVEFTV.NR-IDGOOD-479EVEF,        04570000
004580       TS_UPDATE_479EVEF = :DCLDZEVEFTV.TS-UPDATE-479EVEF,        04580000
004590       ID_USERID_479EVEF = :DCLDZEVEFTV.ID-USERID-479EVEF         04590000
004600     WHERE                                                        04600000
004610       NR_ID_479EVEF = :DCLDZEVEFTV.NR-ID-479EVEF                 04610000
004620     QUERYNO 442                                                  04620000
004630     END-EXEC                                                     04630000
004640     EVALUATE SQLCODE                                             04640000
004650       WHEN 0                                                     04650000
004660            CONTINUE                                              04660000
004670       WHEN OTHER                                                 04670000
004680            DISPLAY 'ERROR ON UPDATE DZEVEFTV'                    04680000
004690            PERFORM SQLERROR                                      04690000
004700     END-EVALUATE                                                 04700000
004710     .                                                            04710000
004720     IF NOT SQLCODE = 0                                           04720000
004730        DISPLAY ' ** VMDZ1526 UPDATE CLÉ FORM **'                 04730000
004740        DISPLAY 'NR-ST:' NR-ST-FORM-AS OF VMDZ205I                04740000
004750               ' NS-DB:' NS-DB-STOCK-FORM-AS OF VMDZ205I          04750000
004760        CALL USERABEN                                             04760000
004770     END-IF.                                                      04770000
004780                                                                  04780000
004790 800-TEST-FFRECAB.                                                04790000
004800     DISPLAY '800-TEST-FFRECAB.'.                                 04800000
004810                                                                  04810000
004820 900-LEES-INFIL.                                                  04820000
004830     DISPLAY '900-LEES-INFIL.'.                                   04830000
004840     INITIALIZE VMDZ205I.                                         04840000
004850                                                                  04850000
004860     READ INFIL INTO VMDZ205I                                     04860000
004870        AT END SET VMDZ205I-EOF TO TRUE.                          04870000
004880                                                                  04880000
004890        IF VMDZ205I-NOT-EOF                                       04890000
004900           THEN                                                   04900000
004910           ADD +1 TO WS-TELLER                                    04910000
004920           ADD +1 TO WS-NB-INPUT-UPD-I                            04920000
004930           MOVE VMDZ205I TO WS-INPUT-KASBONS                      04930000
004940        END-IF.                                                   04940000
004950                                                                  04950000
004960 STOP01.                                                          04960000
004970     DISPLAY 'STOP01.'.                                           04970000
004980     DISPLAY '##&&VMDZ1526 - STOP01 : TE WEINIG REC OP INFIL'.    04980000
004990     CALL USERABEN.                                               04990000
005000                                                                  05000000
005010 IDMS-STOP.                                                       05010000
005020     DISPLAY 'IDMS-STOP.'.                                        05020000
005030*: ', LR-STATUS.                                                  05030000
005040*'##&&ERROR-STATUS : ', ERROR-STATUS.                             05040000
005050*'##&&DML-SEQUENCE : ', DML-SEQUENCE.                             05050000
005060     MOVE 'ROLLBACK' TO SQL-LOCATION.                             05060000
005070     EXEC SQL                                                     05070000
005080     ROLLBACK                                                     05080000
005090     END-EXEC.                                                    05090000
005100     CALL USERABEN.                                               05100000
005110                                                                  05110000
005120                                                                  05120000
005130 600-GET-TIMESTAMP.                                               05130000
005140     DISPLAY '600-GET-TIMESTAMP.'.                                05140000
005150     MOVE FUNCTION CURRENT-DATE TO TS-SYSTEM.                     05150000
005160     MOVE CC OF TS-SYSTEM       TO CC OF TS-TIMESTAMP             05160000
005170     MOVE YY OF TS-SYSTEM       TO YY OF TS-TIMESTAMP             05170000
005180     MOVE MM OF TS-SYSTEM       TO MM OF TS-TIMESTAMP             05180000
005190     MOVE DD OF TS-SYSTEM       TO DD OF TS-TIMESTAMP             05190000
005200     MOVE HH OF TS-SYSTEM       TO HH OF TS-TIMESTAMP             05200000
005210     MOVE MI OF TS-SYSTEM       TO MI OF TS-TIMESTAMP             05210000
005220     MOVE SS OF TS-SYSTEM       TO SS OF TS-TIMESTAMP             05220000
005230     MOVE TT OF TS-SYSTEM       TO TT OF TS-TIMESTAMP             05230000
005240     DISPLAY 'TIMESTAMP: ' TS-TIMESTAMP                           05240000
005250     .                                                            05250000
005260                                                                  05260000
005270*SQLERROR ROUTINE.                                                05270000
005280     EXEC SQL                                                     05280000
005290          INCLUDE SQLERROR                                        05290000
005300     END-EXEC.                                                    05300000
005310                                                                  05310000
005320 700-RESTART-CONTROL.                                             05320000
005330     DISPLAY '700-RESTART-CONTROL.'.                              05330000
005340     MOVE CS-PROGRAM TO NM-ID-RS-PROGRAM OF DCLDZ01RSTV.          05340000
005350     MOVE DA-DD-MM-CCYY   TO DA-CR-RS       OF DCLDZ01RSTV.       05350000
005360     MOVE 1     TO NB-ID-RS-PHASE      OF DCLDZ01RSTV.            05360000
005370                                                                  05370000
005380     PERFORM 700-SELECT-DZ01RSTV.                                 05380000
005390                                                                  05390000
005400     EVALUATE SQLCODE                                             05400000
005410       WHEN 0        PERFORM 710-JOB-IS-RESTART                   05410000
005420       WHEN 100 PERFORM 720-WRITE-RESTART-REC                     05420000
005430       WHEN OTHER               PERFORM SQLERROR                  05430000
005440     END-EVALUATE.                                                05440000
005450                                                                  05450000
005460     MOVE 0 TO WS-TELLER.                                         05460000
005470                                                                  05470000
005480 700-SELECT-DZ01RSTV.                                             05480000
005490     DISPLAY '700-SELECT-DZ01RSTV.'.                              05490000
005500                                                                  05500000
005510     MOVE 700 TO SQL-LOCATION                                     05510000
005520     EXEC SQL                                                     05520000
005530      SELECT NM_ID_RS_PROGRAM                                     05530000
005540           , NB_ID_RS_PHASE                                       05540000
005550           , DA_CR_RS                                             05550000
005560           , CO_ID_RS                                             05560000
005570           , NB_DAY_RS                                            05570000
005580           , TE_CH_RS_DATA                                        05580000
005590        INTO :DCLDZ01RSTV.NM-ID-RS-PROGRAM                        05590000
005600           , :DCLDZ01RSTV.NB-ID-RS-PHASE                          05600000
005610           , :DCLDZ01RSTV.DA-CR-RS                                05610000
005620           , :DCLDZ01RSTV.CO-ID-RS                                05620000
005630           , :DCLDZ01RSTV.NB-DAY-RS                               05630000
005640           , :DCLDZ01RSTV.TE-CH-RS-DATA                           05640000
005650        FROM DZ01RSTV                                             05650000
005660       WHERE NM_ID_RS_PROGRAM = :DCLDZ01RSTV.NM-ID-RS-PROGRAM     05660000
005670         AND NB_ID_RS_PHASE = :DCLDZ01RSTV.NB-ID-RS-PHASE         05670000
005680         AND DA_CR_RS = :DCLDZ01RSTV.DA-CR-RS                     05680000
005690      QUERYNO 376                                                 05690000
005700     END-EXEC                                                     05700000
005710                                                                  05710000
005720     EVALUATE SQLCODE                                             05720000
005730       WHEN 0                                                     05730000
005740       WHEN 100                                                   05740000
005750            CONTINUE                                              05750000
005760       WHEN OTHER                                                 05760000
005770            DISPLAY 'ERROR ON SELECT DZ01RSTV'                    05770000
005780            PERFORM SQLERROR                                      05780000
005790     END-EVALUATE                                                 05790000
005800     .                                                            05800000
005810                                                                  05810000
005820 700-UPDATE-DZ01RSTV.                                             05820000
005830     DISPLAY '700-UPDATE-DZ01RSTV.'.                              05830000
005840                                                                  05840000
005850     MOVE 700 TO SQL-LOCATION                                     05850000
005860     EXEC SQL                                                     05860000
005870      UPDATE DZ01RSTV                                             05870000
005880         SET TE_CH_RS_DATA = :DCLDZ01RSTV.TE-CH-RS-DATA           05880000
005890           , CO_ID_RS = :DCLDZ01RSTV.CO-ID-RS                     05890000
005900       WHERE NM_ID_RS_PROGRAM = :DCLDZ01RSTV.NM-ID-RS-PROGRAM     05900000
005910         AND NB_ID_RS_PHASE = :DCLDZ01RSTV.NB-ID-RS-PHASE         05910000
005920         AND DA_CR_RS = :DCLDZ01RSTV.DA-CR-RS                     05920000
005930      QUERYNO 398                                                 05930000
005940     END-EXEC                                                     05940000
005950                                                                  05950000
005960     EVALUATE SQLCODE                                             05960000
005970       WHEN 0                                                     05970000
005980            CONTINUE                                              05980000
005990       WHEN OTHER                                                 05990000
006000            DISPLAY 'ERROR ON UPDATE DZ01RSTV'                    06000000
006010            PERFORM SQLERROR                                      06010000
006020     END-EVALUATE                                                 06020000
006030     .                                                            06030000
006040                                                                  06040000
006050 700-INSERT-DZ01RSTV.                                             06050000
006060     DISPLAY '700-INSERT-DZ01RSTV.'.                              06060000
006070                                                                  06070000
006080     MOVE 700 TO SQL-LOCATION                                     06080000
006090     EXEC SQL                                                     06090000
006100      INSERT INTO DZ01RSTV                                        06100000
006110             VALUES (:DCLDZ01RSTV)                                06110000
006120     END-EXEC                                                     06120000
006130                                                                  06130000
006140     EVALUATE SQLCODE                                             06140000
006150       WHEN 0                                                     06150000
006160            CONTINUE                                              06160000
006170       WHEN OTHER                                                 06170000
006180            DISPLAY 'ERROR ON INSERT DZ01RSTV'                    06180000
006190            PERFORM SQLERROR                                      06190000
006200     END-EVALUATE                                                 06200000
006210     .                                                            06210000
006220                                                                  06220000
006230 710-JOB-IS-RESTART.                                              06230000
006240     DISPLAY '710-JOB-IS-RESTART.'.                               06240000
006250     MOVE TE-CH-RS-DATA-TEXT OF DCLDZ01RSTV                       06250000
006260       TO WS-RESTART-REC.                                         06260000
006270                                                                  06270000
006280     IF CO-ID-RS OF DCLDZ01RSTV = '1'                             06280000
006290        THEN DISPLAY ' PREVIOUS RUN COMPLETE '                    06290000
006300        PERFORM 810000-CALL-USERABEN                              06300000
006310     ELSE PERFORM NB-READ OF WS-RESTART-REC TIMES                 06310000
006320        PERFORM 900-LEES-INFIL                                    06320000
006330        MOVE NB-READ OF WS-RESTART-REC                            06330000
006340            TO WS-NB-INPUT-UPD-I                                  06340000
006350     END-PERFORM                                                  06350000
006360     END-IF.                                                      06360000
006370                                                                  06370000
006380 720-WRITE-RESTART-REC.                                           06380000
006390     DISPLAY '720-WRITE-RESTART-REC.'.                            06390000
006400     MOVE '0' TO CO-ID-RS    OF DCLDZ01RSTV.                      06400000
006410     MOVE 7      TO NB-DAY-RS OF DCLDZ01RSTV.                     06410000
006420     MOVE 0                     TO WS-NB-INPUT-UPD-I.             06420000
006430     MOVE WS-NB-INPUT-UPD-I       TO NB-READ OF WS-RESTART-REC.   06430000
006440     INITIALIZE KY-RESTART.                                       06440000
006450     MOVE 1215                                                    06450000
006460       TO TE-CH-RS-DATA-LEN OF DCLDZ01RSTV.                       06460000
006470     MOVE WS-RESTART-REC                                          06470000
006480       TO TE-CH-RS-DATA-TEXT   OF DCLDZ01RSTV.                    06480000
006490                                                                  06490000
006500     PERFORM 700-INSERT-DZ01RSTV.                                 06500000
006510                                                                  06510000
006520 800-PROCESS-COMMIT.                                              06520000
006530     DISPLAY '800-PROCESS-COMMIT.'.                               06530000
006540     MOVE 0               TO WS-TELLER.                           06540000
006550     MOVE WS-NB-INPUT-UPD-I TO NB-READ  OF WS-RESTART-REC.        06550000
006560     MOVE WS-INPUT-KASBONS                                        06560000
006570       TO KY-RESTART OF WS-RESTART-REC.                           06570000
006580                                                                  06580000
006590     IF VMDZ205I-EOF                                              06590000
006600        THEN MOVE '1'   TO CO-ID-RS OF DCLDZ01RSTV                06600000
006610     ELSE MOVE '0' TO CO-ID-RS OF DCLDZ01RSTV                     06610000
006620     END-IF.                                                      06620000
006630                                                                  06630000
006640     MOVE 15                                                      06640000
006650       TO TE-CH-RS-DATA-LEN OF DCLDZ01RSTV.                       06650000
006660     MOVE WS-RESTART-REC                                          06660000
006670       TO TE-CH-RS-DATA-TEXT   OF DCLDZ01RSTV.                    06670000
006680                                                                  06680000
006690     PERFORM 700-UPDATE-DZ01RSTV.                                 06690000
006700                                                                  06700000
006710     MOVE 800 TO SQL-LOCATION                                     06710000
006720     EXEC SQL                                                     06720000
006730      COMMIT                                                      06730000
006740     END-EXEC.                                                    06740000
006750                                                                  06750000
006760     EVALUATE SQLCODE                                             06760000
006770       WHEN 0                                                     06770000
006780            CONTINUE                                              06780000
006790       WHEN OTHER                                                 06790000
006800            DISPLAY 'ERROR REC NUMBER : ' WS-NB-INPUT-UPD-I       06800000
006810            PERFORM SQLERROR                                      06810000
006820     END-EVALUATE.                                                06820000
006830                                                                  06830000
006840 810000-CALL-USERABEN.                                            06840000
006850     DISPLAY '810000-CALL-USERABEN.'.                             06850000
006860     CALL USERABEN.                                               06860000
