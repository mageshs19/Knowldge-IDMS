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
000670 01  WS-VAR.                                                      00670000
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
000870   02 WS-COUNT-TREATED              PIC 9(15) VALUE ZEROES.       00870000
000880   02 WS-TOTAL-INPUT PIC S9(11) COMP-3 VALUE +0.                  00880000
000890 01  USERABEN                   PIC X(8) VALUE 'USERABEN'.        00890000
000900                                                                  00900000
000910 01  CS-VM4BD310                PIC X(8) VALUE 'VMDZ4310'.        00910000
000920                                                                  00920000
000930*---------------------------------------------------------------* 00930000
000940*--- COPYBOOKS                                                    00940000
000950*---------------------------------------------------------------* 00950000
000960     COPY VMDZ510I.                                               00960000
000970                                                                  00970000
000980     COPY VMDZ05.                                                 00980000
000990                                                                  00990000
001000*---------------------------------------------------------------* 01000000
001010*--- SWITCHES                                                     01010000
001020*---------------------------------------------------------------* 01020000
001030 01  SW-MUTATIES-EOF            PIC X.                            01030000
001040     88 MUTATIES-NOT-EOF                  VALUE 'N'.              01040000
001050     88 MUTATIES-EOF                      VALUE 'Y'.              01050000
001060                                                                  01060000
001070                                                                  01070000
001080                                                                  01080000
001090     EXEC SQL INCLUDE SQLERRWS END-EXEC.                          01090000
001100     EXEC SQL INCLUDE SQLCA END-EXEC.                             01100000
001110     EXEC SQL INCLUDE DZEVEFTV END-EXEC.                          01110000
001120     EXEC SQL INCLUDE DZBEFFTV END-EXEC.                          01120000
001130                                                                  01130000
001140                                                                  01140000
001150                                                                  01150000
001160                                                                  01160000
001170                                                                  01170000
001180 01  WS-DB2-GENERATED.                                            01180000
001190     10  CS-PROGRAM               PIC X(8)    VALUE 'VMDZ4310'.   01190000
001200                                                                  01200000
001210 01  WS-TIMESTAMP-FIELDS.                                         01210000
001220     05 TS-SYSTEM.                                                01220000
001230        10  DA-SYS.                                               01230000
001240            15  DA-SYS-CCYY.                                      01240000
001250                20  CC            PIC X(2).                       01250000
001260                20  YY            PIC X(2).                       01260000
001270            15  MM                PIC X(2).                       01270000
001280            15  DD                PIC X(2).                       01280000
001290        10  HR-SYS.                                               01290000
001300            15  HH                PIC X(2).                       01300000
001310            15  MI                PIC X(2).                       01310000
001320            15  SS                PIC X(2).                       01320000
001330            15  TT                PIC X(2).                       01330000
001340     05 TS-TIMESTAMP.                                             01340000
001350        10  CC                    PIC X(2).                       01350000
001360        10  YY                    PIC X(2).                       01360000
001370        10  TE-MARKER1            PIC X             VALUE '-'.    01370000
001380        10  MM                    PIC X(2).                       01380000
001390        10  TE-MARKER2            PIC X             VALUE '-'.    01390000
001400        10  DD                    PIC X(2).                       01400000
001410        10  TE-MARKER3            PIC X             VALUE '-'.    01410000
001420        10  HH                    PIC X(2).                       01420000
001430        10  TE-MARKER4            PIC X             VALUE '.'.    01430000
001440        10  MI                    PIC X(2).                       01440000
001450        10  TE-MARKER5            PIC X             VALUE '.'.    01450000
001460        10  SS                    PIC X(2).                       01460000
001470        10  TE-MARKER6            PIC X             VALUE '.'.    01470000
001480        10  TT                    PIC X(2).                       01480000
001490        10  NNNN                  PIC 9(04)         VALUE 0.      01490000
001500                                                                  01500000
001510 LINKAGE SECTION.                                                 01510000
001520*----------------                                                 01520000
001530 01  LS-PARM-INPUT.                                               01530000
001540     02  LS-PARM                PIC S9(004) COMP.                 01540000
001550     02  LS-PARAM-IND           PIC X.                            01550000
001560     02  LS-DATE8               PIC  9(008).                      01560000
001570                                                                  01570000
001580                                                                  01580000
001590 PROCEDURE DIVISION USING LS-PARM-INPUT.                          01590000
001600*=======================================                          01600000
001610     PERFORM 600-GET-TIMESTAMP.                                   01610000
001620                                                                  01620000
001630 MAIN.                                                            01630000
001640*-----                                                            01640000
001650     PERFORM INIT-TREATMENT                                       01650000
001660     PERFORM TREAT-MUTATIES UNTIL MUTATIES-EOF                    01660000
001670     PERFORM END-TREATMENT                                        01670000
001680     STOP RUN                                                     01680000
001690     .                                                            01690000
001700                                                                  01700000
001710*----------------------------------------------------------------*01710000
001720 INIT-TREATMENT.                                                  01720000
001730*---------------                                                  01730000
001740     OPEN INPUT  FI-MUTATIES                                      01740000
001750     OUTPUT FO-MUTATIES                                           01750000
001760     SET MUTATIES-NOT-EOF TO TRUE.                                01760000
001770                                                                  01770000
001780* -- BINDS VOOR IDMS                                              01780000
001790                                                                  01790000
001800                                                                  01800000
001810                                                                  01810000
001820* -- READY                                                        01820000
001830                                                                  01830000
001840     PERFORM READ-MUTATIES                                        01840000
001850     .                                                            01850000
001860                                                                  01860000
001870*----------------------------------------------------------------*01870000
001880 END-TREATMENT.                                                   01880000
001890*--------------                                                   01890000
001900* -- FINISH                                                       01900000
001910                                                                  01910000
001920     CLOSE FI-MUTATIES                                            01920000
001930     FO-MUTATIES                                                  01930000
001940                                                                  01940000
001950     DISPLAY '# TREATED    = ' WS-COUNT-TREATED                   01950000
001960     DISPLAY 'TOTAL INPUTS ='  WS-TOTAL-INPUT                     01960000
001970     .                                                            01970000
001980                                                                  01980000
001990*----------------------------------------------------------------*01990000
002000 TREAT-MUTATIES.                                                  02000000
002010*--------------                                                   02010000
002020     PERFORM SEARCH-MUTATIES.                                     02020000
002030     PERFORM MOVE-MUTATIES.                                       02030000
002040     PERFORM WRITE-MUTATIES.                                      02040000
002050     PERFORM READ-MUTATIES                                        02050000
002060     .                                                            02060000
002070                                                                  02070000
002080*----------------------------------------------------------------*02080000
002090 SEARCH-MUTATIES.                                                 02090000
002100*---------------                                                  02100000
002110     INITIALIZE DCLDZBEFFTV                                       02110000
002120     MOVE '1002'      TO CT-RKTPROD-479BEFF OF DCLDZBEFFTV.       02120000
002130*MOVEs populate the keyed SELECT.                                 02130000
002140     MOVE WS-NR-SUITE TO NS-DBSTK-479BEFF OF DCLDZBEFFTV.         02140000
002150                                                                  02150000
002160*DB2: Expanded LRF FIRST VMBTL07-R01 WHERE ALL-VMBEVEF-BY-VMBEFF  02160000
002170*  -> VMBEVEF WITHIN VMBEFF-VMBEVEF.                              02170000
002180*DB2: LRF path ALL-VMBEVEF-BY-VMBEFF keyed parent access on VMBEFF02180000
002190*  (CALC).                                                        02190000
002200*DB2: LRF keyed parent read for VMBEFF -> keyed SELECT.           02200000
002210     MOVE WS-IN-NR-TIT-BC(1:12)                                   02210000
002220     TO NR-IDSTOCK-479BEFF OF DCLDZBEFFTV.                        02220000
002230     IF WS-IN-NR-TIT-BC(13:1) IS NUMERIC                          02230000
002240        MOVE WS-IN-NR-TIT-BC(13:1) TO NR-CDSTK-479BEFF            02240000
002250      OF DCLDZBEFFTV                                              02250000
002260     ELSE                                                         02260000
002270        DISPLAY 'INVALID LRF CALC KEY FOR VMBEFF'                 02270000
002280        PERFORM SQLERROR                                          02280000
002290     END-IF.                                                      02290000
002300*DB2: Converted LRF keyed parent read for VMBEFF.                 02300000
002310     MOVE 'SELECT-VMBEFF' TO SQL-LOCATION.                        02310000
002320     EXEC SQL                                                     02320000
002330    SELECT                                                        02330000
002340       NR_IDSTOCK_479BEFF,                                        02340000
002350       NS_DBSTK_479BEFF,                                          02350000
002360       AM_CNDSTK_479BEFF,                                         02360000
002370       AM_CNSTK_479BEFF,                                          02370000
002380       NR_IDISSUE_479BEFF,                                        02380000
002390       NR_CDISSUE_479BEFF,                                        02390000
002400       NX_CPCRESK_479BEFF,                                        02400000
002410       NX_CPAIDSK_479BEFF,                                        02410000
002420       AM_INTERSK_479BEFF,                                        02420000
002430       CO_IDPRKSK_479BEFF,                                        02430000
002440       NS_IRMOSTK_479BEFF,                                        02440000
002450       DA_UBSECIS_479BEFF                                         02450000
002460    INTO                                                          02460000
002470       :DCLDZBEFFTV.NR-IDSTOCK-479BEFF,                           02470000
002480       :DCLDZBEFFTV.NS-DBSTK-479BEFF,                             02480000
002490       :DCLDZBEFFTV.AM-CNDSTK-479BEFF,                            02490000
002500       :DCLDZBEFFTV.AM-CNSTK-479BEFF,                             02500000
002510       :DCLDZBEFFTV.NR-IDISSUE-479BEFF,                           02510000
002520       :DCLDZBEFFTV.NR-CDISSUE-479BEFF,                           02520000
002530       :DCLDZBEFFTV.NX-CPCRESK-479BEFF,                           02530000
002540       :DCLDZBEFFTV.NX-CPAIDSK-479BEFF,                           02540000
002550       :DCLDZBEFFTV.AM-INTERSK-479BEFF,                           02550000
002560       :DCLDZBEFFTV.CO-IDPRKSK-479BEFF,                           02560000
002570       :DCLDZBEFFTV.NS-IRMOSTK-479BEFF,                           02570000
002580       :DCLDZBEFFTV.DA-UBSECIS-479BEFF                            02580000
002590    FROM DZBEFFTV                                                 02590000
002600    WHERE                                                         02600000
002610       CT_RKTPROD_479BEFF = :DCLDZBEFFTV.CT-RKTPROD-479BEFF       02610000
002620       AND NR_IDSTOCK_479BEFF = :DCLDZBEFFTV.NR-IDSTOCK-479BEFF   02620000
002630       AND NR_CDSTK_479BEFF = :DCLDZBEFFTV.NR-CDSTK-479BEFF       02630000
002640       AND NS_DBSTK_479BEFF = :DCLDZBEFFTV.NS-DBSTK-479BEFF       02640000
002650    QUERYNO 442                                                   02650000
002660     END-EXEC                                                     02660000
002670     EVALUATE SQLCODE                                             02670000
002680       WHEN 0                                                     02680000
002690            CONTINUE                                              02690000
002700       WHEN 100                                                   02700000
002710            DISPLAY 'NO DATA FOUND FOR SELECT DZBEFFTV'           02710000
002720            PERFORM SQLERROR                                      02720000
002730       WHEN OTHER                                                 02730000
002740            MOVE 'SELECT-VMBEFF' TO SQL-LOCATION.                 02740000
002750            DISPLAY 'ERROR ON LRF KEYED PARENT SELECT '           02750000
002760                  'DZBEFFTV'                                      02760000
002770            PERFORM SQLERROR                                      02770000
002780     END-EVALUATE                                                 02780000
002790     .                                                            02790000
002800     INITIALIZE DCLDZEVEFTV                                       02800000
002810     EXEC SQL                                                     02810000
002820        SELECT NR_IDGOOD_479EVEF,                                 02820000
002830           NR_CI1POS_479EVEF,                                     02830000
002840           NR_CI26POS_479EVEF,                                    02840000
002850           DA_CREVTPD_479EVEF                                     02850000
002860        INTO                                                      02860000
002870           :DCLDZEVEFTV.NR-IDGOOD-479EVEF,                        02870000
002880           :DCLDZEVEFTV.NR-CI1POS-479EVEF,                        02880000
002890           :DCLDZEVEFTV.NR-CI26POS-479EVEF,                       02890000
002900           :DCLDZEVEFTV.DA-CREVTPD-479EVEF                        02900000
002910        FROM DZEVEFTV                                             02910000
002920        WHERE CT_RKTPROD_479BEFF = :DCLDZBEFFTV.CT-RKTPROD-479BEFF02920000
002930        AND NR_IDSTOCK_479BEFF = :DCLDZBEFFTV.NR-IDSTOCK-479BEFF  02930000
002940        AND NR_CDSTK_479BEFF = :DCLDZBEFFTV.NR-CDSTK-479BEFF      02940000
002950        AND NS_DBSTK_479BEFF = :DCLDZBEFFTV.NS-DBSTK-479BEFF      02950000
002960        AND CT_RKTEVPR_479EVEF = '0092'                           02960000
002970        ORDER BY NR_ID_479EVEF DESC                               02970000
002980        FETCH FIRST ROW ONLY                                      02980000
002990        QUERYNO 254                                               02990000
003000     END-EXEC                                                     03000000
003010     IF SQLCODE NOT = 0 AND SQLCODE NOT = 100                     03010000
003020        DISPLAY 'ERROR ON BOUNDED LRF SELECT'                     03020000
003030        PERFORM SQLERROR                                          03030000
003040     END-IF.                                                      03040000
003050                                                                  03050000
003060*                                                                 03060000
003070     IF SQLCODE = 100                                             03070000
003080        DISPLAY 'NO DATA FOUND FOR BOUNDED LRF SELECT'            03080000
003090        DISPLAY 'K1=' CT-RKTPROD-479BEFF OF DCLDZBEFFTV           03090000
003100        DISPLAY 'K2=' NR-IDSTOCK-479BEFF OF DCLDZBEFFTV           03100000
003110        DISPLAY 'K3=' NR-CDSTK-479BEFF OF DCLDZBEFFTV             03110000
003120        DISPLAY 'K4=' NS-DBSTK-479BEFF OF DCLDZBEFFTV             03120000
003130        CALL USERABEN                                             03130000
003140     END-IF.                                                      03140000
003150                                                                  03150000
003160* -- ZOEK DE MUTATIE                                              03160000
003170                                                                  03170000
003180                                                                  03180000
003190*----------------------------------------------------------------*03190000
003200 MOVE-MUTATIES.                                                   03200000
003210*-------------                                                    03210000
003220     INITIALIZE VMDZ510I                                          03220000
003230     REPLACING ALPHANUMERIC BY SPACES                             03230000
003240     NUMERIC BY ZEROES.                                           03240000
003250                                                                  03250000
003260     MOVE NR-IDGOOD-479EVEF OF DCLDZEVEFTV TO WS-NR-ID-GOOD.      03260000
003270                                                                  03270000
003280     MOVE NR-CI1POS-479EVEF OF DCLDZEVEFTV TO NR-CIO-FORM-AS(1:1) 03280000
003290       OF VMDZ510I.                                               03290000
003300     MOVE NR-CI26POS-479EVEF OF DCLDZEVEFTV TO NR-CIO-FORM-AS(2:5)03300000
003310       OF VMDZ510I.                                               03310000
003320     MOVE WS-DA-CREA TO DA-CREA-FORM-AS-R OF VMDZ510I.            03320000
003330     STRING DA-CR-FORM-AS-Y   OF VMDZ510I '-'                     03330000
003340        DA-CR-FORM-AS-M   OF VMDZ510I '-'                         03340000
003350        DA-CR-FORM-AS-D   OF VMDZ510I '-'                         03350000
003360            '01.01.01.000001'                                     03360000
003370        DELIMITED BY SIZE                                         03370000
003380       INTO TS-CREA-OORD      OF VMDZ510I.                        03380000
003390        MOVE WS-NR-ID  TO NR-ID-FORM-AS OF VMDZ510I.              03390000
003400        MOVE WS-CT-OPG TO CT-OPG-FORM-AS-R OF VMDZ510I.           03400000
003410        MOVE WS-CT-OPD TO CT-OPD-FORM-AS-R OF VMDZ510I.           03410000
003420                                                                  03420000
003430        MOVE NR-IDISSUE-479BEFF OF DCLDZBEFFTV TO WS-NR-ID-ISSUE  03430000
003440        MOVE NR-CDISSUE-479BEFF OF DCLDZBEFFTV TO WS-NR-CD-ISSUE  03440000
003450        MOVE WS-NR-ISSUE TO NR-ISSUIN-OORD OF VMDZ510I.           03450000
003460        MOVE AM-CNSTK-479BEFF OF DCLDZBEFFTV                      03460000
003470       TO AM-CNS-FORM-AS      OF VMDZ510I.                        03470000
003480        MOVE NR-IDSTOCK-479BEFF OF DCLDZBEFFTV TO                 03480000
003490       NR-ST-FORM-AS-R(1:12) OF VMDZ510I.                         03490000
003500        MOVE NR-CDSTK-479BEFF OF DCLDZBEFFTV TO                   03500000
003510       NR-ST-FORM-AS-R(13:1)                                      03510000
003520       OF VMDZ510I.                                               03520000
003530        MOVE NR-IDSTOCK-479BEFF OF DCLDZBEFFTV TO                 03530000
003540       NR-STIN-OORD(1:12)                                         03540000
003550       OF VMDZ510I.                                               03550000
003560        MOVE NR-CDSTK-479BEFF OF DCLDZBEFFTV TO NR-STIN-OORD(13:1)03560000
003570       OF VMDZ510I.                                               03570000
003580        MOVE SPACES TO NR-STIN-OORD(14:1) OF VMDZ510I.            03580000
003590        MOVE NS-DBSTK-479BEFF OF DCLDZBEFFTV                      03590000
003600       TO NS-DBST-OORD        OF VMDZ510I.                        03600000
003610        IF NX-CPCRESK-479BEFF OF DCLDZBEFFTV = 0                  03610000
003620           MOVE AM-CNDSTK-479BEFF OF DCLDZBEFFTV                  03620000
003630         TO AM-CND-FORM-AS      OF VMDZ510I                       03630000
003640        ELSE                                                      03640000
003650           MOVE AM-INTERSK-479BEFF OF DCLDZBEFFTV                 03650000
003660         TO AM-INTER-FORM-AS    OF VMDZ510I                       03660000
003670        END-IF.                                                   03670000
003680        MOVE CO-IDPRKSK-479BEFF OF DCLDZBEFFTV                    03680000
003690       TO NR-ID-040SECU       OF VMDZ510I.                        03690000
003700        MOVE NS-IRMOSTK-479BEFF OF DCLDZBEFFTV                    03700000
003710       TO NS-SEQ-040IRMO      OF VMDZ510I.                        03710000
003720        MOVE DA-UBSECIS-479BEFF OF DCLDZBEFFTV                    03720000
003730       TO DA-UB-FORM-AS       OF VMDZ510I.                        03730000
003740        MOVE DA-CREVTPD-479EVEF OF DCLDZEVEFTV                    03740000
003750       TO DA-COMPTABILISATION-OPER OF VMDZ510I.                   03750000
003760        MOVE DA-CREVTPD-479EVEF OF DCLDZEVEFTV                    03760000
003770       TO DA-EXEC-OORD        OF VMDZ510I.                        03770000
003780                                                                  03780000
003790        MOVE NX-CPCRESK-479BEFF OF DCLDZBEFFTV                    03790000
003800       TO NS-RANK-COUP        OF VMDZ510I.                        03800000
003810        MOVE NX-CPAIDSK-479BEFF OF DCLDZBEFFTV                    03810000
003820       TO NX-CPAID-STOCK      OF VMDZ510I.                        03820000
003830*    MOVE NX-CPFDU-STOCK      OF VMBEFF                           03830000
003840                                                                  03840000
003850* EXTRA ZONES OPVULLEN                                            03850000
003860                                                                  03860000
003870        EVALUATE WS-CT-OPD                                        03870000
003880          WHEN 00                                                 03880000
003890               MOVE 'MU' TO CO-TYPOPER-OORD OF VMDZ510I           03890000
003900          WHEN OTHER                                              03900000
003910               MOVE '??' TO CO-TYPOPER-OORD OF VMDZ510I           03910000
003920               DISPLAY 'ABEND VERKEERDE CT-OPD = '                03920000
003930               WS-CT-OPD                                          03930000
003940               DISPLAY DCLDZBEFFTV                                03940000
003950               DISPLAY DCLDZEVEFTV                                03950000
003960               CALL USERABEN                                      03960000
003970        END-EVALUATE.                                             03970000
003980* UITGIFTE = SRW DUS '1'                                          03980000
003990        MOVE '1' TO CO-ISSUIN-OORD OF VMDZ510I.                   03990000
004000        MOVE 001 TO NB-ST-OORD OF VMDZ510I.                       04000000
004010* EFFECT = IKB = DEXIA DUS '1'                                    04010000
004020        MOVE '1' TO CO-STIN-OORD OF VMDZ510I.                     04020000
004030                                                                  04030000
004040        ADD 1 TO VOLGNUMMER.                                      04040000
004050        STRING 'CIR '                                             04050000
004060           CT-OPD-FORM-AS OF VMDZ510I ' '                         04060000
004070           VOLGNUMMER                                             04070000
004080           DELIMITED BY SIZE                                      04080000
004090       INTO NR-REFORD-OORD OF VMDZ510I.                           04090000
004100                                                                  04100000
004110* EXTRA'S ANNIE STEPPE                                            04110000
004120           STRING 'X'                                             04120000
004130            '000000'                                              04130000
004140            '      '                                              04140000
004150              DELIMITED BY SIZE                                   04150000
004160       INTO NR-TRANS-OORD  OF VMDZ510I.                           04160000
004170* 10=AGENCY 11=ZETEL                                              04170000
004180*    IF NR-CIO-FORM-AS OF VMDZ510I =                              04180000
004190*       NR-CIW-FORM-AS OF VMDZ510I                                04190000
004200              MOVE '10' TO CO-TYPKAN2-OORD OF VMDZ510I            04200000
004210*    ELSE                                                         04210000
004220*      MOVE '11' TO CO-TYPKAN2-OORD OF VMDZ510I                   04220000
004230*    END-IF.                                                      04230000
004240              MOVE 'DX' TO CO-BANK-OORD OF VMDZ510I.              04240000
004250                                                                  04250000
004260              MOVE WS-OLD-CI TO NR-CIINPTR-OORD OF VMDZ510I.      04260000
004270                                                                  04270000
004280*----------------------------------------------------------------*04280000
004290 WRITE-MUTATIES.                                                  04290000
004300*--------------                                                   04300000
004310     ADD 1 TO WS-COUNT-TREATED                                    04310000
004320     WRITE FO-MUTATIES-REC FROM VMDZ510I                          04320000
004330     .                                                            04330000
004340                                                                  04340000
004350*----------------------------------------------------------------*04350000
004360 READ-MUTATIES.                                                   04360000
004370*-------------                                                    04370000
004380     READ FI-MUTATIES INTO    WS-MUTATIES                         04380000
004390        AT END                                                    04390000
004400        SET MUTATIES-EOF TO TRUE                                  04400000
004410     NOT AT END                                                   04410000
004420        ADD 1 TO WS-TOTAL-INPUT                                   04420000
004430        CONTINUE                                                  04430000
004440     END-READ                                                     04440000
004450     .                                                            04450000
004460                                                                  04460000
004470/---------------------------------------------------------------* 04470000
004480*    ERROR HANDLING                                               04480000
004490*---------------------------------------------------------------* 04490000
004500                                                                  04500000
004510                                                                  04510000
004520 600-GET-TIMESTAMP.                                               04520000
004530D    DISPLAY '600-GET-TIMESTAMP.'                                 04530000
004540     MOVE FUNCTION CURRENT-DATE TO TS-SYSTEM.                     04540000
004550     MOVE CC OF TS-SYSTEM       TO CC OF TS-TIMESTAMP             04550000
004560     MOVE YY OF TS-SYSTEM       TO YY OF TS-TIMESTAMP             04560000
004570     MOVE MM OF TS-SYSTEM       TO MM OF TS-TIMESTAMP             04570000
004580     MOVE DD OF TS-SYSTEM       TO DD OF TS-TIMESTAMP             04580000
004590     MOVE HH OF TS-SYSTEM       TO HH OF TS-TIMESTAMP             04590000
004600     MOVE MI OF TS-SYSTEM       TO MI OF TS-TIMESTAMP             04600000
004610     MOVE SS OF TS-SYSTEM       TO SS OF TS-TIMESTAMP             04610000
004620     MOVE TT OF TS-SYSTEM       TO TT OF TS-TIMESTAMP             04620000
004630     DISPLAY 'TIMESTAMP: ' TS-TIMESTAMP                           04630000
004640     .                                                            04640000
004650                                                                  04650000
004660*SQLERROR ROUTINE.                                                04660000
004670     EXEC SQL                                                     04670000
004680          INCLUDE SQLERROR                                        04680000
004690     END-EXEC.                                                    04690000
