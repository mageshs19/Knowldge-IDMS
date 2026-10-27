000010 CBL ARITH(EXTEND)                                                00010000
000020 IDENTIFICATION DIVISION.                                         00020000
000030*========================                                         00030000
000040 PROGRAM-ID. VMDZ4310.                                            00040000
000050                                                                  00050000
000060 AUTHOR.       PYTHON-AUTOMATION-USING-AI.                        00060000
000070*                                                                 00070000
000080*  OPZOEKEN GEGEVENS MAANDELIJKSE MUTATIES VIA ACCESS             00080000
000090*  IDMS DB OMLOOP/CIRCULATIE                                      00090000
000100*                                                                 00100000
000110                                                                  00110000
000120******************************************************************00120000
000130* WIJZIGINGEN :                                                  *00130000
000140*                                                                *00140000
000150* TERMA : 11/03/2009 P27                                         *00150000
000160* NIEUWE ZONE OLD-CI TOEGEVOEGD IN INPUT-FILE +                  *00160000
000170* DEZE ZONE OLD-CI MOVEN NAAR NR-CIINPTR-OORD VAN VMBD510I       *00170000
000180******************************************************************00180000
000190                                                                  00190000
000200 ENVIRONMENT DIVISION.                                            00200000
000210*=====================                                            00210000
000220 CONFIGURATION SECTION.                                           00220000
000230*----------------------                                           00230000
000240 SOURCE-COMPUTER. ES9000.                                         00240000
000250 OBJECT-COMPUTER. ES9000.                                         00250000
000260 SPECIAL-NAMES.                                                   00260000
000270     DECIMAL-POINT IS COMMA.                                      00270000
000280                                                                  00280000
000290 INPUT-OUTPUT SECTION.                                            00290000
000300*---------------------                                            00300000
000310 FILE-CONTROL.                                                    00310000
000320     SELECT FI-MUTATIES         ASSIGN TO UT-S-DD010.             00320000
000330     SELECT FO-MUTATIES         ASSIGN TO UT-S-DD100.             00330000
000340                                                                  00340000
000350*----------------------                                           00350000
000360                                                                  00360000
000370                                                                  00370000
000380 DATA DIVISION.                                                   00380000
000390*==============                                                   00390000
000400*---------------                                                  00400000
000410                                                                  00410000
000420 FILE SECTION.                                                    00420000
000430*-------------                                                    00430000
000440 FD  FI-MUTATIES                                                  00440000
000450     LABEL RECORD IS STANDARD                                     00450000
000460     RECORDING F                                                  00460000
000470     BLOCK CONTAINS 0.                                            00470000
000480 01  FI-MUTATIES-REC          PIC  X(21).                         00480000
000490*                                                                 00490000
000500 FD  FO-MUTATIES                                                  00500000
000510     LABEL RECORD IS STANDARD                                     00510000
000520     RECORDING F                                                  00520000
000530     BLOCK CONTAINS 0.                                            00530000
000540 01  FO-MUTATIES-REC            PIC  X(1500).                     00540000
000550*                                                                 00550000
000560 WORKING-STORAGE SECTION.                                         00560000
000570*------------------------                                         00570000
000580* -- DATE PARM --                                                 00580000
000590*01  W-DATE              PIC 9(8).                                00590000
000600*01  W-DATE-X REDEFINES W-DATE.                                   00600000
000610*    05  W-DATE-Y        PIC 9(4).                                00610000
000620*    05  W-DATE-M        PIC 9(2).                                00620000
000630*    05  W-DATE-D        PIC 9(2).                                00630000
000640                                                                  00640000
000650 01  VOLGNUMMER                 PIC 9(07) VALUE ZEROES.           00650000
000660                                                                  00660000
000670 000680 01  WS-VAR.                                               00670000
000680   02 WS-NR-ISSUE.                                                00680000
000690     03  WS-NR-ID-ISSUE PIC X(7).                                 00690000
000700     03  WS-NR-CD-ISSUE PIC X(2).                                 00700000
000710                                                                  00710000
000720* -- CLE DU FORMULAIRE --                                         00720000
000730   02 WS-NR-ID-GOOD.                                              00730000
000740     03  WS-NR-CIO              PIC 9(8).                         00740000
000750     03  WS-DA-CREA             PIC 9(8).                         00750000
000760     03  WS-NR-ID               PIC 9(6).                         00760000
000770     03  WS-CT-OPD              PIC 999.                          00770000
000780     03  WS-CT-OPG              PIC 999.                          00780000
000790     03  FILLER                 PIC XX.                           00790000
000800                                                                  00800000
000810   02 WS-MUTATIES.                                                00810000
000820     03 WS-IN-NR-TIT-BC PIC X(13).                                00820000
000830     03 WS-NR-SUITE     PIC X(2).                                 00830000
000840     03 WS-OLD-CI       PIC X(6).                                 00840000
000850                                                                  00850000
000860* ----- USERABEN -----                                            00860000
000870   02  WS-TOTAL-INPUT PIC S9(11) COMP-3 VALUE +0.                 00870000
000880   02  WS-COUNT-TREATED              PIC 9(15) VALUE ZEROES.      00880000
000890 01 HELP-VAR.                                                     00890000
000900   02 HELP-DA-UBSECIS-STOCK PIC 9(8).                             00900000
000910   02 HELP-DA-CR-EVENT-PROD PIC 9(8).                             00910000
000920   02 HELP-NR-CIO-FORM-AS.                                        00920000
000930     03 HELP-NR-CIO-FORM-AS-1POS PIC X(1).                        00930000
000940     03 HELP-NR-CIO-FORM-AS-26POS PIC X(5).                       00940000
000950   02 HELP-NR-ID-STOCK-CD PIC X(13).                              00950000
000960   02 HELP-NR-ID-STOCK-CD-P13-R REDEFINES HELP-NR-ID-STOCK-CD.    00960000
000970     03 HELP-NR-ID-STOCK-CD-112POS PIC X(12).                     00970000
000980     03 HELP-NR-ID-STOCK-CD-13POS PIC X(1).                       00980000
000990 01  USERABEN                   PIC X(8) VALUE 'USERABEN'.        00990000
001000                                                                  01000000
001010 01  CS-VMDZ4310                PIC X(8) VALUE 'VMDZ4310'.        01010000
001020                                                                  01020000
001030*---------------------------------------------------------------* 01030000
001040*--- COPYBOOKS                                                    01040000
001050*---------------------------------------------------------------* 01050000
001060     COPY VMDZ510I.                                               01060000
001070                                                                  01070000
001080                                                                  01080000
001090*---------------------------------------------------------------* 01090000
001100*--- SWITCHES                                                     01100000
001110*---------------------------------------------------------------* 01110000
001120 01  SW-MUTATIES-EOF            PIC X.                            01120000
001130     88 MUTATIES-NOT-EOF                  VALUE 'N'.              01130000
001140     88 MUTATIES-EOF                      VALUE 'Y'.              01140000
001150                                                                  01150000
001160                                                                  01160000
001170                                                                  01170000
001180     EXEC SQL INCLUDE SQLERRWS END-EXEC.                          01180000
001190     EXEC SQL INCLUDE SQLCA END-EXEC.                             01190000
001200     EXEC SQL INCLUDE DZEVEFTV END-EXEC.                          01200000
001210     EXEC SQL INCLUDE DZBEFFTV END-EXEC.                          01210000
001220                                                                  01220000
001230                                                                  01230000
001240                                                                  01240000
001250                                                                  01250000
001260                                                                  01260000
001270 01  WS-DB2-GENERATED.                                            01270000
001280     10  CS-PROGRAM               PIC X(8)    VALUE 'VMDZ4310'.   01280000
001290                                                                  01290000
001300 01  WS-TIMESTAMP-FIELDS.                                         01300000
001310     05 TS-SYSTEM.                                                01310000
001320        10  DA-SYS.                                               01320000
001330            15  DA-SYS-CCYY.                                      01330000
001340                20  CC            PIC X(2).                       01340000
001350                20  YY            PIC X(2).                       01350000
001360            15  MM                PIC X(2).                       01360000
001370            15  DD                PIC X(2).                       01370000
001380        10  HR-SYS.                                               01380000
001390            15  HH                PIC X(2).                       01390000
001400            15  MI                PIC X(2).                       01400000
001410            15  SS                PIC X(2).                       01410000
001420            15  TT                PIC X(2).                       01420000
001430     05 TS-TIMESTAMP.                                             01430000
001440        10  CC                    PIC X(2).                       01440000
001450        10  YY                    PIC X(2).                       01450000
001460        10  TE-MARKER1            PIC X             VALUE '-'.    01460000
001470        10  MM                    PIC X(2).                       01470000
001480        10  TE-MARKER2            PIC X             VALUE '-'.    01480000
001490        10  DD                    PIC X(2).                       01490000
001500        10  TE-MARKER3            PIC X             VALUE '-'.    01500000
001510        10  HH                    PIC X(2).                       01510000
001520        10  TE-MARKER4            PIC X             VALUE '.'.    01520000
001530        10  MI                    PIC X(2).                       01530000
001540        10  TE-MARKER5            PIC X             VALUE '.'.    01540000
001550        10  SS                    PIC X(2).                       01550000
001560        10  TE-MARKER6            PIC X             VALUE '.'.    01560000
001570        10  TT                    PIC X(2).                       01570000
001580        10  NNNN                  PIC 9(04)         VALUE 0.      01580000
001590                                                                  01590000
001600 01 WS-DATUMVELDEN.                                               01600000
001610   03 DA-YYMMDD.                                                  01610000
001620     05 YY PIC 99 VALUE ZERO.                                     01620000
001630     05 MM PIC 99 VALUE ZERO.                                     01630000
001640     05 DD PIC 99 VALUE ZERO.                                     01640000
001650   03 DA-DDMMCCYY.                                                01650000
001660     05 DD PIC 99 VALUE ZERO.                                     01660000
001670     05 MM PIC 99 VALUE ZERO.                                     01670000
001680     05 CC PIC 99 VALUE ZERO.                                     01680000
001690     05 YY PIC 99 VALUE ZERO.                                     01690000
001700   03 DA-CCYYMMDD.                                                01700000
001710     05 CC PIC 99 VALUE ZERO.                                     01710000
001720     05 YY PIC 99 VALUE ZERO.                                     01720000
001730     05 MM PIC 99 VALUE ZERO.                                     01730000
001740     05 DD PIC 99 VALUE ZERO.                                     01740000
001750   03 DA-CCYYMMDD-R REDEFINES DA-CCYYMMDD.                        01750000
001760     05 CCYY PIC 9999.                                            01760000
001770     05 MM PIC 99.                                                01770000
001780     05 DD PIC 99.                                                01780000
001790   03 DA-DD-MM-CCYY.                                              01790000
001800     05 DD PIC 9(02).                                             01800000
001810     05 TE-MARKER5 PIC X VALUE '.'.                               01810000
001820     05 MM PIC 9(02).                                             01820000
001830     05 TE-MARKER6 PIC X VALUE '.'.                               01830000
001840     05 CCYY PIC 9(04).                                           01840000
001850 LINKAGE SECTION.                                                 01850000
001860*----------------                                                 01860000
001870 01  LS-PARM-INPUT.                                               01870000
001880     02  LS-PARM                PIC S9(004) COMP.                 01880000
001890     02  LS-PARAM-IND           PIC X.                            01890000
001900     02  LS-DATE8               PIC  9(008).                      01900000
001910                                                                  01910000
001920                                                                  01920000
001930 PROCEDURE DIVISION USING LS-PARM-INPUT.                          01930000
001940*=======================================                          01940000
001950     PERFORM 600-GET-TIMESTAMP.                                   01950000
001960                                                                  01960000
001970 MAIN.                                                            01970000
001980*-----                                                            01980000
001990     PERFORM INIT-TREATMENT                                       01990000
002000     PERFORM TREAT-MUTATIES UNTIL MUTATIES-EOF                    02000000
002010     PERFORM END-TREATMENT                                        02010000
002020     STOP RUN                                                     02020000
002030     .                                                            02030000
002040                                                                  02040000
002050*----------------------------------------------------------------*02050000
002060 INIT-TREATMENT.                                                  02060000
002070*---------------                                                  02070000
002080     OPEN INPUT  FI-MUTATIES                                      02080000
002090     OUTPUT FO-MUTATIES                                           02090000
002100     SET MUTATIES-NOT-EOF TO TRUE.                                02100000
002110                                                                  02110000
002120* -- BINDS VOOR IDMS                                              02120000
002130                                                                  02130000
002140                                                                  02140000
002150                                                                  02150000
002160* -- READY                                                        02160000
002170                                                                  02170000
002180     PERFORM READ-MUTATIES                                        02180000
002190     .                                                            02190000
002200                                                                  02200000
002210*----------------------------------------------------------------*02210000
002220 END-TREATMENT.                                                   02220000
002230*--------------                                                   02230000
002240* -- FINISH                                                       02240000
002250                                                                  02250000
002260     CLOSE FI-MUTATIES                                            02260000
002270     FO-MUTATIES                                                  02270000
002280                                                                  02280000
002290     DISPLAY '# TREATED    = ' WS-COUNT-TREATED                   02290000
002300     DISPLAY 'TOTAL INPUTS ='  WS-TOTAL-INPUT                     02300000
002310     .                                                            02310000
002320                                                                  02320000
002330*----------------------------------------------------------------*02330000
002340 TREAT-MUTATIES.                                                  02340000
002350*--------------                                                   02350000
002360     PERFORM SEARCH-MUTATIES.                                     02360000
002370     PERFORM MOVE-MUTATIES.                                       02370000
002380     PERFORM WRITE-MUTATIES.                                      02380000
002390     PERFORM READ-MUTATIES                                        02390000
002400     .                                                            02400000
002410                                                                  02410000
002420*----------------------------------------------------------------*02420000
002430 SEARCH-MUTATIES.                                                 02430000
002440*---------------                                                  02440000
002450     INITIALIZE DCLDZBEFFTV                                       02450000
002460 INITIALIZE HELP-VAR.                                             02460000
002470     MOVE '1002'      TO CT-RKTPROD-479BEFF OF DCLDZBEFFTV.       02470000
002480*MOVEs populate the keyed SELECT.                                 02480000
002490     MOVE WS-NR-SUITE TO NS-DBSTK-479BEFF OF DCLDZBEFFTV.         02490000
002500                                                                  02500000
002510 MOVE WS-IN-NR-TIT-BC TO HELP-NR-ID-STOCK-CD.                     02510000
002520 MOVE HELP-NR-ID-STOCK-CD-112POS TO NR-IDSTOCK-479BEFF            02520000
002530   OF DCLDZBEFFTV.                                                02530000
002540 IF HELP-NR-ID-STOCK-CD-13POS IS NUMERIC                          02540000
002550   MOVE HELP-NR-ID-STOCK-CD-13POS TO NR-CDSTK-479BEFF             02550000
002560     OF DCLDZBEFFTV                                               02560000
002570 ELSE                                                             02570000
002580   DISPLAY 'INVALID NUMERIC COMPONENT IN LRF CALC KEY'            02580000
002590   PERFORM SQLERROR                                               02590000
002600 END-IF.                                                          02600000
002610     MOVE 'SELECT-VMBEFF' TO SQL-LOCATION.                        02610000
002620     EXEC SQL                                                     02620000
002630    SELECT                                                        02630000
002640       NR_IDSTOCK_479BEFF,                                        02640000
002650       NS_DBSTK_479BEFF,                                          02650000
002660       AM_CNDSTK_479BEFF,                                         02660000
002670       AM_CNSTK_479BEFF,                                          02670000
002680       NR_IDISSUE_479BEFF,                                        02680000
002690       NR_CDISSUE_479BEFF,                                        02690000
002700       NX_CPCRESK_479BEFF,                                        02700000
002710       NX_CPAIDSK_479BEFF,                                        02710000
002720       AM_INTERSK_479BEFF,                                        02720000
002730       CO_IDPRKSK_479BEFF,                                        02730000
002740       NS_IRMOSTK_479BEFF,                                        02740000
002750       DA_UBSECIS_479BEFF                                         02750000
002760    INTO                                                          02760000
002770       :DCLDZBEFFTV.NR-IDSTOCK-479BEFF,                           02770000
002780       :DCLDZBEFFTV.NS-DBSTK-479BEFF,                             02780000
002790       :DCLDZBEFFTV.AM-CNDSTK-479BEFF,                            02790000
002800       :DCLDZBEFFTV.AM-CNSTK-479BEFF,                             02800000
002810       :DCLDZBEFFTV.NR-IDISSUE-479BEFF,                           02810000
002820       :DCLDZBEFFTV.NR-CDISSUE-479BEFF,                           02820000
002830       :DCLDZBEFFTV.NX-CPCRESK-479BEFF,                           02830000
002840       :DCLDZBEFFTV.NX-CPAIDSK-479BEFF,                           02840000
002850       :DCLDZBEFFTV.AM-INTERSK-479BEFF,                           02850000
002860       :DCLDZBEFFTV.CO-IDPRKSK-479BEFF,                           02860000
002870       :DCLDZBEFFTV.NS-IRMOSTK-479BEFF,                           02870000
002880       :DCLDZBEFFTV.DA-UBSECIS-479BEFF                            02880000
002890    FROM DZBEFFTV                                                 02890000
002900    WHERE                                                         02900000
002910       CT_RKTPROD_479BEFF = :DCLDZBEFFTV.CT-RKTPROD-479BEFF       02910000
002920       AND NR_IDSTOCK_479BEFF = :DCLDZBEFFTV.NR-IDSTOCK-479BEFF   02920000
002930       AND NR_CDSTK_479BEFF = :DCLDZBEFFTV.NR-CDSTK-479BEFF       02930000
002940       AND NS_DBSTK_479BEFF = :DCLDZBEFFTV.NS-DBSTK-479BEFF       02940000
002950    QUERYNO 442                                                   02950000
002960     END-EXEC                                                     02960000
002970     EVALUATE SQLCODE                                             02970000
002980       WHEN 0                                                     02980000
002990            CONTINUE                                              02990000
003000       WHEN 100                                                   03000000
003010            DISPLAY 'NO DATA FOUND FOR SELECT DZBEFFTV'           03010000
003020            PERFORM SQLERROR                                      03020000
003030       WHEN OTHER                                                 03030000
003040            DISPLAY 'ERROR ON LRF KEYED PARENT SELECT '           03040000
003050                  'DZBEFFTV'                                      03050000
003060            PERFORM SQLERROR                                      03060000
003070     END-EVALUATE                                                 03070000
003080     .                                                            03080000
003090     INITIALIZE DCLDZEVEFTV                                       03090000
003100     EXEC SQL                                                     03100000
003110        SELECT NR_IDGOOD_479EVEF,                                 03110000
003120           NR_CI1POS_479EVEF,                                     03120000
003130           NR_CI26POS_479EVEF,                                    03130000
003140           DA_CREVTPD_479EVEF                                     03140000
003150        INTO                                                      03150000
003160           :DCLDZEVEFTV.NR-IDGOOD-479EVEF,                        03160000
003170           :DCLDZEVEFTV.NR-CI1POS-479EVEF,                        03170000
003180           :DCLDZEVEFTV.NR-CI26POS-479EVEF,                       03180000
003190           :DCLDZEVEFTV.DA-CREVTPD-479EVEF                        03190000
003200        FROM DZEVEFTV                                             03200000
003210        WHERE CT_RKTPROD_479BEFF = :DCLDZBEFFTV.CT-RKTPROD-479BEFF03210000
003220        AND NR_IDSTOCK_479BEFF = :DCLDZBEFFTV.NR-IDSTOCK-479BEFF  03220000
003230        AND NR_CDSTK_479BEFF = :DCLDZBEFFTV.NR-CDSTK-479BEFF      03230000
003240        AND NS_DBSTK_479BEFF = :DCLDZBEFFTV.NS-DBSTK-479BEFF      03240000
003250        AND CT_RKTEVPR_479EVEF = '0092'                           03250000
003260        ORDER BY NR_ID_479EVEF DESC                               03260000
003270        FETCH FIRST ROW ONLY                                      03270000
003280        QUERYNO 254                                               03280000
003290     END-EXEC                                                     03290000
003300     IF SQLCODE NOT = 0 AND SQLCODE NOT = 100                     03300000
003310        DISPLAY 'ERROR ON BOUNDED LRF SELECT'                     03310000
003320        PERFORM SQLERROR                                          03320000
003330     END-IF.                                                      03330000
003340                                                                  03340000
003350*                                                                 03350000
003360     IF SQLCODE = 100                                             03360000
003370        DISPLAY 'NO DATA FOUND FOR BOUNDED LRF SELECT'            03370000
003380        DISPLAY 'K1=' CT-RKTPROD-479BEFF OF DCLDZBEFFTV           03380000
003390        DISPLAY 'K2=' NR-IDSTOCK-479BEFF OF DCLDZBEFFTV           03390000
003400        DISPLAY 'K3=' NR-CDSTK-479BEFF OF DCLDZBEFFTV             03400000
003410        DISPLAY 'K4=' NS-DBSTK-479BEFF OF DCLDZBEFFTV             03410000
003420        CALL USERABEN                                             03420000
003430     END-IF.                                                      03430000
003440                                                                  03440000
003450* -- ZOEK DE MUTATIE                                              03450000
003460                                                                  03460000
003470                                                                  03470000
003480*----------------------------------------------------------------*03480000
003490 MOVE-MUTATIES.                                                   03490000
003500*-------------                                                    03500000
003510     INITIALIZE VMDZ510I                                          03510000
003520     REPLACING ALPHANUMERIC BY SPACES                             03520000
003530     NUMERIC BY ZEROES.                                           03530000
003540                                                                  03540000
003550     MOVE NR-IDGOOD-479EVEF OF DCLDZEVEFTV TO WS-NR-ID-GOOD.      03550000
003560                                                                  03560000
003570     MOVE NR-CI1POS-479EVEF OF DCLDZEVEFTV TO NR-CIO-FORM-AS(1:1) 03570000
003580       OF VMDZ510I.                                               03580000
003590     MOVE NR-CI26POS-479EVEF OF DCLDZEVEFTV TO NR-CIO-FORM-AS(2:5)03590000
003600       OF VMDZ510I.                                               03600000
003610     MOVE WS-DA-CREA TO DA-CREA-FORM-AS-R OF VMDZ510I.            03610000
003620     STRING DA-CR-FORM-AS-Y   OF VMDZ510I '-'                     03620000
003630        DA-CR-FORM-AS-M   OF VMDZ510I '-'                         03630000
003640        DA-CR-FORM-AS-D   OF VMDZ510I '-'                         03640000
003650            '01.01.01.000001'                                     03650000
003660        DELIMITED BY SIZE                                         03660000
003670       INTO TS-CREA-OORD      OF VMDZ510I.                        03670000
003680        MOVE WS-NR-ID  TO NR-ID-FORM-AS OF VMDZ510I.              03680000
003690        MOVE WS-CT-OPG TO CT-OPG-FORM-AS-R OF VMDZ510I.           03690000
003700        MOVE WS-CT-OPD TO CT-OPD-FORM-AS-R OF VMDZ510I.           03700000
003710                                                                  03710000
003720        MOVE NR-IDISSUE-479BEFF OF DCLDZBEFFTV TO WS-NR-ID-ISSUE  03720000
003730        MOVE NR-CDISSUE-479BEFF OF DCLDZBEFFTV TO WS-NR-CD-ISSUE  03730000
003740        MOVE WS-NR-ISSUE TO NR-ISSUIN-OORD OF VMDZ510I.           03740000
003750        MOVE AM-CNSTK-479BEFF OF DCLDZBEFFTV                      03750000
003760       TO AM-CNS-FORM-AS      OF VMDZ510I.                        03760000
003770        MOVE NR-IDSTOCK-479BEFF OF DCLDZBEFFTV TO                 03770000
003780       NR-ST-FORM-AS-R(1:12) OF VMDZ510I.                         03780000
003790        MOVE NR-CDSTK-479BEFF OF DCLDZBEFFTV TO                   03790000
003800       NR-ST-FORM-AS-R(13:1)                                      03800000
003810       OF VMDZ510I.                                               03810000
003820        MOVE NR-IDSTOCK-479BEFF OF DCLDZBEFFTV TO                 03820000
003830       NR-STIN-OORD(1:12)                                         03830000
003840       OF VMDZ510I.                                               03840000
003850        MOVE NR-CDSTK-479BEFF OF DCLDZBEFFTV TO NR-STIN-OORD(13:1)03850000
003860       OF VMDZ510I.                                               03860000
003870        MOVE SPACES TO NR-STIN-OORD(14:1) OF VMDZ510I.            03870000
003880        MOVE NS-DBSTK-479BEFF OF DCLDZBEFFTV                      03880000
003890       TO NS-DBST-OORD        OF VMDZ510I.                        03890000
003900        IF NX-CPCRESK-479BEFF OF DCLDZBEFFTV = 0                  03900000
003910           MOVE AM-CNDSTK-479BEFF OF DCLDZBEFFTV                  03910000
003920         TO AM-CND-FORM-AS      OF VMDZ510I                       03920000
003930        ELSE                                                      03930000
003940           MOVE AM-INTERSK-479BEFF OF DCLDZBEFFTV                 03940000
003950         TO AM-INTER-FORM-AS    OF VMDZ510I                       03950000
003960        END-IF.                                                   03960000
003970        MOVE CO-IDPRKSK-479BEFF OF DCLDZBEFFTV                    03970000
003980       TO NR-ID-040SECU       OF VMDZ510I.                        03980000
003990        MOVE NS-IRMOSTK-479BEFF OF DCLDZBEFFTV                    03990000
004000       TO NS-SEQ-040IRMO      OF VMDZ510I.                        04000000
004010 MOVE DA-UBSECIS-479BEFF OF DCLDZBEFFTV TO DA-DD-MM-CCYY          04010000
004020 EVALUATE TRUE                                                    04020000
004030   WHEN DA-DD-MM-CCYY = '01.01.0001'                              04030000
004040     MOVE ZEROES TO DA-CCYYMMDD-R                                 04040000
004050   WHEN DA-DD-MM-CCYY = '31.12.9999'                              04050000
004060     MOVE '99999999' TO DA-CCYYMMDD-R                             04060000
004070   WHEN OTHER                                                     04070000
004080     MOVE CCYY OF DA-DD-MM-CCYY TO CCYY OF DA-CCYYMMDD-R          04080000
004090     MOVE MM OF DA-DD-MM-CCYY TO MM OF DA-CCYYMMDD-R              04090000
004100     MOVE DD OF DA-DD-MM-CCYY TO DD OF DA-CCYYMMDD-R              04100000
004110 END-EVALUATE                                                     04110000
004120 MOVE DA-CCYYMMDD-R TO HELP-DA-UBSECIS-STOCK.                     04120000
004130 MOVE HELP-DA-UBSECIS-STOCK TO DA-UB-FORM-AS OF VMDZ510I.         04130000
004140 MOVE DA-CREVTPD-479EVEF OF DCLDZEVEFTV TO DA-DD-MM-CCYY          04140000
004150 EVALUATE TRUE                                                    04150000
004160   WHEN DA-DD-MM-CCYY = '01.01.0001'                              04160000
004170     MOVE ZEROES TO DA-CCYYMMDD-R                                 04170000
004180   WHEN DA-DD-MM-CCYY = '31.12.9999'                              04180000
004190     MOVE '99999999' TO DA-CCYYMMDD-R                             04190000
004200   WHEN OTHER                                                     04200000
004210     MOVE CCYY OF DA-DD-MM-CCYY TO CCYY OF DA-CCYYMMDD-R          04210000
004220     MOVE MM OF DA-DD-MM-CCYY TO MM OF DA-CCYYMMDD-R              04220000
004230     MOVE DD OF DA-DD-MM-CCYY TO DD OF DA-CCYYMMDD-R              04230000
004240 END-EVALUATE                                                     04240000
004250 MOVE DA-CCYYMMDD-R TO HELP-DA-CR-EVENT-PROD.                     04250000
004260 MOVE HELP-DA-CR-EVENT-PROD TO DA-COMPTABILISATION-OPER           04260000
004270   OF VMDZ510I.                                                   04270000
004280 MOVE HELP-DA-CR-EVENT-PROD TO DA-EXEC-OORD OF VMDZ510I.          04280000
004290                                                                  04290000
004300        MOVE NX-CPCRESK-479BEFF OF DCLDZBEFFTV                    04300000
004310       TO NS-RANK-COUP        OF VMDZ510I.                        04310000
004320        MOVE NX-CPAIDSK-479BEFF OF DCLDZBEFFTV                    04320000
004330       TO NX-CPAID-STOCK      OF VMDZ510I.                        04330000
004340*    MOVE NX-CPFDU-STOCK      OF VMBEFF                           04340000
004350                                                                  04350000
004360* EXTRA ZONES OPVULLEN                                            04360000
004370                                                                  04370000
004380        EVALUATE WS-CT-OPD                                        04380000
004390          WHEN 00                                                 04390000
004400               MOVE 'MU' TO CO-TYPOPER-OORD OF VMDZ510I           04400000
004410          WHEN OTHER                                              04410000
004420               MOVE '??' TO CO-TYPOPER-OORD OF VMDZ510I           04420000
004430               DISPLAY 'ABEND VERKEERDE CT-OPD = '                04430000
004440               WS-CT-OPD                                          04440000
004450               DISPLAY DCLDZBEFFTV                                04450000
004460               DISPLAY DCLDZEVEFTV                                04460000
004470               CALL USERABEN                                      04470000
004480        END-EVALUATE.                                             04480000
004490* UITGIFTE = SRW DUS '1'                                          04490000
004500        MOVE '1' TO CO-ISSUIN-OORD OF VMDZ510I.                   04500000
004510        MOVE 001 TO NB-ST-OORD OF VMDZ510I.                       04510000
004520* EFFECT = IKB = DEXIA DUS '1'                                    04520000
004530        MOVE '1' TO CO-STIN-OORD OF VMDZ510I.                     04530000
004540                                                                  04540000
004550        ADD 1 TO VOLGNUMMER.                                      04550000
004560        STRING 'CIR '                                             04560000
004570           CT-OPD-FORM-AS OF VMDZ510I ' '                         04570000
004580           VOLGNUMMER                                             04580000
004590           DELIMITED BY SIZE                                      04590000
004600       INTO NR-REFORD-OORD OF VMDZ510I.                           04600000
004610                                                                  04610000
004620* EXTRA'S ANNIE STEPPE                                            04620000
004630           STRING 'X'                                             04630000
004640            '000000'                                              04640000
004650            '      '                                              04650000
004660              DELIMITED BY SIZE                                   04660000
004670       INTO NR-TRANS-OORD  OF VMDZ510I.                           04670000
004680* 10=AGENCY 11=ZETEL                                              04680000
004690*    IF NR-CIO-FORM-AS OF VMDZ510I =                              04690000
004700*       NR-CIW-FORM-AS OF VMDZ510I                                04700000
004710              MOVE '10' TO CO-TYPKAN2-OORD OF VMDZ510I            04710000
004720*    ELSE                                                         04720000
004730*      MOVE '11' TO CO-TYPKAN2-OORD OF VMDZ510I                   04730000
004740*    END-IF.                                                      04740000
004750              MOVE 'DX' TO CO-BANK-OORD OF VMDZ510I.              04750000
004760                                                                  04760000
004770              MOVE WS-OLD-CI TO NR-CIINPTR-OORD OF VMDZ510I.      04770000
004780                                                                  04780000
004790*----------------------------------------------------------------*04790000
004800 WRITE-MUTATIES.                                                  04800000
004810*--------------                                                   04810000
004820     ADD 1 TO WS-COUNT-TREATED                                    04820000
004830     WRITE FO-MUTATIES-REC FROM VMDZ510I                          04830000
004840     .                                                            04840000
004850                                                                  04850000
004860*----------------------------------------------------------------*04860000
004870 READ-MUTATIES.                                                   04870000
004880*-------------                                                    04880000
004890     READ FI-MUTATIES INTO    WS-MUTATIES                         04890000
004900        AT END                                                    04900000
004910        SET MUTATIES-EOF TO TRUE                                  04910000
004920     NOT AT END                                                   04920000
004930        ADD 1 TO WS-TOTAL-INPUT                                   04930000
004940        CONTINUE                                                  04940000
004950     END-READ                                                     04950000
004960     .                                                            04960000
004970                                                                  04970000
004980/---------------------------------------------------------------* 04980000
004990*    ERROR HANDLING                                               04990000
005000*---------------------------------------------------------------* 05000000
005010                                                                  05010000
005020                                                                  05020000
005030 600-GET-TIMESTAMP.                                               05030000
005040D    DISPLAY '600-GET-TIMESTAMP.'                                 05040000
005050     MOVE FUNCTION CURRENT-DATE TO TS-SYSTEM.                     05050000
005060     MOVE CC OF TS-SYSTEM       TO CC OF TS-TIMESTAMP             05060000
005070     MOVE YY OF TS-SYSTEM       TO YY OF TS-TIMESTAMP             05070000
005080     MOVE MM OF TS-SYSTEM       TO MM OF TS-TIMESTAMP             05080000
005090     MOVE DD OF TS-SYSTEM       TO DD OF TS-TIMESTAMP             05090000
005100     MOVE HH OF TS-SYSTEM       TO HH OF TS-TIMESTAMP             05100000
005110     MOVE MI OF TS-SYSTEM       TO MI OF TS-TIMESTAMP             05110000
005120     MOVE SS OF TS-SYSTEM       TO SS OF TS-TIMESTAMP             05120000
005130     MOVE TT OF TS-SYSTEM       TO TT OF TS-TIMESTAMP             05130000
005140     DISPLAY 'TIMESTAMP: ' TS-TIMESTAMP                           05140000
005150     .                                                            05150000
005160                                                                  05160000
005170*SQLERROR ROUTINE.                                                05170000
005180     EXEC SQL                                                     05180000
005190          INCLUDE SQLERROR                                        05190000
005200     END-EXEC.                                                    05200000
