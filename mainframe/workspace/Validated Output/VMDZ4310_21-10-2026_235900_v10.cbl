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
001070     EXEC SQL INCLUDE SQLERRWS END-EXEC.                          01070000
001080     EXEC SQL INCLUDE SQLCA END-EXEC.                             01080000
001090     EXEC SQL INCLUDE DZEVEFTV END-EXEC.                          01090000
001100     EXEC SQL INCLUDE DZBEFFTV END-EXEC.                          01100000
001110                                                                  01110000
001120                                                                  01120000
001130                                                                  01130000
001140                                                                  01140000
001150                                                                  01150000
001160 01  WS-DB2-GENERATED.                                            01160000
001170     10  CS-PROGRAM               PIC X(8)    VALUE 'VMDZ4310'.   01170000
001180                                                                  01180000
001190 01  WS-TIMESTAMP-FIELDS.                                         01190000
001200     05 TS-SYSTEM.                                                01200000
001210        10  DA-SYS.                                               01210000
001220            15  DA-SYS-CCYY.                                      01220000
001230                20  CC            PIC X(2).                       01230000
001240                20  YY            PIC X(2).                       01240000
001250            15  MM                PIC X(2).                       01250000
001260            15  DD                PIC X(2).                       01260000
001270        10  HR-SYS.                                               01270000
001280            15  HH                PIC X(2).                       01280000
001290            15  MI                PIC X(2).                       01290000
001300            15  SS                PIC X(2).                       01300000
001310            15  TT                PIC X(2).                       01310000
001320     05 TS-TIMESTAMP.                                             01320000
001330        10  CC                    PIC X(2).                       01330000
001340        10  YY                    PIC X(2).                       01340000
001350        10  TE-MARKER1            PIC X             VALUE '-'.    01350000
001360        10  MM                    PIC X(2).                       01360000
001370        10  TE-MARKER2            PIC X             VALUE '-'.    01370000
001380        10  DD                    PIC X(2).                       01380000
001390        10  TE-MARKER3            PIC X             VALUE '-'.    01390000
001400        10  HH                    PIC X(2).                       01400000
001410        10  TE-MARKER4            PIC X             VALUE '.'.    01410000
001420        10  MI                    PIC X(2).                       01420000
001430        10  TE-MARKER5            PIC X             VALUE '.'.    01430000
001440        10  SS                    PIC X(2).                       01440000
001450        10  TE-MARKER6            PIC X             VALUE '.'.    01450000
001460        10  TT                    PIC X(2).                       01460000
001470        10  NNNN                  PIC 9(04)         VALUE 0.      01470000
001480                                                                  01480000
001490 LINKAGE SECTION.                                                 01490000
001500*----------------                                                 01500000
001510 01  LS-PARM-INPUT.                                               01510000
001520     02  LS-PARM                PIC S9(004) COMP.                 01520000
001530     02  LS-PARAM-IND           PIC X.                            01530000
001540     02  LS-DATE8               PIC  9(008).                      01540000
001550                                                                  01550000
001560                                                                  01560000
001570 PROCEDURE DIVISION USING LS-PARM-INPUT.                          01570000
001580*=======================================                          01580000
001590     PERFORM 600-GET-TIMESTAMP.                                   01590000
001600                                                                  01600000
001610 MAIN.                                                            01610000
001620*-----                                                            01620000
001630     PERFORM INIT-TREATMENT                                       01630000
001640     PERFORM TREAT-MUTATIES UNTIL MUTATIES-EOF                    01640000
001650     PERFORM END-TREATMENT                                        01650000
001660     STOP RUN                                                     01660000
001670     .                                                            01670000
001680                                                                  01680000
001690*----------------------------------------------------------------*01690000
001700 INIT-TREATMENT.                                                  01700000
001710*---------------                                                  01710000
001720     OPEN INPUT  FI-MUTATIES                                      01720000
001730     OUTPUT FO-MUTATIES                                           01730000
001740     SET MUTATIES-NOT-EOF TO TRUE.                                01740000
001750                                                                  01750000
001760* -- BINDS VOOR IDMS                                              01760000
001770                                                                  01770000
001780                                                                  01780000
001790                                                                  01790000
001800* -- READY                                                        01800000
001810                                                                  01810000
001820     PERFORM READ-MUTATIES                                        01820000
001830     .                                                            01830000
001840                                                                  01840000
001850*----------------------------------------------------------------*01850000
001860 END-TREATMENT.                                                   01860000
001870*--------------                                                   01870000
001880* -- FINISH                                                       01880000
001890                                                                  01890000
001900     CLOSE FI-MUTATIES                                            01900000
001910     FO-MUTATIES                                                  01910000
001920                                                                  01920000
001930     DISPLAY '# TREATED  = ' COUNT-TREATED                        01930000
001940     .                                                            01940000
001950                                                                  01950000
001960*----------------------------------------------------------------*01960000
001970 TREAT-MUTATIES.                                                  01970000
001980*--------------                                                   01980000
001990     PERFORM SEARCH-MUTATIES.                                     01990000
002000     PERFORM MOVE-MUTATIES.                                       02000000
002010     PERFORM WRITE-MUTATIES.                                      02010000
002020     PERFORM READ-MUTATIES                                        02020000
002030     .                                                            02030000
002040                                                                  02040000
002050*----------------------------------------------------------------*02050000
002060 SEARCH-MUTATIES.                                                 02060000
002070*---------------                                                  02070000
002080     INITIALIZE DCLDZBEFFTV                                       02080000
002090     MOVE '1002'      TO CT-RKTPROD-479BEFF OF DCLDZBEFFTV.       02090000
002100*MOVEs populate the keyed SELECT.                                 02100000
002110     MOVE WS-NR-SUITE TO NS-DBSTK-479BEFF OF DCLDZBEFFTV.         02110000
002120                                                                  02120000
002130*DB2: Expanded LRF FIRST VMBTL07-R01 WHERE ALL-VMBEVEF-BY-VMBEFF  02130000
002140*  -> VMBEVEF WITHIN VMBEFF-VMBEVEF.                              02140000
002150*DB2: LRF path ALL-VMBEVEF-BY-VMBEFF keyed parent access on VMBEFF02150000
002160*  (CALC).                                                        02160000
002170*DB2: LRF keyed parent read for VMBEFF -> keyed SELECT.           02170000
002180     MOVE WS-IN-NR-TIT-BC(1:12)                                   02180000
002190     TO NR-IDSTOCK-479BEFF OF DCLDZBEFFTV.                        02190000
002200     IF WS-IN-NR-TIT-BC(13:1) IS NUMERIC                          02200000
002210        MOVE WS-IN-NR-TIT-BC(13:1) TO NR-CDSTK-479BEFF            02210000
002220      OF DCLDZBEFFTV                                              02220000
002230     ELSE                                                         02230000
002240        DISPLAY 'INVALID LRF CALC KEY FOR VMBEFF'                 02240000
002250        PERFORM SQLERROR                                          02250000
002260     END-IF.                                                      02260000
002270*DB2: Converted LRF keyed parent read for VMBEFF.                 02270000
002280     MOVE 'SELECT-VMBEFF' TO SQL-LOCATION.                        02280000
002290     EXEC SQL                                                     02290000
002300    SELECT                                                        02300000
002310       NR_IDSTOCK_479BEFF,                                        02310000
002320       NS_DBSTK_479BEFF,                                          02320000
002330       AM_CNDSTK_479BEFF,                                         02330000
002340       AM_CNSTK_479BEFF,                                          02340000
002350       NR_IDISSUE_479BEFF,                                        02350000
002360       NR_CDISSUE_479BEFF,                                        02360000
002370       NX_CPCRESK_479BEFF,                                        02370000
002380       NX_CPAIDSK_479BEFF,                                        02380000
002390       AM_INTERSK_479BEFF,                                        02390000
002400       CO_IDPRKSK_479BEFF,                                        02400000
002410       NS_IRMOSTK_479BEFF,                                        02410000
002420       DA_UBSECIS_479BEFF                                         02420000
002430    INTO                                                          02430000
002440       :DCLDZBEFFTV.NR-IDSTOCK-479BEFF,                           02440000
002450       :DCLDZBEFFTV.NS-DBSTK-479BEFF,                             02450000
002460       :DCLDZBEFFTV.AM-CNDSTK-479BEFF,                            02460000
002470       :DCLDZBEFFTV.AM-CNSTK-479BEFF,                             02470000
002480       :DCLDZBEFFTV.NR-IDISSUE-479BEFF,                           02480000
002490       :DCLDZBEFFTV.NR-CDISSUE-479BEFF,                           02490000
002500       :DCLDZBEFFTV.NX-CPCRESK-479BEFF,                           02500000
002510       :DCLDZBEFFTV.NX-CPAIDSK-479BEFF,                           02510000
002520       :DCLDZBEFFTV.AM-INTERSK-479BEFF,                           02520000
002530       :DCLDZBEFFTV.CO-IDPRKSK-479BEFF,                           02530000
002540       :DCLDZBEFFTV.NS-IRMOSTK-479BEFF,                           02540000
002550       :DCLDZBEFFTV.DA-UBSECIS-479BEFF                            02550000
002560    FROM DZBEFFTV                                                 02560000
002570    WHERE                                                         02570000
002580       CT_RKTPROD_479BEFF = :DCLDZBEFFTV.CT-RKTPROD-479BEFF       02580000
002590       AND NR_IDSTOCK_479BEFF = :DCLDZBEFFTV.NR-IDSTOCK-479BEFF   02590000
002600       AND NR_CDSTK_479BEFF = :DCLDZBEFFTV.NR-CDSTK-479BEFF       02600000
002610       AND NS_DBSTK_479BEFF = :DCLDZBEFFTV.NS-DBSTK-479BEFF       02610000
002620    QUERYNO 442                                                   02620000
002630     END-EXEC                                                     02630000
002640     EVALUATE SQLCODE                                             02640000
002650       WHEN 0                                                     02650000
002660            CONTINUE                                              02660000
002670       WHEN 100                                                   02670000
002680            DISPLAY 'NO DATA FOUND FOR SELECT DZBEFFTV'           02680000
002690            PERFORM SQLERROR                                      02690000
002700       WHEN OTHER                                                 02700000
002710            MOVE 'SELECT-VMBEFF' TO SQL-LOCATION.                 02710000
002720            DISPLAY 'ERROR ON LRF KEYED PARENT SELECT '           02720000
002730                  'DZBEFFTV'                                      02730000
002740            PERFORM SQLERROR                                      02740000
002750     END-EVALUATE                                                 02750000
002760     .                                                            02760000
002770     INITIALIZE DCLDZEVEFTV                                       02770000
002780     EXEC SQL                                                     02780000
002790        SELECT NR_IDGOOD_479EVEF,                                 02790000
002800           NR_CI1POS_479EVEF,                                     02800000
002810           NR_CI26POS_479EVEF,                                    02810000
002820           DA_CREVTPD_479EVEF                                     02820000
002830        INTO                                                      02830000
002840           :DCLDZEVEFTV.NR-IDGOOD-479EVEF,                        02840000
002850           :DCLDZEVEFTV.NR-CI1POS-479EVEF,                        02850000
002860           :DCLDZEVEFTV.NR-CI26POS-479EVEF,                       02860000
002870           :DCLDZEVEFTV.DA-CREVTPD-479EVEF                        02870000
002880        FROM DZEVEFTV                                             02880000
002890        WHERE CT_RKTPROD_479BEFF = :DCLDZBEFFTV.CT-RKTPROD-479BEFF02890000
002900        AND NR_IDSTOCK_479BEFF = :DCLDZBEFFTV.NR-IDSTOCK-479BEFF  02900000
002910        AND NR_CDSTK_479BEFF = :DCLDZBEFFTV.NR-CDSTK-479BEFF      02910000
002920        AND NS_DBSTK_479BEFF = :DCLDZBEFFTV.NS-DBSTK-479BEFF      02920000
002930        AND CT_RKTEVPR_479EVEF = '0092'                           02930000
002940        ORDER BY NR_ID_479EVEF DESC                               02940000
002950        FETCH FIRST ROW ONLY                                      02950000
002960        QUERYNO 254                                               02960000
002970     END-EXEC                                                     02970000
002980     IF SQLCODE NOT = 0 AND SQLCODE NOT = 100                     02980000
002990        DISPLAY 'ERROR ON BOUNDED LRF SELECT'                     02990000
003000        PERFORM SQLERROR                                          03000000
003010     END-IF.                                                      03010000
003020                                                                  03020000
003030*                                                                 03030000
003040     IF SQLCODE = 100                                             03040000
003050        DISPLAY 'NO DATA FOUND FOR BOUNDED LRF SELECT'            03050000
003060        DISPLAY 'K1=' CT-RKTPROD-479BEFF OF DCLDZBEFFTV           03060000
003070        DISPLAY 'K2=' NR-IDSTOCK-479BEFF OF DCLDZBEFFTV           03070000
003080        DISPLAY 'K3=' NR-CDSTK-479BEFF OF DCLDZBEFFTV             03080000
003090        DISPLAY 'K4=' NS-DBSTK-479BEFF OF DCLDZBEFFTV             03090000
003100        CALL USERABEN                                             03100000
003110     END-IF.                                                      03110000
003120                                                                  03120000
003130* -- ZOEK DE MUTATIE                                              03130000
003140                                                                  03140000
003150                                                                  03150000
003160*----------------------------------------------------------------*03160000
003170 MOVE-MUTATIES.                                                   03170000
003180*-------------                                                    03180000
003190     INITIALIZE VMDZ510I                                          03190000
003200     REPLACING ALPHANUMERIC BY SPACES                             03200000
003210     NUMERIC BY ZEROES.                                           03210000
003220                                                                  03220000
003230     MOVE NR-IDGOOD-479EVEF OF DCLDZEVEFTV TO WS-NR-ID-GOOD.      03230000
003240                                                                  03240000
003250     MOVE NR-CI1POS-479EVEF OF DCLDZEVEFTV TO NR-CIO-FORM-AS(1:1) 03250000
003260       OF VMDZ510I.                                               03260000
003270     MOVE NR-CI26POS-479EVEF OF DCLDZEVEFTV TO NR-CIO-FORM-AS(2:5)03270000
003280       OF VMDZ510I.                                               03280000
003290     MOVE WS-DA-CREA TO DA-CREA-FORM-AS-R OF VMDZ510I.            03290000
003300     STRING DA-CR-FORM-AS-Y   OF VMDZ510I '-'                     03300000
003310        DA-CR-FORM-AS-M   OF VMDZ510I '-'                         03310000
003320        DA-CR-FORM-AS-D   OF VMDZ510I '-'                         03320000
003330            '01.01.01.000001'                                     03330000
003340        DELIMITED BY SIZE                                         03340000
003350       INTO TS-CREA-OORD      OF VMDZ510I.                        03350000
003360        MOVE WS-NR-ID  TO NR-ID-FORM-AS OF VMDZ510I.              03360000
003370        MOVE WS-CT-OPG TO CT-OPG-FORM-AS-R OF VMDZ510I.           03370000
003380        MOVE WS-CT-OPD TO CT-OPD-FORM-AS-R OF VMDZ510I.           03380000
003390                                                                  03390000
003400        MOVE NR-IDISSUE-479BEFF OF DCLDZBEFFTV TO WS-NR-ID-ISSUE  03400000
003410        MOVE NR-CDISSUE-479BEFF OF DCLDZBEFFTV TO WS-NR-CD-ISSUE  03410000
003420        MOVE WS-NR-ISSUE TO NR-ISSUIN-OORD OF VMDZ510I.           03420000
003430        MOVE AM-CNSTK-479BEFF OF DCLDZBEFFTV                      03430000
003440       TO AM-CNS-FORM-AS      OF VMDZ510I.                        03440000
003450        MOVE NR-IDSTOCK-479BEFF OF DCLDZBEFFTV TO                 03450000
003460       NR-ST-FORM-AS-R(1:12) OF VMDZ510I.                         03460000
003470        MOVE NR-CDSTK-479BEFF OF DCLDZBEFFTV TO                   03470000
003480       NR-ST-FORM-AS-R(13:1)                                      03480000
003490       OF VMDZ510I.                                               03490000
003500        MOVE NR-IDSTOCK-479BEFF OF DCLDZBEFFTV TO                 03500000
003510       NR-STIN-OORD(1:12)                                         03510000
003520       OF VMDZ510I.                                               03520000
003530        MOVE NR-CDSTK-479BEFF OF DCLDZBEFFTV TO NR-STIN-OORD(13:1)03530000
003540       OF VMDZ510I.                                               03540000
003550        MOVE SPACES TO NR-STIN-OORD(14:1) OF VMDZ510I.            03550000
003560        MOVE NS-DBSTK-479BEFF OF DCLDZBEFFTV                      03560000
003570       TO NS-DBST-OORD        OF VMDZ510I.                        03570000
003580        IF NX-CPCRESK-479BEFF OF DCLDZBEFFTV = 0                  03580000
003590           MOVE AM-CNDSTK-479BEFF OF DCLDZBEFFTV                  03590000
003600         TO AM-CND-FORM-AS      OF VMDZ510I                       03600000
003610        ELSE                                                      03610000
003620           MOVE AM-INTERSK-479BEFF OF DCLDZBEFFTV                 03620000
003630         TO AM-INTER-FORM-AS    OF VMDZ510I                       03630000
003640        END-IF.                                                   03640000
003650        MOVE CO-IDPRKSK-479BEFF OF DCLDZBEFFTV                    03650000
003660       TO NR-ID-040SECU       OF VMDZ510I.                        03660000
003670        MOVE NS-IRMOSTK-479BEFF OF DCLDZBEFFTV                    03670000
003680       TO NS-SEQ-040IRMO      OF VMDZ510I.                        03680000
003690        MOVE DA-UBSECIS-479BEFF OF DCLDZBEFFTV                    03690000
003700       TO DA-UB-FORM-AS       OF VMDZ510I.                        03700000
003710        MOVE DA-CREVTPD-479EVEF OF DCLDZEVEFTV                    03710000
003720       TO DA-COMPTABILISATION-OPER OF VMDZ510I.                   03720000
003730        MOVE DA-CREVTPD-479EVEF OF DCLDZEVEFTV                    03730000
003740       TO DA-EXEC-OORD        OF VMDZ510I.                        03740000
003750                                                                  03750000
003760        MOVE NX-CPCRESK-479BEFF OF DCLDZBEFFTV                    03760000
003770       TO NS-RANK-COUP        OF VMDZ510I.                        03770000
003780        MOVE NX-CPAIDSK-479BEFF OF DCLDZBEFFTV                    03780000
003790       TO NX-CPAID-STOCK      OF VMDZ510I.                        03790000
003800*    MOVE NX-CPFDU-STOCK      OF VMBEFF                           03800000
003810                                                                  03810000
003820* EXTRA ZONES OPVULLEN                                            03820000
003830                                                                  03830000
003840        EVALUATE WS-CT-OPD                                        03840000
003850          WHEN 00                                                 03850000
003860               MOVE 'MU' TO CO-TYPOPER-OORD OF VMDZ510I           03860000
003870          WHEN OTHER                                              03870000
003880               MOVE '??' TO CO-TYPOPER-OORD OF VMDZ510I           03880000
003890               DISPLAY 'ABEND VERKEERDE CT-OPD = '                03890000
003900               WS-CT-OPD                                          03900000
003910               DISPLAY DCLDZBEFFTV                                03910000
003920               DISPLAY DCLDZEVEFTV                                03920000
003930               CALL USERABEN                                      03930000
003940        END-EVALUATE.                                             03940000
003950* UITGIFTE = SRW DUS '1'                                          03950000
003960        MOVE '1' TO CO-ISSUIN-OORD OF VMDZ510I.                   03960000
003970        MOVE 001 TO NB-ST-OORD OF VMDZ510I.                       03970000
003980* EFFECT = IKB = DEXIA DUS '1'                                    03980000
003990        MOVE '1' TO CO-STIN-OORD OF VMDZ510I.                     03990000
004000                                                                  04000000
004010        ADD 1 TO VOLGNUMMER.                                      04010000
004020        STRING 'CIR '                                             04020000
004030           CT-OPD-FORM-AS OF VMDZ510I ' '                         04030000
004040           VOLGNUMMER                                             04040000
004050           DELIMITED BY SIZE                                      04050000
004060       INTO NR-REFORD-OORD OF VMDZ510I.                           04060000
004070                                                                  04070000
004080* EXTRA'S ANNIE STEPPE                                            04080000
004090           STRING 'X'                                             04090000
004100            '000000'                                              04100000
004110            '      '                                              04110000
004120              DELIMITED BY SIZE                                   04120000
004130       INTO NR-TRANS-OORD  OF VMDZ510I.                           04130000
004140* 10=AGENCY 11=ZETEL                                              04140000
004150*    IF NR-CIO-FORM-AS OF VMDZ510I =                              04150000
004160*       NR-CIW-FORM-AS OF VMDZ510I                                04160000
004170              MOVE '10' TO CO-TYPKAN2-OORD OF VMDZ510I            04170000
004180*    ELSE                                                         04180000
004190*      MOVE '11' TO CO-TYPKAN2-OORD OF VMDZ510I                   04190000
004200*    END-IF.                                                      04200000
004210              MOVE 'DX' TO CO-BANK-OORD OF VMDZ510I.              04210000
004220                                                                  04220000
004230              MOVE WS-OLD-CI TO NR-CIINPTR-OORD OF VMDZ510I.      04230000
004240                                                                  04240000
004250*----------------------------------------------------------------*04250000
004260 WRITE-MUTATIES.                                                  04260000
004270*--------------                                                   04270000
004280     ADD 1 TO COUNT-TREATED                                       04280000
004290     WRITE FO-MUTATIES-REC FROM VMDZ510I                          04290000
004300     .                                                            04300000
004310                                                                  04310000
004320*----------------------------------------------------------------*04320000
004330 READ-MUTATIES.                                                   04330000
004340*-------------                                                    04340000
004350     READ FI-MUTATIES INTO    WS-MUTATIES                         04350000
004360        AT END                                                    04360000
004370        SET MUTATIES-EOF TO TRUE                                  04370000
004380     NOT AT END                                                   04380000
004390        CONTINUE                                                  04390000
004400     END-READ                                                     04400000
004410     .                                                            04410000
004420                                                                  04420000
004430/---------------------------------------------------------------* 04430000
004440*    ERROR HANDLING                                               04440000
004450*---------------------------------------------------------------* 04450000
004460                                                                  04460000
004470                                                                  04470000
004480 600-GET-TIMESTAMP.                                               04480000
004490D    DISPLAY '600-GET-TIMESTAMP.'                                 04490000
004500     MOVE FUNCTION CURRENT-DATE TO TS-SYSTEM.                     04500000
004510     MOVE CC OF TS-SYSTEM       TO CC OF TS-TIMESTAMP             04510000
004520     MOVE YY OF TS-SYSTEM       TO YY OF TS-TIMESTAMP             04520000
004530     MOVE MM OF TS-SYSTEM       TO MM OF TS-TIMESTAMP             04530000
004540     MOVE DD OF TS-SYSTEM       TO DD OF TS-TIMESTAMP             04540000
004550     MOVE HH OF TS-SYSTEM       TO HH OF TS-TIMESTAMP             04550000
004560     MOVE MI OF TS-SYSTEM       TO MI OF TS-TIMESTAMP             04560000
004570     MOVE SS OF TS-SYSTEM       TO SS OF TS-TIMESTAMP             04570000
004580     MOVE TT OF TS-SYSTEM       TO TT OF TS-TIMESTAMP             04580000
004590     DISPLAY 'TIMESTAMP: ' TS-TIMESTAMP                           04590000
004600     .                                                            04600000
004610                                                                  04610000
004620*SQLERROR ROUTINE.                                                04620000
004630     EXEC SQL                                                     04630000
004640          INCLUDE SQLERROR                                        04640000
004650     END-EXEC.                                                    04650000
