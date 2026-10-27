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
000950   02 HELP-NR-ID-STOCK-CD PIC 9(13) VALUE 0.                      00950000
000960   02 HELP-NR-ID-STOCK-CD-P13-R REDEFINES HELP-NR-ID-STOCK-CD.    00960000
000970     03 HELP-NR-ID-STOCK-CD-112POS PIC X(12).                     00970000
000980     03 HELP-NR-ID-STOCK-CD-13POS PIC 9(1).                       00980000
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
002540 MOVE HELP-NR-ID-STOCK-CD-13POS TO NR-CDSTK-479BEFF               02540000
002550   OF DCLDZBEFFTV.                                                02550000
002560     MOVE 'SELECT-VMBEFF' TO SQL-LOCATION.                        02560000
002570     EXEC SQL                                                     02570000
002580    SELECT                                                        02580000
002590       NR_IDSTOCK_479BEFF,                                        02590000
002600       NS_DBSTK_479BEFF,                                          02600000
002610       AM_CNDSTK_479BEFF,                                         02610000
002620       AM_CNSTK_479BEFF,                                          02620000
002630       NR_IDISSUE_479BEFF,                                        02630000
002640       NR_CDISSUE_479BEFF,                                        02640000
002650       NX_CPCRESK_479BEFF,                                        02650000
002660       NX_CPAIDSK_479BEFF,                                        02660000
002670       AM_INTERSK_479BEFF,                                        02670000
002680       CO_IDPRKSK_479BEFF,                                        02680000
002690       NS_IRMOSTK_479BEFF,                                        02690000
002700       DA_UBSECIS_479BEFF                                         02700000
002710    INTO                                                          02710000
002720       :DCLDZBEFFTV.NR-IDSTOCK-479BEFF,                           02720000
002730       :DCLDZBEFFTV.NS-DBSTK-479BEFF,                             02730000
002740       :DCLDZBEFFTV.AM-CNDSTK-479BEFF,                            02740000
002750       :DCLDZBEFFTV.AM-CNSTK-479BEFF,                             02750000
002760       :DCLDZBEFFTV.NR-IDISSUE-479BEFF,                           02760000
002770       :DCLDZBEFFTV.NR-CDISSUE-479BEFF,                           02770000
002780       :DCLDZBEFFTV.NX-CPCRESK-479BEFF,                           02780000
002790       :DCLDZBEFFTV.NX-CPAIDSK-479BEFF,                           02790000
002800       :DCLDZBEFFTV.AM-INTERSK-479BEFF,                           02800000
002810       :DCLDZBEFFTV.CO-IDPRKSK-479BEFF,                           02810000
002820       :DCLDZBEFFTV.NS-IRMOSTK-479BEFF,                           02820000
002830       :DCLDZBEFFTV.DA-UBSECIS-479BEFF                            02830000
002840    FROM DZBEFFTV                                                 02840000
002850    WHERE                                                         02850000
002860       CT_RKTPROD_479BEFF = :DCLDZBEFFTV.CT-RKTPROD-479BEFF       02860000
002870       AND NR_IDSTOCK_479BEFF = :DCLDZBEFFTV.NR-IDSTOCK-479BEFF   02870000
002880       AND NR_CDSTK_479BEFF = :DCLDZBEFFTV.NR-CDSTK-479BEFF       02880000
002890       AND NS_DBSTK_479BEFF = :DCLDZBEFFTV.NS-DBSTK-479BEFF       02890000
002900    QUERYNO 442                                                   02900000
002910     END-EXEC                                                     02910000
002920     EVALUATE SQLCODE                                             02920000
002930       WHEN 0                                                     02930000
002940            CONTINUE                                              02940000
002950       WHEN 100                                                   02950000
002960            DISPLAY 'NO DATA FOUND FOR SELECT DZBEFFTV'           02960000
002970            PERFORM SQLERROR                                      02970000
002980       WHEN OTHER                                                 02980000
002990            DISPLAY 'ERROR ON LRF KEYED PARENT SELECT '           02990000
003000                  'DZBEFFTV'                                      03000000
003010            PERFORM SQLERROR                                      03010000
003020     END-EVALUATE                                                 03020000
003030     .                                                            03030000
003040     INITIALIZE DCLDZEVEFTV                                       03040000
003050     EXEC SQL                                                     03050000
003060        SELECT NR_IDGOOD_479EVEF,                                 03060000
003070           NR_CI1POS_479EVEF,                                     03070000
003080           NR_CI26POS_479EVEF,                                    03080000
003090           DA_CREVTPD_479EVEF                                     03090000
003100        INTO                                                      03100000
003110           :DCLDZEVEFTV.NR-IDGOOD-479EVEF,                        03110000
003120           :DCLDZEVEFTV.NR-CI1POS-479EVEF,                        03120000
003130           :DCLDZEVEFTV.NR-CI26POS-479EVEF,                       03130000
003140           :DCLDZEVEFTV.DA-CREVTPD-479EVEF                        03140000
003150        FROM DZEVEFTV                                             03150000
003160        WHERE CT_RKTPROD_479BEFF = :DCLDZBEFFTV.CT-RKTPROD-479BEFF03160000
003170        AND NR_IDSTOCK_479BEFF = :DCLDZBEFFTV.NR-IDSTOCK-479BEFF  03170000
003180        AND NR_CDSTK_479BEFF = :DCLDZBEFFTV.NR-CDSTK-479BEFF      03180000
003190        AND NS_DBSTK_479BEFF = :DCLDZBEFFTV.NS-DBSTK-479BEFF      03190000
003200        AND CT_RKTEVPR_479EVEF = '0092'                           03200000
003210        ORDER BY NR_ID_479EVEF DESC                               03210000
003220        FETCH FIRST ROW ONLY                                      03220000
003230        QUERYNO 254                                               03230000
003240     END-EXEC                                                     03240000
003250     IF SQLCODE NOT = 0 AND SQLCODE NOT = 100                     03250000
003260        DISPLAY 'ERROR ON BOUNDED LRF SELECT'                     03260000
003270        PERFORM SQLERROR                                          03270000
003280     END-IF.                                                      03280000
003290                                                                  03290000
003300*                                                                 03300000
003310     IF SQLCODE = 100                                             03310000
003320        DISPLAY 'NO DATA FOUND FOR BOUNDED LRF SELECT'            03320000
003330        DISPLAY 'K1=' CT-RKTPROD-479BEFF OF DCLDZBEFFTV           03330000
003340        DISPLAY 'K2=' NR-IDSTOCK-479BEFF OF DCLDZBEFFTV           03340000
003350        DISPLAY 'K3=' NR-CDSTK-479BEFF OF DCLDZBEFFTV             03350000
003360        DISPLAY 'K4=' NS-DBSTK-479BEFF OF DCLDZBEFFTV             03360000
003370        CALL USERABEN                                             03370000
003380     END-IF.                                                      03380000
003390                                                                  03390000
003400* -- ZOEK DE MUTATIE                                              03400000
003410                                                                  03410000
003420                                                                  03420000
003430*----------------------------------------------------------------*03430000
003440 MOVE-MUTATIES.                                                   03440000
003450*-------------                                                    03450000
003460     INITIALIZE VMDZ510I                                          03460000
003470     REPLACING ALPHANUMERIC BY SPACES                             03470000
003480     NUMERIC BY ZEROES.                                           03480000
003490                                                                  03490000
003500     MOVE NR-IDGOOD-479EVEF OF DCLDZEVEFTV TO WS-NR-ID-GOOD.      03500000
003510                                                                  03510000
003520     MOVE NR-CI1POS-479EVEF OF DCLDZEVEFTV TO NR-CIO-FORM-AS(1:1) 03520000
003530       OF VMDZ510I.                                               03530000
003540     MOVE NR-CI26POS-479EVEF OF DCLDZEVEFTV TO NR-CIO-FORM-AS(2:5)03540000
003550       OF VMDZ510I.                                               03550000
003560     MOVE WS-DA-CREA TO DA-CREA-FORM-AS-R OF VMDZ510I.            03560000
003570     STRING DA-CR-FORM-AS-Y   OF VMDZ510I '-'                     03570000
003580        DA-CR-FORM-AS-M   OF VMDZ510I '-'                         03580000
003590        DA-CR-FORM-AS-D   OF VMDZ510I '-'                         03590000
003600            '01.01.01.000001'                                     03600000
003610        DELIMITED BY SIZE                                         03610000
003620       INTO TS-CREA-OORD      OF VMDZ510I.                        03620000
003630        MOVE WS-NR-ID  TO NR-ID-FORM-AS OF VMDZ510I.              03630000
003640        MOVE WS-CT-OPG TO CT-OPG-FORM-AS-R OF VMDZ510I.           03640000
003650        MOVE WS-CT-OPD TO CT-OPD-FORM-AS-R OF VMDZ510I.           03650000
003660                                                                  03660000
003670        MOVE NR-IDISSUE-479BEFF OF DCLDZBEFFTV TO WS-NR-ID-ISSUE  03670000
003680        MOVE NR-CDISSUE-479BEFF OF DCLDZBEFFTV TO WS-NR-CD-ISSUE  03680000
003690        MOVE WS-NR-ISSUE TO NR-ISSUIN-OORD OF VMDZ510I.           03690000
003700        MOVE AM-CNSTK-479BEFF OF DCLDZBEFFTV                      03700000
003710       TO AM-CNS-FORM-AS      OF VMDZ510I.                        03710000
003720        MOVE NR-IDSTOCK-479BEFF OF DCLDZBEFFTV TO                 03720000
003730       NR-ST-FORM-AS-R(1:12) OF VMDZ510I.                         03730000
003740        MOVE NR-CDSTK-479BEFF OF DCLDZBEFFTV TO                   03740000
003750       NR-ST-FORM-AS-R(13:1)                                      03750000
003760       OF VMDZ510I.                                               03760000
003770        MOVE NR-IDSTOCK-479BEFF OF DCLDZBEFFTV TO                 03770000
003780       NR-STIN-OORD(1:12)                                         03780000
003790       OF VMDZ510I.                                               03790000
003800        MOVE NR-CDSTK-479BEFF OF DCLDZBEFFTV TO NR-STIN-OORD(13:1)03800000
003810       OF VMDZ510I.                                               03810000
003820        MOVE SPACES TO NR-STIN-OORD(14:1) OF VMDZ510I.            03820000
003830        MOVE NS-DBSTK-479BEFF OF DCLDZBEFFTV                      03830000
003840       TO NS-DBST-OORD        OF VMDZ510I.                        03840000
003850        IF NX-CPCRESK-479BEFF OF DCLDZBEFFTV = 0                  03850000
003860           MOVE AM-CNDSTK-479BEFF OF DCLDZBEFFTV                  03860000
003870         TO AM-CND-FORM-AS      OF VMDZ510I                       03870000
003880        ELSE                                                      03880000
003890           MOVE AM-INTERSK-479BEFF OF DCLDZBEFFTV                 03890000
003900         TO AM-INTER-FORM-AS    OF VMDZ510I                       03900000
003910        END-IF.                                                   03910000
003920        MOVE CO-IDPRKSK-479BEFF OF DCLDZBEFFTV                    03920000
003930       TO NR-ID-040SECU       OF VMDZ510I.                        03930000
003940        MOVE NS-IRMOSTK-479BEFF OF DCLDZBEFFTV                    03940000
003950       TO NS-SEQ-040IRMO      OF VMDZ510I.                        03950000
003960 MOVE DA-UBSECIS-479BEFF OF DCLDZBEFFTV TO DA-DD-MM-CCYY          03960000
003970 EVALUATE TRUE                                                    03970000
003980   WHEN DA-DD-MM-CCYY = '01.01.0001'                              03980000
003990     MOVE ZEROES TO DA-CCYYMMDD-R                                 03990000
004000   WHEN DA-DD-MM-CCYY = '31.12.9999'                              04000000
004010     MOVE '99999999' TO DA-CCYYMMDD-R                             04010000
004020   WHEN OTHER                                                     04020000
004030     MOVE CCYY OF DA-DD-MM-CCYY TO CCYY OF DA-CCYYMMDD-R          04030000
004040     MOVE MM OF DA-DD-MM-CCYY TO MM OF DA-CCYYMMDD-R              04040000
004050     MOVE DD OF DA-DD-MM-CCYY TO DD OF DA-CCYYMMDD-R              04050000
004060 END-EVALUATE                                                     04060000
004070 MOVE DA-CCYYMMDD-R TO HELP-DA-UBSECIS-STOCK.                     04070000
004080 MOVE HELP-DA-UBSECIS-STOCK TO DA-UB-FORM-AS OF VMDZ510I.         04080000
004090 MOVE DA-CREVTPD-479EVEF OF DCLDZEVEFTV TO DA-DD-MM-CCYY          04090000
004100 EVALUATE TRUE                                                    04100000
004110   WHEN DA-DD-MM-CCYY = '01.01.0001'                              04110000
004120     MOVE ZEROES TO DA-CCYYMMDD-R                                 04120000
004130   WHEN DA-DD-MM-CCYY = '31.12.9999'                              04130000
004140     MOVE '99999999' TO DA-CCYYMMDD-R                             04140000
004150   WHEN OTHER                                                     04150000
004160     MOVE CCYY OF DA-DD-MM-CCYY TO CCYY OF DA-CCYYMMDD-R          04160000
004170     MOVE MM OF DA-DD-MM-CCYY TO MM OF DA-CCYYMMDD-R              04170000
004180     MOVE DD OF DA-DD-MM-CCYY TO DD OF DA-CCYYMMDD-R              04180000
004190 END-EVALUATE                                                     04190000
004200 MOVE DA-CCYYMMDD-R TO HELP-DA-CR-EVENT-PROD.                     04200000
004210 MOVE HELP-DA-CR-EVENT-PROD TO DA-COMPTABILISATION-OPER           04210000
004220   OF VMDZ510I.                                                   04220000
004230 MOVE HELP-DA-CR-EVENT-PROD TO DA-EXEC-OORD OF VMDZ510I.          04230000
004240                                                                  04240000
004250        MOVE NX-CPCRESK-479BEFF OF DCLDZBEFFTV                    04250000
004260       TO NS-RANK-COUP        OF VMDZ510I.                        04260000
004270        MOVE NX-CPAIDSK-479BEFF OF DCLDZBEFFTV                    04270000
004280       TO NX-CPAID-STOCK      OF VMDZ510I.                        04280000
004290*    MOVE NX-CPFDU-STOCK      OF VMBEFF                           04290000
004300                                                                  04300000
004310* EXTRA ZONES OPVULLEN                                            04310000
004320                                                                  04320000
004330        EVALUATE WS-CT-OPD                                        04330000
004340          WHEN 00                                                 04340000
004350               MOVE 'MU' TO CO-TYPOPER-OORD OF VMDZ510I           04350000
004360          WHEN OTHER                                              04360000
004370               MOVE '??' TO CO-TYPOPER-OORD OF VMDZ510I           04370000
004380               DISPLAY 'ABEND VERKEERDE CT-OPD = '                04380000
004390               WS-CT-OPD                                          04390000
004400               DISPLAY DCLDZBEFFTV                                04400000
004410               DISPLAY DCLDZEVEFTV                                04410000
004420               CALL USERABEN                                      04420000
004430        END-EVALUATE.                                             04430000
004440* UITGIFTE = SRW DUS '1'                                          04440000
004450        MOVE '1' TO CO-ISSUIN-OORD OF VMDZ510I.                   04450000
004460        MOVE 001 TO NB-ST-OORD OF VMDZ510I.                       04460000
004470* EFFECT = IKB = DEXIA DUS '1'                                    04470000
004480        MOVE '1' TO CO-STIN-OORD OF VMDZ510I.                     04480000
004490                                                                  04490000
004500        ADD 1 TO VOLGNUMMER.                                      04500000
004510        STRING 'CIR '                                             04510000
004520           CT-OPD-FORM-AS OF VMDZ510I ' '                         04520000
004530           VOLGNUMMER                                             04530000
004540           DELIMITED BY SIZE                                      04540000
004550       INTO NR-REFORD-OORD OF VMDZ510I.                           04550000
004560                                                                  04560000
004570* EXTRA'S ANNIE STEPPE                                            04570000
004580           STRING 'X'                                             04580000
004590            '000000'                                              04590000
004600            '      '                                              04600000
004610              DELIMITED BY SIZE                                   04610000
004620       INTO NR-TRANS-OORD  OF VMDZ510I.                           04620000
004630* 10=AGENCY 11=ZETEL                                              04630000
004640*    IF NR-CIO-FORM-AS OF VMDZ510I =                              04640000
004650*       NR-CIW-FORM-AS OF VMDZ510I                                04650000
004660              MOVE '10' TO CO-TYPKAN2-OORD OF VMDZ510I            04660000
004670*    ELSE                                                         04670000
004680*      MOVE '11' TO CO-TYPKAN2-OORD OF VMDZ510I                   04680000
004690*    END-IF.                                                      04690000
004700              MOVE 'DX' TO CO-BANK-OORD OF VMDZ510I.              04700000
004710                                                                  04710000
004720              MOVE WS-OLD-CI TO NR-CIINPTR-OORD OF VMDZ510I.      04720000
004730                                                                  04730000
004740*----------------------------------------------------------------*04740000
004750 WRITE-MUTATIES.                                                  04750000
004760*--------------                                                   04760000
004770     ADD 1 TO WS-COUNT-TREATED                                    04770000
004780     WRITE FO-MUTATIES-REC FROM VMDZ510I                          04780000
004790     .                                                            04790000
004800                                                                  04800000
004810*----------------------------------------------------------------*04810000
004820 READ-MUTATIES.                                                   04820000
004830*-------------                                                    04830000
004840     READ FI-MUTATIES INTO    WS-MUTATIES                         04840000
004850        AT END                                                    04850000
004860        SET MUTATIES-EOF TO TRUE                                  04860000
004870     NOT AT END                                                   04870000
004880        ADD 1 TO WS-TOTAL-INPUT                                   04880000
004890        CONTINUE                                                  04890000
004900     END-READ                                                     04900000
004910     .                                                            04910000
004920                                                                  04920000
004930/---------------------------------------------------------------* 04930000
004940*    ERROR HANDLING                                               04940000
004950*---------------------------------------------------------------* 04950000
004960                                                                  04960000
004970                                                                  04970000
004980 600-GET-TIMESTAMP.                                               04980000
004990D    DISPLAY '600-GET-TIMESTAMP.'                                 04990000
005000     MOVE FUNCTION CURRENT-DATE TO TS-SYSTEM.                     05000000
005010     MOVE CC OF TS-SYSTEM       TO CC OF TS-TIMESTAMP             05010000
005020     MOVE YY OF TS-SYSTEM       TO YY OF TS-TIMESTAMP             05020000
005030     MOVE MM OF TS-SYSTEM       TO MM OF TS-TIMESTAMP             05030000
005040     MOVE DD OF TS-SYSTEM       TO DD OF TS-TIMESTAMP             05040000
005050     MOVE HH OF TS-SYSTEM       TO HH OF TS-TIMESTAMP             05050000
005060     MOVE MI OF TS-SYSTEM       TO MI OF TS-TIMESTAMP             05060000
005070     MOVE SS OF TS-SYSTEM       TO SS OF TS-TIMESTAMP             05070000
005080     MOVE TT OF TS-SYSTEM       TO TT OF TS-TIMESTAMP             05080000
005090     DISPLAY 'TIMESTAMP: ' TS-TIMESTAMP                           05090000
005100     .                                                            05100000
005110                                                                  05110000
005120*SQLERROR ROUTINE.                                                05120000
005130     EXEC SQL                                                     05130000
005140          INCLUDE SQLERROR                                        05140000
005150     END-EXEC.                                                    05150000
