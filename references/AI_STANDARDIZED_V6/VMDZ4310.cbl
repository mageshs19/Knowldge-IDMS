000010 CBL ARITH(EXTEND)                                                00010000
000020 IDENTIFICATION DIVISION.                                         00020000
000030*========================                                         00030000
000040 PROGRAM-ID. VMDZ4310.                                            00040000
000050                                                                  00050000
000060 AUTHOR. JAINRG 2026/04.                                          00060000
000070******************************************************************00070000
000080*  THIS PROGRAM IS BEING USED FOR "EXTRACTING EVENTS DATA FOR     00080000
000090*  MONTHLY CHANGES" BY FETCH THE DATA FROM THE FOLLOWING (2)      00090000
000100*  KASBONS DB2 TABLES BY USING THE INPUT KASBONS DATA:            00100000
000110*  DZBEFFTB & DZEVEFTB                                            00110000
000120******************************************************************00120000
000130                                                                  00130000
000140 ENVIRONMENT DIVISION.                                            00140000
000150*=====================                                            00150000
000160 CONFIGURATION SECTION.                                           00160000
000170*----------------------                                           00170000
000180 SOURCE-COMPUTER. ES9000.                                         00180000
000190 OBJECT-COMPUTER. ES9000.                                         00190000
000200 SPECIAL-NAMES.                                                   00200000
000210     DECIMAL-POINT IS COMMA.                                      00210000
000220                                                                  00220000
000230 INPUT-OUTPUT SECTION.                                            00230000
000240*---------------------                                            00240000
000250 FILE-CONTROL.                                                    00250000
000260     SELECT FI-MUTATIES         ASSIGN TO UT-S-DD010.             00260000
000270     SELECT FO-MUTATIES         ASSIGN TO UT-S-DD100.             00270000
000280                                                                  00280000
000290 DATA DIVISION.                                                   00290000
000300*==============                                                   00300000
000310                                                                  00310000
000320 FILE SECTION.                                                    00320000
000330*-------------                                                    00330000
000340 FD  FI-MUTATIES                                                  00340000
000350     LABEL RECORD IS STANDARD                                     00350000
000360     RECORDING F                                                  00360000
000370     BLOCK CONTAINS 0.                                            00370000
000380 01  FI-MUTATIES-REC          PIC  X(21).                         00380000
000390*                                                                 00390000
000400 FD  FO-MUTATIES                                                  00400000
000410     LABEL RECORD IS STANDARD                                     00410000
000420     RECORDING F                                                  00420000
000430     BLOCK CONTAINS 0.                                            00430000
000440 01  FO-MUTATIES-REC            PIC  X(1500).                     00440000
000450*                                                                 00450000
000460 WORKING-STORAGE SECTION.                                         00460000
000470*------------------------                                         00470000
000480* -- DATE PARM --                                                 00480000
000490*01  W-DATE              PIC 9(8).                                00490000
000500*01  W-DATE-X REDEFINES W-DATE.                                   00500000
000510*    05  W-DATE-Y        PIC 9(4).                                00510000
000520*    05  W-DATE-M        PIC 9(2).                                00520000
000530*    05  W-DATE-D        PIC 9(2).                                00530000
000540                                                                  00540000
000550 01  VOLGNUMMER                   PIC 9(07) VALUE ZEROES.         00550000
000560                                                                  00560000
000570 01  WS-VAR.                                                      00570000
000580   02  WS-NR-ISSUE.                                               00580000
000590       03  WS-NR-ID-ISSUE         PIC X(7).                       00590000
000600       03  WS-NR-CD-ISSUE         PIC X(2).                       00600000
000610                                                                  00610000
000620* -- CLE DU FORMULAIRE --                                         00620000
000630   02  WS-NR-ID-GOOD.                                             00630000
000640       03  WS-NR-CIO              PIC 9(8).                       00640000
000650       03  WS-DA-CREA             PIC 9(8).                       00650000
000660       03  WS-NR-ID               PIC 9(6).                       00660000
000670       03  WS-CT-OPD              PIC 999.                        00670000
000680       03  WS-CT-OPG              PIC 999.                        00680000
000690       03  FILLER                 PIC XX.                         00690000
000700                                                                  00700000
000710   02  WS-MUTATIES.                                               00710000
000720       03 WS-IN-NR-TIT-BC         PIC X(13).                      00720000
000730       03 WS-NR-SUITE             PIC X(2).                       00730000
000740       03 WS-OLD-CI               PIC X(6).                       00740000
000750   02  WS-TOTAL-INPUT             PIC S9(11) COMP-3 VALUE +0.     00750000
000760   02  WS-COUNT-TREATED           PIC 9(15) VALUE ZEROES.         00760000
000770  02  WS-NB-OUTPUT-COUNT         PIC 9(7) COMP-3 VALUE ZEROES.    00770000
000780                                                                  00780000
000790                                                                  00790000
000800* ----- USERABEN -----                                            00800000
000810 01  USERABEN                     PIC X(8) VALUE 'USERABEN'.      00810000
000820 01  CS-PROGRAM                  PIC X(8) VALUE 'VMDZ4310'.       00820000
000830 01  HELP-VAR.                                                    00830000
000840   02  HELP-NR-CIO-FORM-AS.                                       00840000
000850     03 HELP-NR-CIO-FORM-AS-1POS  PIC X(1).                       00850000
000860     03 HELP-NR-CIO-FORM-AS-26POS PIC X(5).                       00860000
000870   02  HELP-NR-ID-STOCK-CD        PIC 9(13) VALUE 0.              00870000
000880   02  HELP-NR-ID-STOCK-CD-P13-R REDEFINES HELP-NR-ID-STOCK-CD.   00880000
000890     03 HELP-NR-ID-STOCK-CD-112POS  PIC X(12).                    00890000
000900     03 HELP-NR-ID-STOCK-CD-13POS   PIC 9(1).                     00900000
000910 01  WS-TIMESTAMP-FIELDS.                                         00910000
000920     05 TS-SYSTEM.                                                00920000
000930        10  DA-SYS.                                               00930000
000940            15  DA-SYS-CCYY.                                      00940000
000950                20  CC            PIC X(2).                       00950000
000960                20  YY            PIC X(2).                       00960000
000970            15  MM                PIC X(2).                       00970000
000980            15  DD                PIC X(2).                       00980000
000990        10  HR-SYS.                                               00990000
001000            15  HH                PIC X(2).                       01000000
001010            15  MI                PIC X(2).                       01010000
001020            15  SS                PIC X(2).                       01020000
001030            15  TT                PIC X(2).                       01030000
001040     05 TS-TIMESTAMP.                                             01040000
001050        10  CC                    PIC X(2).                       01050000
001060        10  YY                    PIC X(2).                       01060000
001070        10  TE-MARKER1            PIC X             VALUE '-'.    01070000
001080        10  MM                    PIC X(2).                       01080000
001090        10  TE-MARKER2            PIC X             VALUE '-'.    01090000
001100        10  DD                    PIC X(2).                       01100000
001110        10  TE-MARKER3            PIC X             VALUE '-'.    01110000
001120        10  HH                    PIC X(2).                       01120000
001130        10  TE-MARKER4            PIC X             VALUE '.'.    01130000
001140        10  MI                    PIC X(2).                       01140000
001150        10  TE-MARKER5            PIC X             VALUE '.'.    01150000
001160        10  SS                    PIC X(2).                       01160000
001170        10  TE-MARKER6            PIC X             VALUE '.'.    01170000
001180        10  TT                    PIC X(2).                       01180000
001190        10  NNNN                  PIC 9(04)         VALUE 0.      01190000
001200 01 WS-DATUMVELDEN.                                               01200000
001210    03  DA-YYMMDD.                                                01210000
001220        05  YY                   PIC 99       VALUE ZERO.         01220000
001230        05  MM                   PIC 99       VALUE ZERO.         01230000
001240        05  DD                   PIC 99       VALUE ZERO.         01240000
001250    03  DA-DDMMCCYY.                                              01250000
001260        05  DD                   PIC 99       VALUE ZERO.         01260000
001270        05  MM                   PIC 99       VALUE ZERO.         01270000
001280        05  CC                   PIC 99       VALUE ZERO.         01280000
001290        05  YY                   PIC 99       VALUE ZERO.         01290000
001300    03  DA-CCYYMMDD.                                              01300000
001310        05  CC                   PIC 99       VALUE ZERO.         01310000
001320        05  YY                   PIC 99       VALUE ZERO.         01320000
001330        05  MM                   PIC 99       VALUE ZERO.         01330000
001340        05  DD                   PIC 99       VALUE ZERO.         01340000
001350    03  DA-CCYYMMDD-R REDEFINES DA-CCYYMMDD.                      01350000
001360        05  CCYY                 PIC 9999.                        01360000
001370        05  MM                   PIC 99.                          01370000
001380        05  DD                   PIC 99.                          01380000
001390    03  DA-DD-MM-CCYY.                                            01390000
001400        05  DD                   PIC 9(02).                       01400000
001410        05  TE-MARKER5           PIC X        VALUE '.'.          01410000
001420        05  MM                   PIC 9(02).                       01420000
001430        05  TE-MARKER6           PIC X        VALUE '.'.          01430000
001440        05  CCYY                 PIC 9(04).                       01440000
001450                                                                  01450000
001460*---------------------------------------------------------------* 01460000
001470*--- COPYBOOKS                                                    01470000
001480*---------------------------------------------------------------* 01480000
001490     COPY VMDZ510I.                                               01490000
001500                                                                  01500000
001510*    COPY VMDZ05.                                                 01510000
001520                                                                  01520000
001530*---------------------------------------------------------------* 01530000
001540*--- SWITCHES                                                     01540000
001550*---------------------------------------------------------------* 01550000
001560 01  SW-MUTATIES-EOF            PIC X.                            01560000
001570     88 MUTATIES-NOT-EOF                  VALUE 'N'.              01570000
001580     88 MUTATIES-EOF                      VALUE 'Y'.              01580000
001590                                                                  01590000
001600     EXEC SQL INCLUDE SQLERRWS END-EXEC.                          01600000
001610     EXEC SQL INCLUDE SQLCA    END-EXEC.                          01610000
001620     EXEC SQL INCLUDE DZEVEFTV END-EXEC.                          01620000
001630     EXEC SQL INCLUDE DZBEFFTV END-EXEC.                          01630000
001640                                                                  01640000
001650 LINKAGE SECTION.                                                 01650000
001660*----------------                                                 01660000
001670 01  LS-PARM-INPUT.                                               01670000
001680     02  LS-PARM                PIC S9(004) COMP.                 01680000
001690     02  LS-PARAM-IND           PIC X.                            01690000
001700     02  LS-DATE8               PIC  9(008).                      01700000
001710                                                                  01710000
001720                                                                  01720000
001730 PROCEDURE DIVISION USING LS-PARM-INPUT.                          01730000
001740*=======================================                          01740000
001750 0000-MAIN-PROCEDURE.                                             01750000
001760     PERFORM 1000-INITIALIZE-PROGRAM.                             01760000
001770     PERFORM 2000-PROCESS-PROGRAM.                                01770000
001780     PERFORM 3000-FINALIZE-PROGRAM.                               01780000
001790     STOP RUN.                                                    01790000
001800 1000-INITIALIZE-PROGRAM.                                         01800000
001810     PERFORM 1000-INIT-TREATMENT.                                 01810000
001820 2000-PROCESS-PROGRAM.                                            01820000
001830     PERFORM 2000-TREAT-MUTATIES UNTIL MUTATIES-EOF.              01830000
001840 3000-FINALIZE-PROGRAM.                                           01840000
001850     PERFORM 3000-END-TREATMENT.                                  01850000
001860                                                                  01860000
001870     DISPLAY 'TOTAL OUTPUT RECORDS : ' WS-NB-OUTPUT-COUNT.        01870000
001880 1000-INIT-TREATMENT.                                             01880000
001890*---------------                                                  01890000
001900     MOVE CS-PROGRAM TO PROGRAM-NAME                              01900000
001910     PERFORM 1100-GET-TIMESTAMP                                   01910000
001920     OPEN INPUT  FI-MUTATIES                                      01920000
001930          OUTPUT FO-MUTATIES                                      01930000
001940     SET MUTATIES-NOT-EOF TO TRUE.                                01940000
001950                                                                  01950000
001960     PERFORM 1200-READ-MUTATIES                                   01960000
001970     .                                                            01970000
001980                                                                  01980000
001990*----------------------------------------------------------------*01990000
002000 3000-END-TREATMENT.                                              02000000
002010*--------------                                                   02010000
002020                                                                  02020000
002030     CLOSE FI-MUTATIES                                            02030000
002040           FO-MUTATIES                                            02040000
002050                                                                  02050000
002060     DISPLAY '# TREATED    = ' WS-COUNT-TREATED                   02060000
002070     DISPLAY 'TOTAL INPUTS ='  WS-TOTAL-INPUT                     02070000
002080     .                                                            02080000
002090                                                                  02090000
002100*----------------------------------------------------------------*02100000
002110 2000-TREAT-MUTATIES.                                             02110000
002120*--------------                                                   02120000
002130     PERFORM 2100-SEARCH-MUTATIES.                                02130000
002140     PERFORM 2200-MOVE-MUTATIES.                                  02140000
002150     PERFORM 2300-WRITE-MUTATIES.                                 02150000
002160     PERFORM 1200-READ-MUTATIES                                   02160000
002170     .                                                            02170000
002180                                                                  02180000
002190*----------------------------------------------------------------*02190000
002200 2100-SEARCH-MUTATIES.                                            02200000
002210*---------------                                                  02210000
002220     INITIALIZE DCLDZEVEFTV.                                      02220000
002230     INITIALIZE DCLDZBEFFTV.                                      02230000
002240     INITIALIZE HELP-VAR.                                         02240000
002250     MOVE '1002'                     TO CT-RKTPROD-479BEFF        02250000
002260                                   OF DCLDZBEFFTV.                02260000
002270     MOVE WS-IN-NR-TIT-BC            TO HELP-NR-ID-STOCK-CD.      02270000
002280     MOVE HELP-NR-ID-STOCK-CD-112POS TO NR-IDSTOCK-479BEFF        02280000
002290                                   OF DCLDZBEFFTV.                02290000
002300     MOVE HELP-NR-ID-STOCK-CD-13POS  TO NR-CDSTK-479BEFF          02300000
002310                                   OF DCLDZBEFFTV.                02310000
002320     MOVE WS-NR-SUITE                TO NS-DBSTK-479BEFF          02320000
002330                                   OF DCLDZBEFFTV.                02330000
002340     MOVE 2101 TO SQL-LOCATION.                                   02340000
002350     EXEC SQL                                                     02350000
002360       SELECT NR_IDISSUE_479BEFF,                                 02360000
002370              NR_CDISSUE_479BEFF,                                 02370000
002380              AM_CNSTK_479BEFF,                                   02380000
002390              NR_IDSTOCK_479BEFF,                                 02390000
002400              NS_DBSTK_479BEFF,                                   02400000
002410              NX_CPCRESK_479BEFF,                                 02410000
002420              AM_INTERSK_479BEFF,                                 02420000
002430              CO_IDPRKSK_479BEFF,                                 02430000
002440              NS_IRMOSTK_479BEFF,                                 02440000
002450              DA_UBSECIS_479BEFF,                                 02450000
002460              NX_CPCRESK_479BEFF,                                 02460000
002470              NX_CPAIDSK_479BEFF                                  02470000
002480         INTO :DCLDZBEFFTV.NR-IDISSUE-479BEFF,                    02480000
002490              :DCLDZBEFFTV.NR-CDISSUE-479BEFF,                    02490000
002500              :DCLDZBEFFTV.AM-CNSTK-479BEFF,                      02500000
002510              :DCLDZBEFFTV.NR-IDSTOCK-479BEFF,                    02510000
002520              :DCLDZBEFFTV.NS-DBSTK-479BEFF,                      02520000
002530              :DCLDZBEFFTV.NX-CPCRESK-479BEFF,                    02530000
002540              :DCLDZBEFFTV.AM-INTERSK-479BEFF,                    02540000
002550              :DCLDZBEFFTV.CO-IDPRKSK-479BEFF,                    02550000
002560              :DCLDZBEFFTV.NS-IRMOSTK-479BEFF,                    02560000
002570              :DCLDZBEFFTV.DA-UBSECIS-479BEFF,                    02570000
002580              :DCLDZBEFFTV.NX-CPCRESK-479BEFF,                    02580000
002590              :DCLDZBEFFTV.NX-CPAIDSK-479BEFF                     02590000
002600         FROM DZBEFFTV                                            02600000
002610       WHERE CT_RKTPROD_479BEFF = :DCLDZBEFFTV.CT-RKTPROD-479BEFF 02610000
002620         AND NR_IDSTOCK_479BEFF = :DCLDZBEFFTV.NR-IDSTOCK-479BEFF 02620000
002630         AND NR_CDSTK_479BEFF   = :DCLDZBEFFTV.NR-CDSTK-479BEFF   02630000
002640         AND NS_DBSTK_479BEFF   = :DCLDZBEFFTV.NS-DBSTK-479BEFF   02640000
002650       QUERYNO 271                                                02650000
002660     END-EXEC                                                     02660000
002670*                                                                 02670000
002680     EVALUATE SQLCODE                                             02680000
002690     WHEN 0                                                       02690000
002700          CONTINUE                                                02700000
002710     WHEN 100                                                     02710000
002720          DISPLAY 'NO DATA FOUND FOR SELECT DZBEFFTV'             02720000
002730          DISPLAY 'CT-RKTPROD-479BEFF :' CT-RKTPROD-479BEFF       02730000
002740                                        OF DCLDZBEFFTV            02740000
002750                  'NR-IDSTOCK-479BEFF :' NR-IDSTOCK-479BEFF       02750000
002760                                        OF DCLDZBEFFTV            02760000
002770                  'NR-CDSTK-479BEFF   :' NR-CDSTK-479BEFF         02770000
002780                                        OF DCLDZBEFFTV            02780000
002790                  'NS-DBSTK-479BEFF   :' NS-DBSTK-479BEFF         02790000
002800                                        OF DCLDZBEFFTV            02800000
002810          PERFORM SQLERROR                                        02810000
002820     WHEN OTHER                                                   02820000
002830          DISPLAY 'CT-RKTPROD-479BEFF :' CT-RKTPROD-479BEFF       02830000
002840                                        OF DCLDZBEFFTV            02840000
002850                  'NR-IDSTOCK-479BEFF :' NR-IDSTOCK-479BEFF       02850000
002860                                        OF DCLDZBEFFTV            02860000
002870                  'NR-CDSTK-479BEFF   :' NR-CDSTK-479BEFF         02870000
002880                                        OF DCLDZBEFFTV            02880000
002890                  'NS-DBSTK-479BEFF   :' NS-DBSTK-479BEFF         02890000
002900                                        OF DCLDZBEFFTV            02900000
002910          PERFORM SQLERROR                                        02910000
002920     END-EVALUATE                                                 02920000
002930     .                                                            02930000
002940     MOVE 2100 TO SQL-LOCATION.                                   02940000
002950     MOVE '1002'                     TO CT-RKTPROD-479BEFF        02950000
002960                                   OF DCLDZEVEFTV.                02960000
002970     MOVE WS-IN-NR-TIT-BC            TO HELP-NR-ID-STOCK-CD.      02970000
002980     MOVE HELP-NR-ID-STOCK-CD-112POS TO NR-IDSTOCK-479BEFF        02980000
002990                                   OF DCLDZEVEFTV.                02990000
003000     MOVE HELP-NR-ID-STOCK-CD-13POS  TO NR-CDSTK-479BEFF          03000000
003010                                   OF DCLDZEVEFTV.                03010000
003020     MOVE WS-NR-SUITE                TO NS-DBSTK-479BEFF          03020000
003030                                   OF DCLDZEVEFTV.                03030000
003040     MOVE '0092'                     TO CT-RKTEVPR-479EVEF        03040000
003050                                   OF DCLDZEVEFTV.                03050000
003060     EXEC SQL                                                     03060000
003070       SELECT NR_IDGOOD_479EVEF,                                  03070000
003080              NR_CI1POS_479EVEF,                                  03080000
003090              NR_CI26POS_479EVEF,                                 03090000
003100              DA_CREVTPD_479EVEF                                  03100000
003110         INTO :DCLDZEVEFTV.NR-IDGOOD-479EVEF,                     03110000
003120              :DCLDZEVEFTV.NR-CI1POS-479EVEF,                     03120000
003130              :DCLDZEVEFTV.NR-CI26POS-479EVEF,                    03130000
003140              :DCLDZEVEFTV.DA-CREVTPD-479EVEF                     03140000
003150         FROM DZEVEFTV                                            03150000
003160       WHERE CT_RKTPROD_479BEFF = :DCLDZEVEFTV.CT-RKTPROD-479BEFF 03160000
003170         AND NR_IDSTOCK_479BEFF = :DCLDZEVEFTV.NR-IDSTOCK-479BEFF 03170000
003180         AND NS_DBSTK_479BEFF   = :DCLDZEVEFTV.NS-DBSTK-479BEFF   03180000
003190         AND NR_CDSTK_479BEFF   = :DCLDZEVEFTV.NR-CDSTK-479BEFF   03190000
003200         AND CT_RKTEVPR_479EVEF = :DCLDZEVEFTV.CT-RKTEVPR-479EVEF 03200000
003210       ORDER BY NR_ID_479EVEF  DESC                               03210000
003220       FETCH FIRST ROW ONLY                                       03220000
003230       QUERYNO 234                                                03230000
003240     END-EXEC                                                     03240000
003250                                                                  03250000
003260     EVALUATE SQLCODE                                             03260000
003270         WHEN 0                                                   03270000
003280              CONTINUE                                            03280000
003290         WHEN 100                                                 03290000
003300              DISPLAY 'NO DATA FOUND FOR SELECT DZEVEFTV'         03300000
003310              DISPLAY 'CT-RKTPROD-479BEFF: ' CT-RKTPROD-479BEFF   03310000
003320                                            OF DCLDZEVEFTV        03320000
003330              DISPLAY 'NR-IDSTOCK-479BEFF: ' NR-IDSTOCK-479BEFF   03330000
003340                                            OF DCLDZEVEFTV        03340000
003350              DISPLAY 'NS-DBSTK-479BEFF  : ' NS-DBSTK-479BEFF     03350000
003360                                            OF DCLDZEVEFTV        03360000
003370              DISPLAY 'NR-CDSTK-479BEFF  : ' NR-CDSTK-479BEFF     03370000
003380                                            OF DCLDZEVEFTV        03380000
003390              PERFORM SQLERROR                                    03390000
003400         WHEN OTHER                                               03400000
003410              DISPLAY 'CT-RKTPROD-479BEFF: ' CT-RKTPROD-479BEFF   03410000
003420                                            OF DCLDZEVEFTV        03420000
003430              DISPLAY 'NR-IDSTOCK-479BEFF: ' NR-IDSTOCK-479BEFF   03430000
003440                                            OF DCLDZEVEFTV        03440000
003450              DISPLAY 'NS-DBSTK-479BEFF  : ' NS-DBSTK-479BEFF     03450000
003460                                            OF DCLDZEVEFTV        03460000
003470              DISPLAY 'NR-CDSTK-479BEFF  : ' NR-CDSTK-479BEFF     03470000
003480                                            OF DCLDZEVEFTV        03480000
003490              PERFORM SQLERROR                                    03490000
003500     END-EVALUATE                                                 03500000
003510     .                                                            03510000
003520                                                                  03520000
003530*----------------------------------------------------------------*03530000
003540 2200-MOVE-MUTATIES.                                              03540000
003550*-------------                                                    03550000
003560     INITIALIZE VMDZ510I                                          03560000
003570      REPLACING ALPHANUMERIC BY SPACES                            03570000
003580                     NUMERIC BY ZEROES.                           03580000
003590      INITIALIZE WS-NR-ID-GOOD                                    03590000
003600                 WS-NR-ISSUE.                                     03600000
003610     MOVE NR-IDGOOD-479EVEF   OF DCLDZEVEFTV TO WS-NR-ID-GOOD.    03610000
003620     MOVE NR-CI1POS-479EVEF   OF DCLDZEVEFTV TO                   03620000
003630                                   HELP-NR-CIO-FORM-AS-1POS.      03630000
003640     MOVE NR-CI26POS-479EVEF  OF DCLDZEVEFTV TO                   03640000
003650                                   HELP-NR-CIO-FORM-AS-26POS.     03650000
003660     MOVE HELP-NR-CIO-FORM-AS TO NR-CIO-FORM-AS    OF VMDZ510I.   03660000
003670     MOVE WS-DA-CREA          TO DA-CREA-FORM-AS-R OF VMDZ510I.   03670000
003680     STRING DA-CR-FORM-AS-Y                        OF VMDZ510I '-'03680000
003690            DA-CR-FORM-AS-M                        OF VMDZ510I '-'03690000
003700            DA-CR-FORM-AS-D                        OF VMDZ510I '-'03700000
003710            '01.01.01.000001'                                     03710000
003720            DELIMITED BY SIZE                                     03720000
003730       INTO TS-CREA-OORD                           OF VMDZ510I.   03730000
003740     MOVE WS-NR-ID                                                03740000
003750       TO NR-ID-FORM-AS                            OF VMDZ510I.   03750000
003760     MOVE WS-CT-OPG                                               03760000
003770       TO CT-OPG-FORM-AS-R                         OF VMDZ510I.   03770000
003780     MOVE WS-CT-OPD                                               03780000
003790       TO CT-OPD-FORM-AS-R                         OF VMDZ510I.   03790000
003800                                                                  03800000
003810     MOVE NR-IDISSUE-479BEFF OF DCLDZBEFFTV TO WS-NR-ID-ISSUE.    03810000
003820     MOVE NR-CDISSUE-479BEFF OF DCLDZBEFFTV TO WS-NR-CD-ISSUE.    03820000
003830     MOVE WS-NR-ISSUE        TO NR-ISSUIN-OORD     OF VMDZ510I.   03830000
003840     MOVE AM-CNSTK-479BEFF                         OF DCLDZBEFFTV 03840000
003850       TO AM-CNS-FORM-AS                           OF VMDZ510I.   03850000
003860     MOVE NR-IDSTOCK-479BEFF                       OF DCLDZBEFFTV 03860000
003870       TO HELP-NR-ID-STOCK-CD-112POS                              03870000
003880     MOVE NR-CDSTK-479BEFF                         OF DCLDZBEFFTV 03880000
003890       TO HELP-NR-ID-STOCK-CD-13POS                               03890000
003900     MOVE HELP-NR-ID-STOCK-CD TO NR-ST-FORM-AS-R   OF VMDZ510I.   03900000
003910                                                                  03910000
003920     MOVE HELP-NR-ID-STOCK-CD TO NR-STIN-OORD      OF VMDZ510I.   03920000
003930                                                                  03930000
003940     MOVE NS-DBSTK-479BEFF                         OF DCLDZBEFFTV 03940000
003950       TO NS-DBST-OORD                             OF VMDZ510I.   03950000
003960     IF NX-CPCRESK-479BEFF OF DCLDZBEFFTV = 0                     03960000
003970       MOVE AM-CNDSTK-479BEFF                      OF DCLDZBEFFTV 03970000
003980         TO AM-CND-FORM-AS                         OF VMDZ510I    03980000
003990     ELSE                                                         03990000
004000       MOVE AM-INTERSK-479BEFF                     OF DCLDZBEFFTV 04000000
004010         TO AM-INTER-FORM-AS                       OF VMDZ510I    04010000
004020     END-IF.                                                      04020000
004030     MOVE CO-IDPRKSK-479BEFF                       OF DCLDZBEFFTV 04030000
004040       TO NR-ID-040SECU                            OF VMDZ510I.   04040000
004050     MOVE NS-IRMOSTK-479BEFF                       OF DCLDZBEFFTV 04050000
004060       TO NS-SEQ-040IRMO                           OF VMDZ510I.   04060000
004070     MOVE DA-UBSECIS-479BEFF OF DCLDZBEFFTV  TO DA-DD-MM-CCYY     04070000
004080     EVALUATE TRUE                                                04080000
004090      WHEN DA-DD-MM-CCYY = '01.01.0001'                           04090000
004100           MOVE ZEROES      TO DA-CCYYMMDD-R                      04100000
004110      WHEN DA-DD-MM-CCYY = '31.12.9999'                           04110000
004120           MOVE '99999999'  TO DA-CCYYMMDD-R                      04120000
004130      WHEN OTHER                                                  04130000
004140           MOVE CCYY OF DA-DD-MM-CCYY TO CCYY OF DA-CCYYMMDD-R    04140000
004150           MOVE MM   OF DA-DD-MM-CCYY TO MM   OF DA-CCYYMMDD-R    04150000
004160           MOVE DD   OF DA-DD-MM-CCYY TO DD   OF DA-CCYYMMDD-R    04160000
004170     END-EVALUATE                                                 04170000
004180      MOVE DA-CCYYMMDD-R TO DA-UB-FORM-AS OF VMDZ510I.            04180000
004190     MOVE DA-CREVTPD-479EVEF OF DCLDZEVEFTV  TO DA-DD-MM-CCYY     04190000
004200     EVALUATE TRUE                                                04200000
004210      WHEN DA-DD-MM-CCYY = '01.01.0001'                           04210000
004220           MOVE ZEROES      TO DA-CCYYMMDD-R                      04220000
004230      WHEN DA-DD-MM-CCYY = '31.12.9999'                           04230000
004240           MOVE '99999999'  TO DA-CCYYMMDD-R                      04240000
004250      WHEN OTHER                                                  04250000
004260           MOVE CCYY OF DA-DD-MM-CCYY TO CCYY OF DA-CCYYMMDD-R    04260000
004270           MOVE MM   OF DA-DD-MM-CCYY TO MM   OF DA-CCYYMMDD-R    04270000
004280           MOVE DD   OF DA-DD-MM-CCYY TO DD   OF DA-CCYYMMDD-R    04280000
004290     END-EVALUATE                                                 04290000
004300      MOVE DA-CCYYMMDD-R TO DA-COMPTABILISATION-OPER OF VMDZ510I. 04300000
004310      MOVE DA-CCYYMMDD-R TO DA-EXEC-OORD OF VMDZ510I.             04310000
004320     MOVE NX-CPCRESK-479BEFF                  OF DCLDZBEFFTV      04320000
004330       TO NS-RANK-COUP                        OF VMDZ510I.        04330000
004340     MOVE NX-CPAIDSK-479BEFF                  OF DCLDZBEFFTV      04340000
004350       TO NX-CPAID-STOCK                      OF VMDZ510I.        04350000
004360                                                                  04360000
004370* EXTRA ZONES OPVULLEN                                            04370000
004380                                                                  04380000
004390     EVALUATE WS-CT-OPD                                           04390000
004400       WHEN 00                                                    04400000
004410           MOVE 'MU' TO CO-TYPOPER-OORD OF VMDZ510I               04410000
004420       WHEN OTHER                                                 04420000
004430           MOVE '??' TO CO-TYPOPER-OORD OF VMDZ510I               04430000
004440           DISPLAY 'ABEND VERKEERDE CT-OPD = '                    04440000
004450                    WS-CT-OPD                                     04450000
004460           DISPLAY  DCLDZBEFFTV                                   04460000
004470           DISPLAY  DCLDZEVEFTV                                   04470000
004480           CALL USERABEN                                          04480000
004490     END-EVALUATE.                                                04490000
004500* UITGIFTE = SRW DUS '1'                                          04500000
004510     MOVE '1' TO CO-ISSUIN-OORD         OF VMDZ510I.              04510000
004520     MOVE 001 TO NB-ST-OORD             OF VMDZ510I.              04520000
004530* EFFECT = IKB = DEXIA DUS '1'                                    04530000
004540     MOVE '1' TO CO-STIN-OORD           OF VMDZ510I.              04540000
004550                                                                  04550000
004560     ADD 1    TO VOLGNUMMER.                                      04560000
004570     STRING 'CIR '                                                04570000
004580            CT-OPD-FORM-AS OF VMDZ510I ' '                        04580000
004590            VOLGNUMMER                                            04590000
004600            DELIMITED BY SIZE                                     04600000
004610       INTO NR-REFORD-OORD OF VMDZ510I.                           04610000
004620                                                                  04620000
004630* EXTRA'S ANNIE STEPPE                                            04630000
004640     STRING 'X'                                                   04640000
004650            '000000'                                              04650000
004660            '      '                                              04660000
004670            DELIMITED BY SIZE                                     04670000
004680       INTO NR-TRANS-OORD  OF VMDZ510I.                           04680000
004690* 10=AGENCY 11=ZETEL                                              04690000
004700       MOVE '10'    TO CO-TYPKAN2-OORD OF VMDZ510I                04700000
004710       MOVE 'DX'      TO CO-BANK-OORD    OF VMDZ510I.             04710000
004720                                                                  04720000
004730       MOVE WS-OLD-CI TO NR-CIINPTR-OORD OF VMDZ510I.             04730000
004740                                                                  04740000
004750*----------------------------------------------------------------*04750000
004760 2300-WRITE-MUTATIES.                                             04760000
004770*--------------                                                   04770000
004780       ADD 1        TO WS-COUNT-TREATED                           04780000
004790       WRITE FO-MUTATIES-REC FROM VMDZ510I                        04790000
004800     ADD 1 TO WS-NB-OUTPUT-COUNT                                  04800000
004810     .                                                            04810000
004820                                                                  04820000
004830*----------------------------------------------------------------*04830000
004840 1200-READ-MUTATIES.                                              04840000
004850*-------------                                                    04850000
004860     INITIALIZE WS-MUTATIES                                       04860000
004870     READ FI-MUTATIES   INTO    WS-MUTATIES                       04870000
004880     AT END                                                       04880000
004890       SET MUTATIES-EOF TO TRUE                                   04890000
004900     NOT AT END                                                   04900000
004910       ADD 1 TO WS-TOTAL-INPUT                                    04910000
004920       CONTINUE                                                   04920000
004930     END-READ                                                     04930000
004940     .                                                            04940000
004950                                                                  04950000
004960 1100-GET-TIMESTAMP.                                              04960000
004970     MOVE FUNCTION CURRENT-DATE            TO TS-SYSTEM.          04970000
004980     MOVE CC OF TS-SYSTEM                  TO CC OF TS-TIMESTAMP  04980000
004990     MOVE YY OF TS-SYSTEM                  TO YY OF TS-TIMESTAMP  04990000
005000     MOVE MM OF TS-SYSTEM                  TO MM OF TS-TIMESTAMP  05000000
005010     MOVE DD OF TS-SYSTEM                  TO DD OF TS-TIMESTAMP  05010000
005020     MOVE HH OF TS-SYSTEM                  TO HH OF TS-TIMESTAMP  05020000
005030     MOVE MI OF TS-SYSTEM                  TO MI OF TS-TIMESTAMP  05030000
005040     MOVE SS OF TS-SYSTEM                  TO SS OF TS-TIMESTAMP  05040000
005050     MOVE TT OF TS-SYSTEM                  TO TT OF TS-TIMESTAMP  05050000
005060     DISPLAY 'TIMESTAMP: ' TS-TIMESTAMP                           05060000
005070     .                                                            05070000
005080* SQLERROR ROUTINE.                                               05080000
005090     EXEC SQL                                                     05090000
005100          INCLUDE SQLERROR                                        05100000
005110     END-EXEC.                                                    05110000
