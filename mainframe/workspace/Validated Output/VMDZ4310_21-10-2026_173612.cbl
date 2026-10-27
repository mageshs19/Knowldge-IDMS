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
000590 01  W-DATE              PIC 9(8).                                00590000
000600 01  W-DATE-X REDEFINES W-DATE.                                   00600000
000610     05  W-DATE-Y        PIC 9(4).                                00610000
000620     05  W-DATE-M        PIC 9(2).                                00620000
000630     05  W-DATE-D        PIC 9(2).                                00630000
000640                                                                  00640000
000650 01  VOLGNUMMER                 PIC 9(07) VALUE ZEROES.           00650000
000660 01  COUNT-TREATED              PIC 9(15) VALUE ZEROES.           00660000
000670                                                                  00670000
000680 01  WS-NR-ISSUE.                                                 00680000
000690     03  WS-NR-ID-ISSUE PIC X(7).                                 00690000
000700     03  WS-NR-CD-ISSUE PIC X(2).                                 00700000
000710                                                                  00710000
000720* -- CLE DU FORMULAIRE --                                         00720000
000730 01  WS-NR-ID-GOOD.                                               00730000
000740     03  WS-NR-CIO              PIC 9(8)    COMP-3.               00740000
000750     03  WS-DA-CREA             PIC 9(8)    COMP-3.               00750000
000760     03  WS-NR-ID               PIC 9(6)    COMP-3.               00760000
000770     03  WS-CT-OPD              PIC 999     COMP-3.               00770000
000780     03  WS-CT-OPG              PIC 999     COMP-3.               00780000
000790     03  FILLER                 PIC XX      VALUE SPACES.         00790000
000800                                                                  00800000
000810 01  WS-MUTATIES.                                                 00810000
000820     03 WS-IN-NR-TIT-BC PIC X(13).                                00820000
000830     03 WS-NR-SUITE     PIC X(2).                                 00830000
000840     03 WS-OLD-CI       PIC X(6).                                 00840000
000850                                                                  00850000
000860* ----- USERABEN -----                                            00860000
000870 01  USERABEN                   PIC X(8) VALUE 'USERABEN'.        00870000
000880                                                                  00880000
000890 01  CS-VM4BD310                PIC X(8) VALUE 'VMDZ4310'.        00890000
000900                                                                  00900000
000910*---------------------------------------------------------------* 00910000
000920*--- COPYBOOKS                                                    00920000
000930*---------------------------------------------------------------* 00930000
000940     COPY VMDZ510I.                                               00940000
000950                                                                  00950000
000960     COPY VMDZ05.                                                 00960000
000970                                                                  00970000
000980*---------------------------------------------------------------* 00980000
000990*--- SWITCHES                                                     00990000
001000*---------------------------------------------------------------* 01000000
001010 01  SW-MUTATIES-EOF            PIC X.                            01010000
001020     88 MUTATIES-NOT-EOF                  VALUE 'N'.              01020000
001030     88 MUTATIES-EOF                      VALUE 'Y'.              01030000
001040                                                                  01040000
001050                                                                  01050000
001060                                                                  01060000
001070*DB2 INFRASTRUCTURE - SQLCA, INCLUDES, FLAGS                   *  01070000
001080     EXEC SQL INCLUDE SQLERRWS END-EXEC.                          01080000
001090     EXEC SQL INCLUDE SQLCA END-EXEC.                             01090000
001100     EXEC SQL INCLUDE DZEVEFTV END-EXEC.                          01100000
001110     EXEC SQL INCLUDE DZBEFFTV END-EXEC.                          01110000
001120                                                                  01120000
001130*DB2 CURSOR END-OF-CURSOR FLAGS                                *  01130000
001140*DB2: Removed obsolete cursor EOC flag declaration.               01140000
001150*DB2: Removed obsolete cursor EOC flag declaration.               01150000
001160*DB2: Removed obsolete cursor EOC flag declaration.               01160000
001170                                                                  01170000
001180                                                                  01180000
001190*DB2 CURSOR DECLARATIONS                                       *  01190000
001200*DB2: Bounded LRF cursor declaration replaced by singleton SELECT.01200000
001210                                                                  01210000
001220                                                                  01220000
001230*DB2 GENERATED WORKING STORAGE                                    01230000
001240 01  WS-DB2-GENERATED.                                            01240000
001250     10  CS-PROGRAM               PIC X(8)    VALUE 'VMDZ4310'.   01250000
001260                                                                  01260000
001270*DB2 GENERATED TIMESTAMP AND AUDIT WORKING STORAGE                01270000
001280 01  WS-TIMESTAMP-FIELDS.                                         01280000
001290     05 TS-SYSTEM.                                                01290000
001300        10  DA-SYS.                                               01300000
001310            15  DA-SYS-CCYY.                                      01310000
001320                20  CC            PIC X(2).                       01320000
001330                20  YY            PIC X(2).                       01330000
001340            15  MM                PIC X(2).                       01340000
001350            15  DD                PIC X(2).                       01350000
001360        10  HR-SYS.                                               01360000
001370            15  HH                PIC X(2).                       01370000
001380            15  MI                PIC X(2).                       01380000
001390            15  SS                PIC X(2).                       01390000
001400            15  TT                PIC X(2).                       01400000
001410     05 TS-TIMESTAMP.                                             01410000
001420        10  CC                    PIC X(2).                       01420000
001430        10  YY                    PIC X(2).                       01430000
001440        10  TE-MARKER1            PIC X             VALUE '-'.    01440000
001450        10  MM                    PIC X(2).                       01450000
001460        10  TE-MARKER2            PIC X             VALUE '-'.    01460000
001470        10  DD                    PIC X(2).                       01470000
001480        10  TE-MARKER3            PIC X             VALUE '-'.    01480000
001490        10  HH                    PIC X(2).                       01490000
001500        10  TE-MARKER4            PIC X             VALUE '.'.    01500000
001510        10  MI                    PIC X(2).                       01510000
001520        10  TE-MARKER5            PIC X             VALUE '.'.    01520000
001530        10  SS                    PIC X(2).                       01530000
001540        10  TE-MARKER6            PIC X             VALUE '.'.    01540000
001550        10  TT                    PIC X(2).                       01550000
001560        10  NNNN                  PIC 9(04)         VALUE 0.      01560000
001570                                                                  01570000
001580 LINKAGE SECTION.                                                 01580000
001590*----------------                                                 01590000
001600 01  LS-PARM-INPUT.                                               01600000
001610     02  LS-PARM                PIC S9(004) COMP.                 01610000
001620     02  LS-PARAM-IND           PIC X.                            01620000
001630     02  LS-DATE8               PIC  9(008).                      01630000
001640                                                                  01640000
001650                                                                  01650000
001660 PROCEDURE DIVISION USING LS-PARM-INPUT.                          01660000
001670*=======================================                          01670000
001680     PERFORM 600-GET-TIMESTAMP.                                   01680000
001690                                                                  01690000
001700 MAIN.                                                            01700000
001710*-----                                                            01710000
001720     PERFORM INIT-TREATMENT                                       01720000
001730     PERFORM TREAT-MUTATIES UNTIL MUTATIES-EOF                    01730000
001740     PERFORM END-TREATMENT                                        01740000
001750     STOP RUN                                                     01750000
001760     .                                                            01760000
001770                                                                  01770000
001780*----------------------------------------------------------------*01780000
001790 INIT-TREATMENT.                                                  01790000
001800*---------------                                                  01800000
001810     OPEN INPUT  FI-MUTATIES                                      01810000
001820     OUTPUT FO-MUTATIES                                           01820000
001830     SET MUTATIES-NOT-EOF TO TRUE.                                01830000
001840                                                                  01840000
001850* -- BINDS VOOR IDMS                                              01850000
001860                                                                  01860000
001870                                                                  01870000
001880                                                                  01880000
001890* -- READY                                                        01890000
001900                                                                  01900000
001910     PERFORM READ-MUTATIES                                        01910000
001920     .                                                            01920000
001930                                                                  01930000
001940*----------------------------------------------------------------*01940000
001950 END-TREATMENT.                                                   01950000
001960*--------------                                                   01960000
001970* -- FINISH                                                       01970000
001980                                                                  01980000
001990     CLOSE FI-MUTATIES                                            01990000
002000     FO-MUTATIES                                                  02000000
002010                                                                  02010000
002020     DISPLAY '# TREATED  = ' COUNT-TREATED                        02020000
002030     .                                                            02030000
002040                                                                  02040000
002050*----------------------------------------------------------------*02050000
002060 TREAT-MUTATIES.                                                  02060000
002070*--------------                                                   02070000
002080     PERFORM SEARCH-MUTATIES.                                     02080000
002090     PERFORM MOVE-MUTATIES.                                       02090000
002100     PERFORM WRITE-MUTATIES.                                      02100000
002110     PERFORM READ-MUTATIES                                        02110000
002120     .                                                            02120000
002130                                                                  02130000
002140*----------------------------------------------------------------*02140000
002150 SEARCH-MUTATIES.                                                 02150000
002160*---------------                                                  02160000
002170*DB2: Removed redundant key-group clear; all mapped CALC key      02170000
002180*components are initialized and assigned before SELECT.           02180000
002190     INITIALIZE DCLDZBEFFTV                                       02190000
002200     MOVE '1002'      TO CT-RKTPROD-479BEFF OF DCLDZBEFFTV.       02200000
002210*MOVEs populate the keyed SELECT.                                 02210000
002220     MOVE WS-NR-SUITE TO NS-DBSTK-479BEFF OF DCLDZBEFFTV.         02220000
002230                                                                  02230000
002240*DB2: Expanded LRF FIRST VMBTL07-R01 WHERE ALL-VMBEVEF-BY-VMBEFF  02240000
002250*  -> VMBEVEF WITHIN VMBEFF-VMBEVEF.                              02250000
002260*DB2: LRF path ALL-VMBEVEF-BY-VMBEFF keyed parent access on VMBEFF02260000
002270*  (CALC).                                                        02270000
002280*DB2: LRF keyed parent read for VMBEFF -> keyed SELECT.           02280000
002290     MOVE WS-IN-NR-TIT-BC(1:12)                                   02290000
002300     TO NR-IDSTOCK-479BEFF OF DCLDZBEFFTV.                        02300000
002310     IF WS-IN-NR-TIT-BC(13:1) IS NUMERIC                          02310000
002320        MOVE WS-IN-NR-TIT-BC(13:1) TO NR-CDSTK-479BEFF            02320000
002330      OF DCLDZBEFFTV                                              02330000
002340     ELSE                                                         02340000
002350        DISPLAY 'INVALID LRF CALC KEY FOR VMBEFF'                 02350000
002360        PERFORM SQLERROR                                          02360000
002370     END-IF.                                                      02370000
002380*DB2: Converted LRF keyed parent read for VMBEFF.                 02380000
002390     MOVE 'SELECT-VMBEFF' TO SQL-LOCATION.                        02390000
002400     EXEC SQL                                                     02400000
002410    SELECT                                                        02410000
002420       CT_RKTPROD_479BEFF,                                        02420000
002430       NR_IDSTOCK_479BEFF,                                        02430000
002440       NR_CDSTK_479BEFF,                                          02440000
002450       NS_DBSTK_479BEFF,                                          02450000
002460       AM_CNDSTK_479BEFF,                                         02460000
002470       AM_CNSTK_479BEFF,                                          02470000
002480       CT_RKTPRDX_479BEFF,                                        02480000
002490       NR_IDISSUE_479BEFF,                                        02490000
002500       NR_CDISSUE_479BEFF,                                        02500000
002510       NX_CPCRESK_479BEFF,                                        02510000
002520       NX_CPAIDSK_479BEFF,                                        02520000
002530       NX_CPFDUSK_479BEFF,                                        02530000
002540       AM_INTERSK_479BEFF,                                        02540000
002550       CO_IDPRKSK_479BEFF,                                        02550000
002560       NS_IRMOSTK_479BEFF,                                        02560000
002570       DA_UBSECIS_479BEFF                                         02570000
002580    INTO                                                          02580000
002590       :DCLDZBEFFTV.CT-RKTPROD-479BEFF,                           02590000
002600       :DCLDZBEFFTV.NR-IDSTOCK-479BEFF,                           02600000
002610       :DCLDZBEFFTV.NR-CDSTK-479BEFF,                             02610000
002620       :DCLDZBEFFTV.NS-DBSTK-479BEFF,                             02620000
002630       :DCLDZBEFFTV.AM-CNDSTK-479BEFF,                            02630000
002640       :DCLDZBEFFTV.AM-CNSTK-479BEFF,                             02640000
002650       :DCLDZBEFFTV.CT-RKTPRDX-479BEFF,                           02650000
002660       :DCLDZBEFFTV.NR-IDISSUE-479BEFF,                           02660000
002670       :DCLDZBEFFTV.NR-CDISSUE-479BEFF,                           02670000
002680       :DCLDZBEFFTV.NX-CPCRESK-479BEFF,                           02680000
002690       :DCLDZBEFFTV.NX-CPAIDSK-479BEFF,                           02690000
002700       :DCLDZBEFFTV.NX-CPFDUSK-479BEFF,                           02700000
002710       :DCLDZBEFFTV.AM-INTERSK-479BEFF,                           02710000
002720       :DCLDZBEFFTV.CO-IDPRKSK-479BEFF,                           02720000
002730       :DCLDZBEFFTV.NS-IRMOSTK-479BEFF,                           02730000
002740       :DCLDZBEFFTV.DA-UBSECIS-479BEFF                            02740000
002750    FROM DZBEFFTV                                                 02750000
002760    WHERE                                                         02760000
002770       CT_RKTPROD_479BEFF = :DCLDZBEFFTV.CT-RKTPROD-479BEFF       02770000
002780       AND NR_IDSTOCK_479BEFF = :DCLDZBEFFTV.NR-IDSTOCK-479BEFF   02780000
002790       AND NR_CDSTK_479BEFF = :DCLDZBEFFTV.NR-CDSTK-479BEFF       02790000
002800       AND NS_DBSTK_479BEFF = :DCLDZBEFFTV.NS-DBSTK-479BEFF       02800000
002810    QUERYNO 442                                                   02810000
002820     END-EXEC                                                     02820000
002830     EVALUATE SQLCODE                                             02830000
002840       WHEN 0                                                     02840000
002850            CONTINUE                                              02850000
002860       WHEN 100                                                   02860000
002870            DISPLAY 'NO DATA FOUND FOR SELECT DZBEFFTV'           02870000
002880            PERFORM SQLERROR                                      02880000
002890       WHEN OTHER                                                 02890000
002900            MOVE 'SELECT-VMBEFF' TO SQL-LOCATION.                 02900000
002910            DISPLAY 'ERROR ON LRF KEYED PARENT SELECT '           02910000
002920                  'DZBEFFTV'                                      02920000
002930            PERFORM SQLERROR                                      02930000
002940     END-EVALUATE                                                 02940000
002950     .                                                            02950000
002960     INITIALIZE DCLDZEVEFTV                                       02960000
002970 EXEC SQL                                                         02970000
002980 SELECT CT_RKTEVPR_479EVEF                                        02980000
002990    , DA_CREVTPD_479EVEF                                          02990000
003000    , NR_CI1POS_479EVEF                                           03000000
003010    , NR_CI26POS_479EVEF                                          03010000
003020    , NR_IDGOOD_479EVEF                                           03020000
003030    , NR_ID_479EVEF                                               03030000
003040 INTO                                                             03040000
003050    :DCLDZEVEFTV.CT-RKTEVPR-479EVEF,                              03050000
003060    :DCLDZEVEFTV.DA-CREVTPD-479EVEF,                              03060000
003070    :DCLDZEVEFTV.NR-CI1POS-479EVEF,                               03070000
003080    :DCLDZEVEFTV.NR-CI26POS-479EVEF,                              03080000
003090    :DCLDZEVEFTV.NR-IDGOOD-479EVEF,                               03090000
003100    :DCLDZEVEFTV.NR-ID-479EVEF                                    03100000
003110 FROM DZEVEFTV                                                    03110000
003120 WHERE CT_RKTPROD_479BEFF = :DCLDZBEFFTV.CT-RKTPROD-479BEFF       03120000
003130 AND NR_IDSTOCK_479BEFF = :DCLDZBEFFTV.NR-IDSTOCK-479BEFF         03130000
003140 AND NR_CDSTK_479BEFF = :DCLDZBEFFTV.NR-CDSTK-479BEFF             03140000
003150 AND NS_DBSTK_479BEFF = :DCLDZBEFFTV.NS-DBSTK-479BEFF             03150000
003160 AND CT_RKTEVPR_479EVEF = '0092'                                  03160000
003170 ORDER BY NR_ID_479EVEF DESC                                      03170000
003180 FETCH FIRST 1 ROW ONLY                                           03180000
003190 QUERYNO 254                                                      03190000
003200 END-EXEC                                                         03200000
003210 IF SQLCODE NOT = 0 AND SQLCODE NOT = 100                         03210000
003220    DISPLAY 'ERROR ON BOUNDED LRF SELECT'                         03220000
003230    PERFORM SQLERROR                                              03230000
003240 END-IF.                                                          03240000
003250                                                                  03250000
003260*DB2: Bounded singleton SELECT no-data handling follows.          03260000
003270*                                                                 03270000
003280     IF SQLCODE = 100                                             03280000
003290        DISPLAY 'NO DATA FOUND FOR BOUNDED LRF SELECT'            03290000
003300        DISPLAY 'K1=' CT-RKTPROD-479BEFF OF DCLDZBEFFTV           03300000
003310        DISPLAY 'K2=' NR-IDSTOCK-479BEFF OF DCLDZBEFFTV           03310000
003320        DISPLAY 'K3=' NR-CDSTK-479BEFF OF DCLDZBEFFTV             03320000
003330        DISPLAY 'K4=' NS-DBSTK-479BEFF OF DCLDZBEFFTV             03330000
003340        CALL USERABEN                                             03340000
003350     END-IF.                                                      03350000
003360                                                                  03360000
003370* -- ZOEK DE MUTATIE                                              03370000
003380*DB2: Removed bounded loop; predicate moved to SQL.               03380000
003390*DB2: Cursor CLOSE removed with singleton rewrite.                03390000
003400                                                                  03400000
003410*DB2: Removed cursor EOC branch; SQLCODE handles no-data.         03410000
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
003960        MOVE DA-UBSECIS-479BEFF OF DCLDZBEFFTV                    03960000
003970       TO DA-UB-FORM-AS       OF VMDZ510I.                        03970000
003980        MOVE DA-CREVTPD-479EVEF OF DCLDZEVEFTV                    03980000
003990       TO DA-COMPTABILISATION-OPER OF VMDZ510I.                   03990000
004000        MOVE DA-CREVTPD-479EVEF OF DCLDZEVEFTV                    04000000
004010       TO DA-EXEC-OORD        OF VMDZ510I.                        04010000
004020                                                                  04020000
004030        MOVE NX-CPCRESK-479BEFF OF DCLDZBEFFTV                    04030000
004040       TO NS-RANK-COUP        OF VMDZ510I.                        04040000
004050        MOVE NX-CPAIDSK-479BEFF OF DCLDZBEFFTV                    04050000
004060       TO NX-CPAID-STOCK      OF VMDZ510I.                        04060000
004070*    MOVE NX-CPFDU-STOCK      OF VMBEFF                           04070000
004080                                                                  04080000
004090* EXTRA ZONES OPVULLEN                                            04090000
004100                                                                  04100000
004110        EVALUATE WS-CT-OPD                                        04110000
004120          WHEN 00                                                 04120000
004130               MOVE 'MU' TO CO-TYPOPER-OORD OF VMDZ510I           04130000
004140          WHEN OTHER                                              04140000
004150               MOVE '??' TO CO-TYPOPER-OORD OF VMDZ510I           04150000
004160               DISPLAY 'ABEND VERKEERDE CT-OPD = '                04160000
004170               WS-CT-OPD                                          04170000
004180               DISPLAY DCLDZBEFFTV                                04180000
004190               DISPLAY DCLDZEVEFTV                                04190000
004200               CALL USERABEN                                      04200000
004210        END-EVALUATE.                                             04210000
004220* UITGIFTE = SRW DUS '1'                                          04220000
004230        MOVE '1' TO CO-ISSUIN-OORD OF VMDZ510I.                   04230000
004240        MOVE 001 TO NB-ST-OORD OF VMDZ510I.                       04240000
004250* EFFECT = IKB = DEXIA DUS '1'                                    04250000
004260        MOVE '1' TO CO-STIN-OORD OF VMDZ510I.                     04260000
004270                                                                  04270000
004280        ADD 1 TO VOLGNUMMER.                                      04280000
004290        STRING 'CIR '                                             04290000
004300           CT-OPD-FORM-AS OF VMDZ510I ' '                         04300000
004310           VOLGNUMMER                                             04310000
004320           DELIMITED BY SIZE                                      04320000
004330       INTO NR-REFORD-OORD OF VMDZ510I.                           04330000
004340                                                                  04340000
004350* EXTRA'S ANNIE STEPPE                                            04350000
004360           STRING 'X'                                             04360000
004370            '000000'                                              04370000
004380            '      '                                              04380000
004390              DELIMITED BY SIZE                                   04390000
004400       INTO NR-TRANS-OORD  OF VMDZ510I.                           04400000
004410* 10=AGENCY 11=ZETEL                                              04410000
004420*    IF NR-CIO-FORM-AS OF VMDZ510I =                              04420000
004430*       NR-CIW-FORM-AS OF VMDZ510I                                04430000
004440              MOVE '10' TO CO-TYPKAN2-OORD OF VMDZ510I            04440000
004450*    ELSE                                                         04450000
004460*      MOVE '11' TO CO-TYPKAN2-OORD OF VMDZ510I                   04460000
004470*    END-IF.                                                      04470000
004480              MOVE 'DX' TO CO-BANK-OORD OF VMDZ510I.              04480000
004490                                                                  04490000
004500              MOVE WS-OLD-CI TO NR-CIINPTR-OORD OF VMDZ510I.      04500000
004510                                                                  04510000
004520*----------------------------------------------------------------*04520000
004530 WRITE-MUTATIES.                                                  04530000
004540*--------------                                                   04540000
004550     ADD 1 TO COUNT-TREATED                                       04550000
004560     WRITE FO-MUTATIES-REC FROM VMDZ510I                          04560000
004570     .                                                            04570000
004580                                                                  04580000
004590*----------------------------------------------------------------*04590000
004600 READ-MUTATIES.                                                   04600000
004610*-------------                                                    04610000
004620     READ FI-MUTATIES INTO    WS-MUTATIES                         04620000
004630        AT END                                                    04630000
004640        SET MUTATIES-EOF TO TRUE                                  04640000
004650     NOT AT END                                                   04650000
004660        CONTINUE                                                  04660000
004670     END-READ                                                     04670000
004680     .                                                            04680000
004690                                                                  04690000
004700/---------------------------------------------------------------* 04700000
004710*    ERROR HANDLING                                               04710000
004720*---------------------------------------------------------------* 04720000
004730                                                                  04730000
004740*DB2 GENERATED CURSOR OPEN FETCH CLOSE PARAGRAPHS              *  04740000
004750                                                                  04750000
004760*DB2: Removed obsolete cursor paragraph.                          04760000
004770*DB2: Removed obsolete cursor paragraph.                          04770000
004780*DB2: Removed obsolete cursor paragraph.                          04780000
004790 600-GET-TIMESTAMP.                                               04790000
004800D    DISPLAY '600-GET-TIMESTAMP.'                                 04800000
004810     MOVE FUNCTION CURRENT-DATE TO TS-SYSTEM.                     04810000
004820     MOVE CC OF TS-SYSTEM       TO CC OF TS-TIMESTAMP             04820000
004830     MOVE YY OF TS-SYSTEM       TO YY OF TS-TIMESTAMP             04830000
004840     MOVE MM OF TS-SYSTEM       TO MM OF TS-TIMESTAMP             04840000
004850     MOVE DD OF TS-SYSTEM       TO DD OF TS-TIMESTAMP             04850000
004860     MOVE HH OF TS-SYSTEM       TO HH OF TS-TIMESTAMP             04860000
004870     MOVE MI OF TS-SYSTEM       TO MI OF TS-TIMESTAMP             04870000
004880     MOVE SS OF TS-SYSTEM       TO SS OF TS-TIMESTAMP             04880000
004890     MOVE TT OF TS-SYSTEM       TO TT OF TS-TIMESTAMP             04890000
004900     DISPLAY 'TIMESTAMP: ' TS-TIMESTAMP                           04900000
004910     .                                                            04910000
004920                                                                  04920000
004930*SQLERROR ROUTINE.                                                04930000
004940     EXEC SQL                                                     04940000
004950          INCLUDE SQLERROR                                        04950000
004960     END-EXEC.                                                    04960000
