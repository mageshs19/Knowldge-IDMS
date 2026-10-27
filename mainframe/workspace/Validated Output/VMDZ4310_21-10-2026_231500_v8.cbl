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
000110******************************************************************00110000
000120* WIJZIGINGEN :                                                  *00120000
000130*                                                                *00130000
000140* TERMA : 11/03/2009 P27                                         *00140000
000150* NIEUWE ZONE OLD-CI TOEGEVOEGD IN INPUT-FILE +                  *00150000
000160* DEZE ZONE OLD-CI MOVEN NAAR NR-CIINPTR-OORD VAN VMBD510I       *00160000
000170******************************************************************00170000
000180                                                                  00180000
000190 ENVIRONMENT DIVISION.                                            00190000
000200*=====================                                            00200000
000210 CONFIGURATION SECTION.                                           00210000
000220*----------------------                                           00220000
000230 SOURCE-COMPUTER. ES9000.                                         00230000
000240 OBJECT-COMPUTER. ES9000.                                         00240000
000250 SPECIAL-NAMES.                                                   00250000
000260     DECIMAL-POINT IS COMMA.                                      00260000
000270                                                                  00270000
000280 INPUT-OUTPUT SECTION.                                            00280000
000290*---------------------                                            00290000
000300 FILE-CONTROL.                                                    00300000
000310     SELECT FI-MUTATIES         ASSIGN TO UT-S-DD010.             00310000
000320     SELECT FO-MUTATIES         ASSIGN TO UT-S-DD100.             00320000
000330                                                                  00330000
000340*----------------------                                           00340000
000350                                                                  00350000
000360 DATA DIVISION.                                                   00360000
000370*==============                                                   00370000
000380*---------------                                                  00380000
000390                                                                  00390000
000400 FILE SECTION.                                                    00400000
000410*-------------                                                    00410000
000420 FD  FI-MUTATIES                                                  00420000
000430     LABEL RECORD IS STANDARD                                     00430000
000440     RECORDING F                                                  00440000
000450     BLOCK CONTAINS 0.                                            00450000
000460 01  FI-MUTATIES-REC          PIC  X(21).                         00460000
000470*                                                                 00470000
000480 FD  FO-MUTATIES                                                  00480000
000490     LABEL RECORD IS STANDARD                                     00490000
000500     RECORDING F                                                  00500000
000510     BLOCK CONTAINS 0.                                            00510000
000520 01  FO-MUTATIES-REC            PIC  X(1500).                     00520000
000530*                                                                 00530000
000540 WORKING-STORAGE SECTION.                                         00540000
000550*------------------------                                         00550000
000560* -- DATE PARM --                                                 00560000
000570 01  W-DATE              PIC 9(8).                                00570000
000580 01  W-DATE-X REDEFINES W-DATE.                                   00580000
000590     05  W-DATE-Y        PIC 9(4).                                00590000
000600     05  W-DATE-M        PIC 9(2).                                00600000
000610     05  W-DATE-D        PIC 9(2).                                00610000
000620                                                                  00620000
000630 01  VOLGNUMMER                 PIC 9(07) VALUE ZEROES.           00630000
000640 01  WS-TOTAL-INPUT             PIC S9(11) COMP-3 VALUE +0.       00640000
000650 01  COUNT-TREATED              PIC 9(15) VALUE ZEROES.           00650000
000660                                                                  00660000
000670 01  WS-NR-ISSUE.                                                 00670000
000680     03  WS-NR-ID-ISSUE PIC X(7).                                 00680000
000690     03  WS-NR-CD-ISSUE PIC X(2).                                 00690000
000700                                                                  00700000
000710* -- CLE DU FORMULAIRE --                                         00710000
000720 01  WS-NR-ID-GOOD.                                               00720000
000730     03  WS-NR-CIO              PIC 9(8)    COMP-3.               00730000
000740     03  WS-DA-CREA             PIC 9(8)    COMP-3.               00740000
000750     03  WS-NR-ID               PIC 9(6)    COMP-3.               00750000
000760     03  WS-CT-OPD              PIC 999     COMP-3.               00760000
000770     03  WS-CT-OPG              PIC 999     COMP-3.               00770000
000780     03  FILLER                 PIC XX      VALUE SPACES.         00780000
000790                                                                  00790000
000800 01  WS-MUTATIES.                                                 00800000
000810     03 WS-IN-NR-TIT-BC PIC X(13).                                00810000
000820     03 WS-NR-SUITE     PIC X(2).                                 00820000
000830     03 WS-OLD-CI       PIC X(6).                                 00830000
000840                                                                  00840000
000850* ----- USERABEN -----                                            00850000
000860 01  USERABEN                   PIC X(8) VALUE 'USERABEN'.        00860000
000870                                                                  00870000
000880 01  CS-VM4BD310                PIC X(8) VALUE 'VMDZ4310'.        00880000
000890                                                                  00890000
000900*---------------------------------------------------------------* 00900000
000910*--- COPYBOOKS                                                    00910000
000920*---------------------------------------------------------------* 00920000
000930     COPY VMDZ510I.                                               00930000
000940                                                                  00940000
000950     COPY VMDZ05.                                                 00950000
000960                                                                  00960000
000970*---------------------------------------------------------------* 00970000
000980*--- SWITCHES                                                     00980000
000990*---------------------------------------------------------------* 00990000
001000 01  SW-MUTATIES-EOF            PIC X.                            01000000
001010     88 MUTATIES-NOT-EOF                  VALUE 'N'.              01010000
001020     88 MUTATIES-EOF                      VALUE 'Y'.              01020000
001030                                                                  01030000
001040*DB2 INFRASTRUCTURE - SQLCA, INCLUDES, FLAGS                   *  01040000
001050     EXEC SQL INCLUDE SQLERRWS END-EXEC.                          01050000
001060     EXEC SQL INCLUDE SQLCA END-EXEC.                             01060000
001070     EXEC SQL INCLUDE DZEVEFTV END-EXEC.                          01070000
001080     EXEC SQL INCLUDE DZBEFFTV END-EXEC.                          01080000
001090                                                                  01090000
001100*DB2 CURSOR END-OF-CURSOR FLAGS                                *  01100000
001110*DB2: Removed obsolete cursor EOC flag declaration.               01110000
001120*DB2: Removed obsolete cursor EOC flag declaration.               01120000
001130*DB2: Removed obsolete cursor EOC flag declaration.               01130000
001140                                                                  01140000
001150*DB2 CURSOR DECLARATIONS                                       *  01150000
001160*DB2: Bounded LRF cursor declaration replaced by singleton SELECT.01160000
001170                                                                  01170000
001180*DB2 GENERATED WORKING STORAGE                                    01180000
001190 01  WS-DB2-GENERATED.                                            01190000
001200     10  CS-PROGRAM               PIC X(8)    VALUE 'VMDZ4310'.   01200000
001210                                                                  01210000
001220*DB2 GENERATED TIMESTAMP AND AUDIT WORKING STORAGE                01220000
001230 01  WS-TIMESTAMP-FIELDS.                                         01230000
001240     05 TS-SYSTEM.                                                01240000
001250        10  DA-SYS.                                               01250000
001260            15  DA-SYS-CCYY.                                      01260000
001270                20  CC            PIC X(2).                       01270000
001280                20  YY            PIC X(2).                       01280000
001290            15  MM                PIC X(2).                       01290000
001300            15  DD                PIC X(2).                       01300000
001310        10  HR-SYS.                                               01310000
001320            15  HH                PIC X(2).                       01320000
001330            15  MI                PIC X(2).                       01330000
001340            15  SS                PIC X(2).                       01340000
001350            15  TT                PIC X(2).                       01350000
001360     05 TS-TIMESTAMP.                                             01360000
001370        10  CC                    PIC X(2).                       01370000
001380        10  YY                    PIC X(2).                       01380000
001390        10  TE-MARKER1            PIC X             VALUE '-'.    01390000
001400        10  MM                    PIC X(2).                       01400000
001410        10  TE-MARKER2            PIC X             VALUE '-'.    01410000
001420        10  DD                    PIC X(2).                       01420000
001430        10  TE-MARKER3            PIC X             VALUE '-'.    01430000
001440        10  HH                    PIC X(2).                       01440000
001450        10  TE-MARKER4            PIC X             VALUE '.'.    01450000
001460        10  MI                    PIC X(2).                       01460000
001470        10  TE-MARKER5            PIC X             VALUE '.'.    01470000
001480        10  SS                    PIC X(2).                       01480000
001490        10  TE-MARKER6            PIC X             VALUE '.'.    01490000
001500        10  TT                    PIC X(2).                       01500000
001510        10  NNNN                  PIC 9(04)         VALUE 0.      01510000
001520                                                                  01520000
001530 LINKAGE SECTION.                                                 01530000
001540*----------------                                                 01540000
001550 01  LS-PARM-INPUT.                                               01550000
001560     02  LS-PARM                PIC S9(004) COMP.                 01560000
001570     02  LS-PARAM-IND           PIC X.                            01570000
001580     02  LS-DATE8               PIC  9(008).                      01580000
001590                                                                  01590000
001600 PROCEDURE DIVISION USING LS-PARM-INPUT.                          01600000
001610*=======================================                          01610000
001620     PERFORM 600-GET-TIMESTAMP.                                   01620000
001630                                                                  01630000
001640 MAIN.                                                            01640000
001650*-----                                                            01650000
001660     PERFORM INIT-TREATMENT                                       01660000
001670     PERFORM TREAT-MUTATIES UNTIL MUTATIES-EOF                    01670000
001680     PERFORM END-TREATMENT                                        01680000
001690     STOP RUN                                                     01690000
001700     .                                                            01700000
001710                                                                  01710000
001720*----------------------------------------------------------------*01720000
001730 INIT-TREATMENT.                                                  01730000
001740*---------------                                                  01740000
001750     OPEN INPUT  FI-MUTATIES                                      01750000
001760     OUTPUT FO-MUTATIES                                           01760000
001770     SET MUTATIES-NOT-EOF TO TRUE.                                01770000
001780                                                                  01780000
001790* -- BINDS VOOR IDMS                                              01790000
001800                                                                  01800000
001810* -- READY                                                        01810000
001820                                                                  01820000
001830     PERFORM READ-MUTATIES                                        01830000
001840     .                                                            01840000
001850                                                                  01850000
001860*----------------------------------------------------------------*01860000
001870 END-TREATMENT.                                                   01870000
001880*--------------                                                   01880000
001890* -- FINISH                                                       01890000
001900                                                                  01900000
001910     CLOSE FI-MUTATIES                                            01910000
001920     FO-MUTATIES                                                  01920000
001930                                                                  01930000
001940      DISPLAY 'TOTAL INPUTS = ' WS-TOTAL-INPUT                    01940000
001950     DISPLAY '# TREATED  = ' COUNT-TREATED                        01950000
001960     .                                                            01960000
001970                                                                  01970000
001980*----------------------------------------------------------------*01980000
001990 TREAT-MUTATIES.                                                  01990000
002000*--------------                                                   02000000
002010     PERFORM SEARCH-MUTATIES.                                     02010000
002020     PERFORM MOVE-MUTATIES.                                       02020000
002030     PERFORM WRITE-MUTATIES.                                      02030000
002040     PERFORM READ-MUTATIES                                        02040000
002050     .                                                            02050000
002060                                                                  02060000
002070*----------------------------------------------------------------*02070000
002080 SEARCH-MUTATIES.                                                 02080000
002090*---------------                                                  02090000
002100*DB2: Removed redundant key-group clear; all mapped CALC key      02100000
002110*components are initialized and assigned before SELECT.           02110000
002120     INITIALIZE DCLDZBEFFTV                                       02120000
002130     MOVE '1002'      TO CT-RKTPROD-479BEFF OF DCLDZBEFFTV.       02130000
002140*MOVEs populate the keyed SELECT.                                 02140000
002150     MOVE WS-NR-SUITE TO NS-DBSTK-479BEFF OF DCLDZBEFFTV.         02150000
002160                                                                  02160000
002170*DB2: Expanded LRF FIRST VMBTL07-R01 WHERE ALL-VMBEVEF-BY-VMBEFF  02170000
002180*  -> VMBEVEF WITHIN VMBEFF-VMBEVEF.                              02180000
002190*DB2: LRF path ALL-VMBEVEF-BY-VMBEFF keyed parent access on VMBEFF02190000
002200*  (CALC).                                                        02200000
002210*DB2: LRF keyed parent read for VMBEFF -> keyed SELECT.           02210000
002220     MOVE WS-IN-NR-TIT-BC(1:12)                                   02220000
002230     TO NR-IDSTOCK-479BEFF OF DCLDZBEFFTV.                        02230000
002240     IF WS-IN-NR-TIT-BC(13:1) IS NUMERIC                          02240000
002250        MOVE WS-IN-NR-TIT-BC(13:1) TO NR-CDSTK-479BEFF            02250000
002260      OF DCLDZBEFFTV                                              02260000
002270     ELSE                                                         02270000
002280        DISPLAY 'INVALID LRF CALC KEY FOR VMBEFF'                 02280000
002290        PERFORM SQLERROR                                          02290000
002300     END-IF.                                                      02300000
002310*DB2: Converted LRF keyed parent read for VMBEFF.                 02310000
002320      MOVE 'SELECT-VMBEFF' TO SQL-LOCATION.                       02320000
002330      EXEC SQL                                                    02330000
002340        SELECT NR_IDISSUE_479BEFF,                                02340000
002350               NR_CDISSUE_479BEFF,                                02350000
002360               AM_CNDSTK_479BEFF,                                 02360000
002370               AM_CNSTK_479BEFF,                                  02370000
002380               NR_IDSTOCK_479BEFF,                                02380000
002390               NS_DBSTK_479BEFF,                                  02390000
002400               NX_CPCRESK_479BEFF,                                02400000
002410               AM_INTERSK_479BEFF,                                02410000
002420               CO_IDPRKSK_479BEFF,                                02420000
002430               NS_IRMOSTK_479BEFF,                                02430000
002440               DA_UBSECIS_479BEFF,                                02440000
002450               NX_CPAIDSK_479BEFF                                 02450000
002460          INTO :DCLDZBEFFTV.NR-IDISSUE-479BEFF,                   02460000
002470               :DCLDZBEFFTV.NR-CDISSUE-479BEFF,                   02470000
002480               :DCLDZBEFFTV.AM-CNDSTK-479BEFF,                    02480000
002490               :DCLDZBEFFTV.AM-CNSTK-479BEFF,                     02490000
002500               :DCLDZBEFFTV.NR-IDSTOCK-479BEFF,                   02500000
002510               :DCLDZBEFFTV.NS-DBSTK-479BEFF,                     02510000
002520               :DCLDZBEFFTV.NX-CPCRESK-479BEFF,                   02520000
002530               :DCLDZBEFFTV.AM-INTERSK-479BEFF,                   02530000
002540               :DCLDZBEFFTV.CO-IDPRKSK-479BEFF,                   02540000
002550               :DCLDZBEFFTV.NS-IRMOSTK-479BEFF,                   02550000
002560               :DCLDZBEFFTV.DA-UBSECIS-479BEFF,                   02560000
002570               :DCLDZBEFFTV.NX-CPAIDSK-479BEFF                    02570000
002580          FROM DZBEFFTV                                           02580000
002590       WHERE CT_RKTPROD_479BEFF =                                 02590000
002600         :DCLDZBEFFTV.CT-RKTPROD-479BEFF                          02600000
002610         AND NR_IDSTOCK_479BEFF =                                 02610000
002620           :DCLDZBEFFTV.NR-IDSTOCK-479BEFF                        02620000
002630           AND NR_CDSTK_479BEFF = :DCLDZBEFFTV.NR-CDSTK-479BEFF   02630000
002640           AND NS_DBSTK_479BEFF = :DCLDZBEFFTV.NS-DBSTK-479BEFF   02640000
002650         QUERYNO 442                                              02650000
002660      END-EXEC                                                    02660000
002670      EVALUATE SQLCODE                                            02670000
002680        WHEN 0                                                    02680000
002690             CONTINUE                                             02690000
002700        WHEN 100                                                  02700000
002710             DISPLAY 'NO DATA FOUND FOR SELECT DZBEFFTV'          02710000
002720             PERFORM SQLERROR                                     02720000
002730        WHEN OTHER                                                02730000
002740             DISPLAY 'ERROR ON LRF KEYED PARENT SELECT DZBEFFTV'  02740000
002750             PERFORM SQLERROR                                     02750000
002760      END-EVALUATE                                                02760000
002770      .                                                           02770000
002780     INITIALIZE DCLDZEVEFTV                                       02780000
002790 EXEC SQL                                                         02790000
002800 SELECT NR_IDGOOD_479EVEF,                                        02800000
002810    NR_CI1POS_479EVEF,                                            02810000
002820    NR_CI26POS_479EVEF,                                           02820000
002830    DA_CREVTPD_479EVEF                                            02830000
002840 INTO                                                             02840000
002850    :DCLDZEVEFTV.NR-IDGOOD-479EVEF,                               02850000
002860    :DCLDZEVEFTV.NR-CI1POS-479EVEF,                               02860000
002870    :DCLDZEVEFTV.NR-CI26POS-479EVEF,                              02870000
002880    :DCLDZEVEFTV.DA-CREVTPD-479EVEF                               02880000
002890 FROM DZEVEFTV                                                    02890000
002900 WHERE CT_RKTPROD_479BEFF = :DCLDZBEFFTV.CT-RKTPROD-479BEFF       02900000
002910 AND NR_IDSTOCK_479BEFF = :DCLDZBEFFTV.NR-IDSTOCK-479BEFF         02910000
002920 AND NR_CDSTK_479BEFF = :DCLDZBEFFTV.NR-CDSTK-479BEFF             02920000
002930 AND NS_DBSTK_479BEFF = :DCLDZBEFFTV.NS-DBSTK-479BEFF             02930000
002940 AND CT_RKTEVPR_479EVEF = '0092'                                  02940000
002950 ORDER BY NR_ID_479EVEF DESC                                      02950000
002960 FETCH FIRST 1 ROW ONLY                                           02960000
002970 QUERYNO 254                                                      02970000
002980 END-EXEC                                                         02980000
002990 IF SQLCODE NOT = 0 AND SQLCODE NOT = 100                         02990000
003000    DISPLAY 'ERROR ON BOUNDED LRF SELECT'                         03000000
003010    PERFORM SQLERROR                                              03010000
003020 END-IF.                                                          03020000
003030                                                                  03030000
003040*DB2: Bounded singleton SELECT no-data handling follows.          03040000
003050*                                                                 03050000
003060     IF SQLCODE = 100                                             03060000
003070        DISPLAY 'NO DATA FOUND FOR BOUNDED LRF SELECT'            03070000
003080        DISPLAY 'K1=' CT-RKTPROD-479BEFF OF DCLDZBEFFTV           03080000
003090        DISPLAY 'K2=' NR-IDSTOCK-479BEFF OF DCLDZBEFFTV           03090000
003100        DISPLAY 'K3=' NR-CDSTK-479BEFF OF DCLDZBEFFTV             03100000
003110        DISPLAY 'K4=' NS-DBSTK-479BEFF OF DCLDZBEFFTV             03110000
003120        CALL USERABEN                                             03120000
003130     END-IF.                                                      03130000
003140                                                                  03140000
003150* -- ZOEK DE MUTATIE                                              03150000
003160*DB2: Removed bounded loop; predicate moved to SQL.               03160000
003170*DB2: Cursor CLOSE removed with singleton rewrite.                03170000
003180                                                                  03180000
003190*DB2: Removed cursor EOC branch; SQLCODE handles no-data.         03190000
003200                                                                  03200000
003210*----------------------------------------------------------------*03210000
003220 MOVE-MUTATIES.                                                   03220000
003230*-------------                                                    03230000
003240     INITIALIZE VMDZ510I                                          03240000
003250     REPLACING ALPHANUMERIC BY SPACES                             03250000
003260     NUMERIC BY ZEROES.                                           03260000
003270                                                                  03270000
003280     MOVE NR-IDGOOD-479EVEF OF DCLDZEVEFTV TO WS-NR-ID-GOOD.      03280000
003290                                                                  03290000
003300     MOVE NR-CI1POS-479EVEF OF DCLDZEVEFTV TO NR-CIO-FORM-AS(1:1) 03300000
003310       OF VMDZ510I.                                               03310000
003320     MOVE NR-CI26POS-479EVEF OF DCLDZEVEFTV TO NR-CIO-FORM-AS(2:5)03320000
003330       OF VMDZ510I.                                               03330000
003340     MOVE WS-DA-CREA TO DA-CREA-FORM-AS-R OF VMDZ510I.            03340000
003350     STRING DA-CR-FORM-AS-Y   OF VMDZ510I '-'                     03350000
003360        DA-CR-FORM-AS-M   OF VMDZ510I '-'                         03360000
003370        DA-CR-FORM-AS-D   OF VMDZ510I '-'                         03370000
003380            '01.01.01.000001'                                     03380000
003390        DELIMITED BY SIZE                                         03390000
003400       INTO TS-CREA-OORD      OF VMDZ510I.                        03400000
003410        MOVE WS-NR-ID  TO NR-ID-FORM-AS OF VMDZ510I.              03410000
003420        MOVE WS-CT-OPG TO CT-OPG-FORM-AS-R OF VMDZ510I.           03420000
003430        MOVE WS-CT-OPD TO CT-OPD-FORM-AS-R OF VMDZ510I.           03430000
003440                                                                  03440000
003450        MOVE NR-IDISSUE-479BEFF OF DCLDZBEFFTV TO WS-NR-ID-ISSUE  03450000
003460        MOVE NR-CDISSUE-479BEFF OF DCLDZBEFFTV TO WS-NR-CD-ISSUE  03460000
003470        MOVE WS-NR-ISSUE TO NR-ISSUIN-OORD OF VMDZ510I.           03470000
003480        MOVE AM-CNSTK-479BEFF OF DCLDZBEFFTV                      03480000
003490       TO AM-CNS-FORM-AS      OF VMDZ510I.                        03490000
003500        MOVE NR-IDSTOCK-479BEFF OF DCLDZBEFFTV TO                 03500000
003510       NR-ST-FORM-AS-R(1:12) OF VMDZ510I.                         03510000
003520        MOVE NR-CDSTK-479BEFF OF DCLDZBEFFTV TO                   03520000
003530       NR-ST-FORM-AS-R(13:1)                                      03530000
003540       OF VMDZ510I.                                               03540000
003550        MOVE NR-IDSTOCK-479BEFF OF DCLDZBEFFTV TO                 03550000
003560       NR-STIN-OORD(1:12)                                         03560000
003570       OF VMDZ510I.                                               03570000
003580        MOVE NR-CDSTK-479BEFF OF DCLDZBEFFTV TO NR-STIN-OORD(13:1)03580000
003590       OF VMDZ510I.                                               03590000
003600        MOVE SPACES TO NR-STIN-OORD(14:1) OF VMDZ510I.            03600000
003610        MOVE NS-DBSTK-479BEFF OF DCLDZBEFFTV                      03610000
003620       TO NS-DBST-OORD        OF VMDZ510I.                        03620000
003630        IF NX-CPCRESK-479BEFF OF DCLDZBEFFTV = 0                  03630000
003640           MOVE AM-CNDSTK-479BEFF OF DCLDZBEFFTV                  03640000
003650         TO AM-CND-FORM-AS      OF VMDZ510I                       03650000
003660        ELSE                                                      03660000
003670           MOVE AM-INTERSK-479BEFF OF DCLDZBEFFTV                 03670000
003680         TO AM-INTER-FORM-AS    OF VMDZ510I                       03680000
003690        END-IF.                                                   03690000
003700        MOVE CO-IDPRKSK-479BEFF OF DCLDZBEFFTV                    03700000
003710       TO NR-ID-040SECU       OF VMDZ510I.                        03710000
003720        MOVE NS-IRMOSTK-479BEFF OF DCLDZBEFFTV                    03720000
003730       TO NS-SEQ-040IRMO      OF VMDZ510I.                        03730000
003740        MOVE DA-UBSECIS-479BEFF OF DCLDZBEFFTV                    03740000
003750       TO DA-UB-FORM-AS       OF VMDZ510I.                        03750000
003760        MOVE DA-CREVTPD-479EVEF OF DCLDZEVEFTV                    03760000
003770       TO DA-COMPTABILISATION-OPER OF VMDZ510I.                   03770000
003780        MOVE DA-CREVTPD-479EVEF OF DCLDZEVEFTV                    03780000
003790       TO DA-EXEC-OORD        OF VMDZ510I.                        03790000
003800                                                                  03800000
003810        MOVE NX-CPCRESK-479BEFF OF DCLDZBEFFTV                    03810000
003820       TO NS-RANK-COUP        OF VMDZ510I.                        03820000
003830        MOVE NX-CPAIDSK-479BEFF OF DCLDZBEFFTV                    03830000
003840       TO NX-CPAID-STOCK      OF VMDZ510I.                        03840000
003850*    MOVE NX-CPFDU-STOCK      OF VMBEFF                           03850000
003860                                                                  03860000
003870* EXTRA ZONES OPVULLEN                                            03870000
003880                                                                  03880000
003890        EVALUATE WS-CT-OPD                                        03890000
003900          WHEN 00                                                 03900000
003910               MOVE 'MU' TO CO-TYPOPER-OORD OF VMDZ510I           03910000
003920          WHEN OTHER                                              03920000
003930               MOVE '??' TO CO-TYPOPER-OORD OF VMDZ510I           03930000
003940               DISPLAY 'ABEND VERKEERDE CT-OPD = '                03940000
003950               WS-CT-OPD                                          03950000
003960               DISPLAY DCLDZBEFFTV                                03960000
003970               DISPLAY DCLDZEVEFTV                                03970000
003980               CALL USERABEN                                      03980000
003990        END-EVALUATE.                                             03990000
004000* UITGIFTE = SRW DUS '1'                                          04000000
004010        MOVE '1' TO CO-ISSUIN-OORD OF VMDZ510I.                   04010000
004020        MOVE 001 TO NB-ST-OORD OF VMDZ510I.                       04020000
004030* EFFECT = IKB = DEXIA DUS '1'                                    04030000
004040        MOVE '1' TO CO-STIN-OORD OF VMDZ510I.                     04040000
004050                                                                  04050000
004060        ADD 1 TO VOLGNUMMER.                                      04060000
004070        STRING 'CIR '                                             04070000
004080           CT-OPD-FORM-AS OF VMDZ510I ' '                         04080000
004090           VOLGNUMMER                                             04090000
004100           DELIMITED BY SIZE                                      04100000
004110       INTO NR-REFORD-OORD OF VMDZ510I.                           04110000
004120                                                                  04120000
004130* EXTRA'S ANNIE STEPPE                                            04130000
004140           STRING 'X'                                             04140000
004150            '000000'                                              04150000
004160            '      '                                              04160000
004170              DELIMITED BY SIZE                                   04170000
004180       INTO NR-TRANS-OORD  OF VMDZ510I.                           04180000
004190* 10=AGENCY 11=ZETEL                                              04190000
004200*    IF NR-CIO-FORM-AS OF VMDZ510I =                              04200000
004210*       NR-CIW-FORM-AS OF VMDZ510I                                04210000
004220              MOVE '10' TO CO-TYPKAN2-OORD OF VMDZ510I            04220000
004230*    ELSE                                                         04230000
004240*      MOVE '11' TO CO-TYPKAN2-OORD OF VMDZ510I                   04240000
004250*    END-IF.                                                      04250000
004260              MOVE 'DX' TO CO-BANK-OORD OF VMDZ510I.              04260000
004270                                                                  04270000
004280              MOVE WS-OLD-CI TO NR-CIINPTR-OORD OF VMDZ510I.      04280000
004290                                                                  04290000
004300*----------------------------------------------------------------*04300000
004310 WRITE-MUTATIES.                                                  04310000
004320*--------------                                                   04320000
004330     ADD 1 TO COUNT-TREATED                                       04330000
004340     WRITE FO-MUTATIES-REC FROM VMDZ510I                          04340000
004350     .                                                            04350000
004360                                                                  04360000
004370*----------------------------------------------------------------*04370000
004380 READ-MUTATIES.                                                   04380000
004390*-------------                                                    04390000
004400     READ FI-MUTATIES INTO    WS-MUTATIES                         04400000
004410        AT END                                                    04410000
004420        SET MUTATIES-EOF TO TRUE                                  04420000
004430     NOT AT END                                                   04430000
004440         ADD 1 TO WS-TOTAL-INPUT                                  04440000
004450        CONTINUE                                                  04450000
004460     END-READ                                                     04460000
004470     .                                                            04470000
004480                                                                  04480000
004490/---------------------------------------------------------------* 04490000
004500*    ERROR HANDLING                                               04500000
004510*---------------------------------------------------------------* 04510000
004520                                                                  04520000
004530*DB2 GENERATED CURSOR OPEN FETCH CLOSE PARAGRAPHS              *  04530000
004540                                                                  04540000
004550*DB2: Removed obsolete cursor paragraph.                          04550000
004560*DB2: Removed obsolete cursor paragraph.                          04560000
004570*DB2: Removed obsolete cursor paragraph.                          04570000
004580 600-GET-TIMESTAMP.                                               04580000
004590D    DISPLAY '600-GET-TIMESTAMP.'                                 04590000
004600     MOVE FUNCTION CURRENT-DATE TO TS-SYSTEM.                     04600000
004610     MOVE CC OF TS-SYSTEM       TO CC OF TS-TIMESTAMP             04610000
004620     MOVE YY OF TS-SYSTEM       TO YY OF TS-TIMESTAMP             04620000
004630     MOVE MM OF TS-SYSTEM       TO MM OF TS-TIMESTAMP             04630000
004640     MOVE DD OF TS-SYSTEM       TO DD OF TS-TIMESTAMP             04640000
004650     MOVE HH OF TS-SYSTEM       TO HH OF TS-TIMESTAMP             04650000
004660     MOVE MI OF TS-SYSTEM       TO MI OF TS-TIMESTAMP             04660000
004670     MOVE SS OF TS-SYSTEM       TO SS OF TS-TIMESTAMP             04670000
004680     MOVE TT OF TS-SYSTEM       TO TT OF TS-TIMESTAMP             04680000
004690     DISPLAY 'TIMESTAMP: ' TS-TIMESTAMP                           04690000
004700     .                                                            04700000
004710                                                                  04710000
004720*SQLERROR ROUTINE.                                                04720000
004730     EXEC SQL                                                     04730000
004740          INCLUDE SQLERROR                                        04740000
004750     END-EXEC.                                                    04750000
