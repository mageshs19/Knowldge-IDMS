000010 CBL ARITH(EXTEND)                                                00010000
000020 IDENTIFICATION DIVISION.                                         00020000
000030 PROGRAM-ID. VMDZ4310.                                            00030000
000040                                                                  00040000
000050 AUTHOR.       PYTHON-AUTOMATION-USING-AI.                        00050000
000060*                                                                 00060000
000070*  OPZOEKEN GEGEVENS MAANDELIJKSE MUTATIES VIA ACCESS             00070000
000080*  IDMS DB OMLOOP/CIRCULATIE                                      00080000
000090*                                                                 00090000
000100                                                                  00100000
000110******************************************************************00110000
000120* WIJZIGINGEN :                                                  *00120000
000130*                                                                *00130000
000140* TERMA : 11/03/2009 P27                                         *00140000
000150* NIEUWE ZONE OLD-CI TOEGEVOEGD IN INPUT-FILE +                  *00150000
000160* DEZE ZONE OLD-CI MOVEN NAAR NR-CIINPTR-OORD VAN VMBD510I       *00160000
000170******************************************************************00170000
000180                                                                  00180000
000190 ENVIRONMENT DIVISION.                                            00190000
000200 CONFIGURATION SECTION.                                           00200000
000210*----------------------                                           00210000
000220 SOURCE-COMPUTER. ES9000.                                         00220000
000230 OBJECT-COMPUTER. ES9000.                                         00230000
000240 SPECIAL-NAMES.                                                   00240000
000250     DECIMAL-POINT IS COMMA.                                      00250000
000260                                                                  00260000
000270 INPUT-OUTPUT SECTION.                                            00270000
000280*---------------------                                            00280000
000290 FILE-CONTROL.                                                    00290000
000300     SELECT FI-MUTATIES         ASSIGN TO UT-S-DD010.             00300000
000310     SELECT FO-MUTATIES         ASSIGN TO UT-S-DD100.             00310000
000320                                                                  00320000
000330*----------------------                                           00330000
000340                                                                  00340000
000350                                                                  00350000
000360 DATA DIVISION.                                                   00360000
000370*---------------                                                  00370000
000380                                                                  00380000
000390 FILE SECTION.                                                    00390000
000400*-------------                                                    00400000
000410 FD  FI-MUTATIES                                                  00410000
000420     LABEL RECORD IS STANDARD                                     00420000
000430     RECORDING F                                                  00430000
000440     BLOCK CONTAINS 0.                                            00440000
000450 01  FI-MUTATIES-REC          PIC  X(21).                         00450000
000460*                                                                 00460000
000470 FD  FO-MUTATIES                                                  00470000
000480     LABEL RECORD IS STANDARD                                     00480000
000490     RECORDING F                                                  00490000
000500     BLOCK CONTAINS 0.                                            00500000
000510 01  FO-MUTATIES-REC            PIC  X(1500).                     00510000
000520*                                                                 00520000
000530 WORKING-STORAGE SECTION.                                         00530000
000540*------------------------                                         00540000
000550* -- DATE PARM --                                                 00550000
000560*01  W-DATE              PIC 9(8).                                00560000
000570*01  W-DATE-X REDEFINES W-DATE.                                   00570000
000580*    05  W-DATE-Y        PIC 9(4).                                00580000
000590*    05  W-DATE-M        PIC 9(2).                                00590000
000600*    05  W-DATE-D        PIC 9(2).                                00600000
000610                                                                  00610000
000620 01  VOLGNUMMER                 PIC 9(07) VALUE ZEROES.           00620000
000630                                                                  00630000
000640 000680 01  WS-VAR.                                               00640000
000650   02 WS-NR-ISSUE.                                                00650000
000660     03  WS-NR-ID-ISSUE PIC X(7).                                 00660000
000670     03  WS-NR-CD-ISSUE PIC X(2).                                 00670000
000680                                                                  00680000
000690* -- CLE DU FORMULAIRE --                                         00690000
000700   02 WS-NR-ID-GOOD.                                              00700000
000710     03  WS-NR-CIO              PIC 9(8).                         00710000
000720     03  WS-DA-CREA             PIC 9(8).                         00720000
000730     03  WS-NR-ID               PIC 9(6).                         00730000
000740     03  WS-CT-OPD              PIC 999.                          00740000
000750     03  WS-CT-OPG              PIC 999.                          00750000
000760     03  FILLER                 PIC XX.                           00760000
000770                                                                  00770000
000780   02 WS-MUTATIES.                                                00780000
000790     03 WS-IN-NR-TIT-BC PIC X(13).                                00790000
000800     03 WS-NR-SUITE     PIC X(2).                                 00800000
000810     03 WS-OLD-CI       PIC X(6).                                 00810000
000820                                                                  00820000
000830* ----- USERABEN -----                                            00830000
000840   02  WS-TOTAL-INPUT PIC S9(11) COMP-3 VALUE +0.                 00840000
000850   02  WS-COUNT-TREATED              PIC 9(15) VALUE ZEROES.      00850000
000860 01 HELP-VAR.                                                     00860000
000870   02 HELP-DA-UBSECIS-STOCK PIC 9(8).                             00870000
000880   02 HELP-DA-CR-EVENT-PROD PIC 9(8).                             00880000
000890   02 HELP-NR-CIO-FORM-AS.                                        00890000
000900     03 HELP-NR-CIO-FORM-AS-1POS PIC X(1).                        00900000
000910     03 HELP-NR-CIO-FORM-AS-26POS PIC X(5).                       00910000
000920   02 HELP-NR-ID-STOCK-CD PIC X(13).                              00920000
000930   02 HELP-NR-ID-STOCK-CD-P13-R REDEFINES HELP-NR-ID-STOCK-CD.    00930000
000940     03 HELP-NR-ID-STOCK-CD-112POS PIC X(12).                     00940000
000950     03 HELP-NR-ID-STOCK-CD-13POS PIC X(1).                       00950000
000960 01  USERABEN                   PIC X(8) VALUE 'USERABEN'.        00960000
000970                                                                  00970000
000980                                                                  00980000
000990*---------------------------------------------------------------* 00990000
001000*--- COPYBOOKS                                                    01000000
001010*---------------------------------------------------------------* 01010000
001020     COPY VMDZ510I.                                               01020000
001030                                                                  01030000
001040                                                                  01040000
001050*---------------------------------------------------------------* 01050000
001060*--- SWITCHES                                                     01060000
001070*---------------------------------------------------------------* 01070000
001080 01  SW-MUTATIES-EOF            PIC X.                            01080000
001090     88 MUTATIES-NOT-EOF                  VALUE 'N'.              01090000
001100     88 MUTATIES-EOF                      VALUE 'Y'.              01100000
001110                                                                  01110000
001120                                                                  01120000
001130                                                                  01130000
001140     EXEC SQL INCLUDE SQLERRWS END-EXEC.                          01140000
001150     EXEC SQL INCLUDE SQLCA END-EXEC.                             01150000
001160     EXEC SQL INCLUDE DZEVEFTV END-EXEC.                          01160000
001170     EXEC SQL INCLUDE DZBEFFTV END-EXEC.                          01170000
001180                                                                  01180000
001190                                                                  01190000
001200                                                                  01200000
001210                                                                  01210000
001220                                                                  01220000
001230 01  WS-DB2-GENERATED.                                            01230000
001240     10  CS-PROGRAM               PIC X(8)    VALUE 'VMDZ4310'.   01240000
001250                                                                  01250000
001260 01  WS-TIMESTAMP-FIELDS.                                         01260000
001270     05 TS-SYSTEM.                                                01270000
001280        10  DA-SYS.                                               01280000
001290            15  DA-SYS-CCYY.                                      01290000
001300                20  CC            PIC X(2).                       01300000
001310                20  YY            PIC X(2).                       01310000
001320            15  MM                PIC X(2).                       01320000
001330            15  DD                PIC X(2).                       01330000
001340        10  HR-SYS.                                               01340000
001350            15  HH                PIC X(2).                       01350000
001360            15  MI                PIC X(2).                       01360000
001370            15  SS                PIC X(2).                       01370000
001380            15  TT                PIC X(2).                       01380000
001390     05 TS-TIMESTAMP.                                             01390000
001400        10  CC                    PIC X(2).                       01400000
001410        10  YY                    PIC X(2).                       01410000
001420        10  TE-MARKER1            PIC X             VALUE '-'.    01420000
001430        10  MM                    PIC X(2).                       01430000
001440        10  TE-MARKER2            PIC X             VALUE '-'.    01440000
001450        10  DD                    PIC X(2).                       01450000
001460        10  TE-MARKER3            PIC X             VALUE '-'.    01460000
001470        10  HH                    PIC X(2).                       01470000
001480        10  TE-MARKER4            PIC X             VALUE '.'.    01480000
001490        10  MI                    PIC X(2).                       01490000
001500        10  TE-MARKER5            PIC X             VALUE '.'.    01500000
001510        10  SS                    PIC X(2).                       01510000
001520        10  TE-MARKER6            PIC X             VALUE '.'.    01520000
001530        10  TT                    PIC X(2).                       01530000
001540        10  NNNN                  PIC 9(04)         VALUE 0.      01540000
001550                                                                  01550000
001560 01 WS-DATUMVELDEN.                                               01560000
001570   03 DA-YYMMDD.                                                  01570000
001580     05 YY PIC 99 VALUE ZERO.                                     01580000
001590     05 MM PIC 99 VALUE ZERO.                                     01590000
001600     05 DD PIC 99 VALUE ZERO.                                     01600000
001610   03 DA-DDMMCCYY.                                                01610000
001620     05 DD PIC 99 VALUE ZERO.                                     01620000
001630     05 MM PIC 99 VALUE ZERO.                                     01630000
001640     05 CC PIC 99 VALUE ZERO.                                     01640000
001650     05 YY PIC 99 VALUE ZERO.                                     01650000
001660   03 DA-CCYYMMDD.                                                01660000
001670     05 CC PIC 99 VALUE ZERO.                                     01670000
001680     05 YY PIC 99 VALUE ZERO.                                     01680000
001690     05 MM PIC 99 VALUE ZERO.                                     01690000
001700     05 DD PIC 99 VALUE ZERO.                                     01700000
001710   03 DA-CCYYMMDD-R REDEFINES DA-CCYYMMDD.                        01710000
001720     05 CCYY PIC 9999.                                            01720000
001730     05 MM PIC 99.                                                01730000
001740     05 DD PIC 99.                                                01740000
001750   03 DA-DD-MM-CCYY.                                              01750000
001760     05 DD PIC 9(02).                                             01760000
001770     05 TE-MARKER5 PIC X VALUE '.'.                               01770000
001780     05 MM PIC 9(02).                                             01780000
001790     05 TE-MARKER6 PIC X VALUE '.'.                               01790000
001800     05 CCYY PIC 9(04).                                           01800000
001810 LINKAGE SECTION.                                                 01810000
001820*----------------                                                 01820000
001830 01  LS-PARM-INPUT.                                               01830000
001840     02  LS-PARM                PIC S9(004) COMP.                 01840000
001850     02  LS-PARAM-IND           PIC X.                            01850000
001860     02  LS-DATE8               PIC  9(008).                      01860000
001870                                                                  01870000
001880                                                                  01880000
001890 PROCEDURE DIVISION USING LS-PARM-INPUT.                          01890000
001900 0000-MAIN-PROCEDURE.                                             01900000
001910     DISPLAY '0000-MAIN-PROCEDURE.'.                              01910000
001920     PERFORM 1000-INITIALIZE-PROGRAM.                             01920000
001930     PERFORM 2000-PROCESS-PROGRAM.                                01930000
001940     PERFORM 3000-FINALIZE-PROGRAM.                               01940000
001950     STOP RUN.                                                    01950000
001960 1000-INITIALIZE-PROGRAM.                                         01960000
001970     DISPLAY '1000-INITIALIZE-PROGRAM.'.                          01970000
001980     PERFORM 1100-GET-TIMESTAMP.                                  01980000
001990                                                                  01990000
002000*-----                                                            02000000
002010     PERFORM INIT-TREATMENT.                                      02010000
002020 2000-PROCESS-PROGRAM.                                            02020000
002030     DISPLAY '2000-PROCESS-PROGRAM.'.                             02030000
002040     PERFORM TREAT-MUTATIES UNTIL MUTATIES-EOF.                   02040000
002050 3000-FINALIZE-PROGRAM.                                           02050000
002060     DISPLAY '3000-FINALIZE-PROGRAM.'.                            02060000
002070     PERFORM END-TREATMENT.                                       02070000
002080                                                                  02080000
002090*----------------------------------------------------------------*02090000
002100 INIT-TREATMENT.                                                  02100000
002110     DISPLAY 'INIT-TREATMENT.'.                                   02110000
002120*---------------                                                  02120000
002130     OPEN INPUT  FI-MUTATIES                                      02130000
002140     OUTPUT FO-MUTATIES                                           02140000
002150     SET MUTATIES-NOT-EOF TO TRUE.                                02150000
002160                                                                  02160000
002170* -- BINDS VOOR IDMS                                              02170000
002180                                                                  02180000
002190                                                                  02190000
002200                                                                  02200000
002210* -- READY                                                        02210000
002220                                                                  02220000
002230     PERFORM READ-MUTATIES                                        02230000
002240     .                                                            02240000
002250                                                                  02250000
002260*----------------------------------------------------------------*02260000
002270 END-TREATMENT.                                                   02270000
002280     DISPLAY 'END-TREATMENT.'.                                    02280000
002290*--------------                                                   02290000
002300* -- FINISH                                                       02300000
002310                                                                  02310000
002320     CLOSE FI-MUTATIES                                            02320000
002330     FO-MUTATIES                                                  02330000
002340                                                                  02340000
002350     DISPLAY '# TREATED    = ' WS-COUNT-TREATED                   02350000
002360     DISPLAY 'TOTAL INPUTS ='  WS-TOTAL-INPUT                     02360000
002370     .                                                            02370000
002380                                                                  02380000
002390*----------------------------------------------------------------*02390000
002400 TREAT-MUTATIES.                                                  02400000
002410     DISPLAY 'TREAT-MUTATIES.'.                                   02410000
002420*--------------                                                   02420000
002430     PERFORM SEARCH-MUTATIES.                                     02430000
002440     PERFORM MOVE-MUTATIES.                                       02440000
002450     PERFORM WRITE-MUTATIES.                                      02450000
002460     PERFORM READ-MUTATIES                                        02460000
002470     .                                                            02470000
002480                                                                  02480000
002490*----------------------------------------------------------------*02490000
002500 SEARCH-MUTATIES.                                                 02500000
002510     DISPLAY 'SEARCH-MUTATIES.'.                                  02510000
002520*---------------                                                  02520000
002530     INITIALIZE DCLDZBEFFTV                                       02530000
002540 INITIALIZE HELP-VAR.                                             02540000
002550     MOVE '1002'      TO CT-RKTPROD-479BEFF OF DCLDZBEFFTV.       02550000
002560*MOVEs populate the keyed SELECT.                                 02560000
002570     MOVE WS-NR-SUITE TO NS-DBSTK-479BEFF OF DCLDZBEFFTV.         02570000
002580                                                                  02580000
002590 MOVE WS-IN-NR-TIT-BC TO HELP-NR-ID-STOCK-CD.                     02590000
002600 MOVE HELP-NR-ID-STOCK-CD-112POS TO NR-IDSTOCK-479BEFF            02600000
002610   OF DCLDZBEFFTV.                                                02610000
002620 IF HELP-NR-ID-STOCK-CD-13POS IS NUMERIC                          02620000
002630   MOVE HELP-NR-ID-STOCK-CD-13POS TO NR-CDSTK-479BEFF             02630000
002640     OF DCLDZBEFFTV                                               02640000
002650 ELSE                                                             02650000
002660   DISPLAY 'INVALID NUMERIC COMPONENT IN LRF CALC KEY'            02660000
002670   PERFORM SQLERROR                                               02670000
002680 END-IF.                                                          02680000
002690     DISPLAY 'END-IF.'.                                           02690000
002700     MOVE 'SELECT-VMBEFF' TO SQL-LOCATION.                        02700000
002710     EXEC SQL                                                     02710000
002720    SELECT                                                        02720000
002730       NR_IDSTOCK_479BEFF,                                        02730000
002740       NS_DBSTK_479BEFF,                                          02740000
002750       AM_CNDSTK_479BEFF,                                         02750000
002760       AM_CNSTK_479BEFF,                                          02760000
002770       NR_IDISSUE_479BEFF,                                        02770000
002780       NR_CDISSUE_479BEFF,                                        02780000
002790       NX_CPCRESK_479BEFF,                                        02790000
002800       NX_CPAIDSK_479BEFF,                                        02800000
002810       AM_INTERSK_479BEFF,                                        02810000
002820       CO_IDPRKSK_479BEFF,                                        02820000
002830       NS_IRMOSTK_479BEFF,                                        02830000
002840       DA_UBSECIS_479BEFF                                         02840000
002850    INTO                                                          02850000
002860       :DCLDZBEFFTV.NR-IDSTOCK-479BEFF,                           02860000
002870       :DCLDZBEFFTV.NS-DBSTK-479BEFF,                             02870000
002880       :DCLDZBEFFTV.AM-CNDSTK-479BEFF,                            02880000
002890       :DCLDZBEFFTV.AM-CNSTK-479BEFF,                             02890000
002900       :DCLDZBEFFTV.NR-IDISSUE-479BEFF,                           02900000
002910       :DCLDZBEFFTV.NR-CDISSUE-479BEFF,                           02910000
002920       :DCLDZBEFFTV.NX-CPCRESK-479BEFF,                           02920000
002930       :DCLDZBEFFTV.NX-CPAIDSK-479BEFF,                           02930000
002940       :DCLDZBEFFTV.AM-INTERSK-479BEFF,                           02940000
002950       :DCLDZBEFFTV.CO-IDPRKSK-479BEFF,                           02950000
002960       :DCLDZBEFFTV.NS-IRMOSTK-479BEFF,                           02960000
002970       :DCLDZBEFFTV.DA-UBSECIS-479BEFF                            02970000
002980    FROM DZBEFFTV                                                 02980000
002990    WHERE                                                         02990000
003000       CT_RKTPROD_479BEFF = :DCLDZBEFFTV.CT-RKTPROD-479BEFF       03000000
003010       AND NR_IDSTOCK_479BEFF = :DCLDZBEFFTV.NR-IDSTOCK-479BEFF   03010000
003020       AND NR_CDSTK_479BEFF = :DCLDZBEFFTV.NR-CDSTK-479BEFF       03020000
003030       AND NS_DBSTK_479BEFF = :DCLDZBEFFTV.NS-DBSTK-479BEFF       03030000
003040    QUERYNO 442                                                   03040000
003050     END-EXEC                                                     03050000
003060     EVALUATE SQLCODE                                             03060000
003070       WHEN 0                                                     03070000
003080            CONTINUE                                              03080000
003090       WHEN 100                                                   03090000
003100            DISPLAY 'NO DATA FOUND FOR SELECT DZBEFFTV'           03100000
003110            PERFORM SQLERROR                                      03110000
003120       WHEN OTHER                                                 03120000
003130            DISPLAY 'ERROR ON LRF KEYED PARENT SELECT '           03130000
003140                  'DZBEFFTV'                                      03140000
003150            PERFORM SQLERROR                                      03150000
003160     END-EVALUATE                                                 03160000
003170     .                                                            03170000
003180     INITIALIZE DCLDZEVEFTV                                       03180000
003190             MOVE SQL-STATEMENT TO SQL-LOCATION                   03190000
003200     EXEC SQL                                                     03200000
003210        SELECT NR_IDGOOD_479EVEF,                                 03210000
003220           NR_CI1POS_479EVEF,                                     03220000
003230           NR_CI26POS_479EVEF,                                    03230000
003240           DA_CREVTPD_479EVEF                                     03240000
003250        INTO                                                      03250000
003260           :DCLDZEVEFTV.NR-IDGOOD-479EVEF,                        03260000
003270           :DCLDZEVEFTV.NR-CI1POS-479EVEF,                        03270000
003280           :DCLDZEVEFTV.NR-CI26POS-479EVEF,                       03280000
003290           :DCLDZEVEFTV.DA-CREVTPD-479EVEF                        03290000
003300        FROM DZEVEFTV                                             03300000
003310        WHERE CT_RKTPROD_479BEFF = :DCLDZBEFFTV.CT-RKTPROD-479BEFF03310000
003320        AND NR_IDSTOCK_479BEFF = :DCLDZBEFFTV.NR-IDSTOCK-479BEFF  03320000
003330        AND NR_CDSTK_479BEFF = :DCLDZBEFFTV.NR-CDSTK-479BEFF      03330000
003340        AND NS_DBSTK_479BEFF = :DCLDZBEFFTV.NS-DBSTK-479BEFF      03340000
003350        AND CT_RKTEVPR_479EVEF = '0092'                           03350000
003360        ORDER BY NR_ID_479EVEF DESC                               03360000
003370        FETCH FIRST 1 ROW ONLY                                    03370000
003380        QUERYNO 254                                               03380000
003390     END-EXEC                                                     03390000
003400     IF SQLCODE NOT = 0 AND SQLCODE NOT = 100                     03400000
003410        DISPLAY 'ERROR ON LRF SINGLETON SELECT'                   03410000
003420        PERFORM SQLERROR                                          03420000
003430     END-IF.                                                      03430000
003440                                                                  03440000
003450*                                                                 03450000
003460     IF SQLCODE = 100                                             03460000
003470        DISPLAY 'NO DATA FOUND FOR BOUNDED LRF SELECT'            03470000
003480        DISPLAY 'K1=' CT-RKTPROD-479BEFF OF DCLDZBEFFTV           03480000
003490        DISPLAY 'K2=' NR-IDSTOCK-479BEFF OF DCLDZBEFFTV           03490000
003500        DISPLAY 'K3=' NR-CDSTK-479BEFF OF DCLDZBEFFTV             03500000
003510        DISPLAY 'K4=' NS-DBSTK-479BEFF OF DCLDZBEFFTV             03510000
003520        CALL USERABEN                                             03520000
003530     END-IF.                                                      03530000
003540                                                                  03540000
003550* -- ZOEK DE MUTATIE                                              03550000
003560                                                                  03560000
003570     IF SQLCODE = 100                                             03570000
003580        DISPLAY 'NO MORE VMBEVEF : '                              03580000
003590        DISPLAY 'K1=' CT-RKTPROD-479BEFF OF DCLDZBEFFTV           03590000
003600        DISPLAY 'K2=' NR-IDSTOCK-479BEFF OF DCLDZBEFFTV           03600000
003610        DISPLAY 'K3=' NR-CDSTK-479BEFF OF DCLDZBEFFTV             03610000
003620        DISPLAY 'K4=' NS-DBSTK-479BEFF OF DCLDZBEFFTV             03620000
003630        CALL USERABEN                                             03630000
003640     END-IF.                                                      03640000
003650                                                                  03650000
003660*----------------------------------------------------------------*03660000
003670 MOVE-MUTATIES.                                                   03670000
003680     DISPLAY 'MOVE-MUTATIES.'.                                    03680000
003690*-------------                                                    03690000
003700     INITIALIZE VMDZ510I                                          03700000
003710     REPLACING ALPHANUMERIC BY SPACES                             03710000
003720     NUMERIC BY ZEROES.                                           03720000
003730                                                                  03730000
003740     MOVE NR-IDGOOD-479EVEF OF DCLDZEVEFTV TO WS-NR-ID-GOOD.      03740000
003750                                                                  03750000
003760     MOVE NR-CI1POS-479EVEF OF DCLDZEVEFTV TO NR-CIO-FORM-AS(1:1) 03760000
003770       OF VMDZ510I.                                               03770000
003780     MOVE NR-CI26POS-479EVEF OF DCLDZEVEFTV TO NR-CIO-FORM-AS(2:5)03780000
003790       OF VMDZ510I.                                               03790000
003800     MOVE WS-DA-CREA TO DA-CREA-FORM-AS-R OF VMDZ510I.            03800000
003810     STRING DA-CR-FORM-AS-Y   OF VMDZ510I '-'                     03810000
003820        DA-CR-FORM-AS-M   OF VMDZ510I '-'                         03820000
003830        DA-CR-FORM-AS-D   OF VMDZ510I '-'                         03830000
003840            '01.01.01.000001'                                     03840000
003850        DELIMITED BY SIZE                                         03850000
003860       INTO TS-CREA-OORD      OF VMDZ510I.                        03860000
003870        MOVE WS-NR-ID  TO NR-ID-FORM-AS OF VMDZ510I.              03870000
003880        MOVE WS-CT-OPG TO CT-OPG-FORM-AS-R OF VMDZ510I.           03880000
003890        MOVE WS-CT-OPD TO CT-OPD-FORM-AS-R OF VMDZ510I.           03890000
003900                                                                  03900000
003910        MOVE NR-IDISSUE-479BEFF OF DCLDZBEFFTV TO WS-NR-ID-ISSUE  03910000
003920        MOVE NR-CDISSUE-479BEFF OF DCLDZBEFFTV TO WS-NR-CD-ISSUE  03920000
003930        MOVE WS-NR-ISSUE TO NR-ISSUIN-OORD OF VMDZ510I.           03930000
003940        MOVE AM-CNSTK-479BEFF OF DCLDZBEFFTV                      03940000
003950       TO AM-CNS-FORM-AS      OF VMDZ510I.                        03950000
003960        MOVE NR-IDSTOCK-479BEFF OF DCLDZBEFFTV TO                 03960000
003970       NR-ST-FORM-AS-R(1:12) OF VMDZ510I.                         03970000
003980        MOVE NR-CDSTK-479BEFF OF DCLDZBEFFTV TO                   03980000
003990       NR-ST-FORM-AS-R(13:1)                                      03990000
004000       OF VMDZ510I.                                               04000000
004010        MOVE NR-IDSTOCK-479BEFF OF DCLDZBEFFTV TO                 04010000
004020       NR-STIN-OORD(1:12)                                         04020000
004030       OF VMDZ510I.                                               04030000
004040        MOVE NR-CDSTK-479BEFF OF DCLDZBEFFTV TO NR-STIN-OORD(13:1)04040000
004050       OF VMDZ510I.                                               04050000
004060        MOVE SPACES TO NR-STIN-OORD(14:1) OF VMDZ510I.            04060000
004070        MOVE NS-DBSTK-479BEFF OF DCLDZBEFFTV                      04070000
004080       TO NS-DBST-OORD        OF VMDZ510I.                        04080000
004090        IF NX-CPCRESK-479BEFF OF DCLDZBEFFTV = 0                  04090000
004100           MOVE AM-CNDSTK-479BEFF OF DCLDZBEFFTV                  04100000
004110         TO AM-CND-FORM-AS      OF VMDZ510I                       04110000
004120        ELSE                                                      04120000
004130           MOVE AM-INTERSK-479BEFF OF DCLDZBEFFTV                 04130000
004140         TO AM-INTER-FORM-AS    OF VMDZ510I                       04140000
004150        END-IF.                                                   04150000
004160        MOVE CO-IDPRKSK-479BEFF OF DCLDZBEFFTV                    04160000
004170       TO NR-ID-040SECU       OF VMDZ510I.                        04170000
004180        MOVE NS-IRMOSTK-479BEFF OF DCLDZBEFFTV                    04180000
004190       TO NS-SEQ-040IRMO      OF VMDZ510I.                        04190000
004200 MOVE DA-UBSECIS-479BEFF OF DCLDZBEFFTV TO DA-DD-MM-CCYY          04200000
004210 EVALUATE TRUE                                                    04210000
004220   WHEN DA-DD-MM-CCYY = '01.01.0001'                              04220000
004230     MOVE ZEROES TO DA-CCYYMMDD-R                                 04230000
004240   WHEN DA-DD-MM-CCYY = '31.12.9999'                              04240000
004250     MOVE '99999999' TO DA-CCYYMMDD-R                             04250000
004260   WHEN OTHER                                                     04260000
004270     MOVE CCYY OF DA-DD-MM-CCYY TO CCYY OF DA-CCYYMMDD-R          04270000
004280     MOVE MM OF DA-DD-MM-CCYY TO MM OF DA-CCYYMMDD-R              04280000
004290     MOVE DD OF DA-DD-MM-CCYY TO DD OF DA-CCYYMMDD-R              04290000
004300 END-EVALUATE                                                     04300000
004310 MOVE DA-CCYYMMDD-R TO HELP-DA-UBSECIS-STOCK.                     04310000
004320 MOVE HELP-DA-UBSECIS-STOCK TO DA-UB-FORM-AS OF VMDZ510I.         04320000
004330 MOVE DA-CREVTPD-479EVEF OF DCLDZEVEFTV TO DA-DD-MM-CCYY          04330000
004340 EVALUATE TRUE                                                    04340000
004350   WHEN DA-DD-MM-CCYY = '01.01.0001'                              04350000
004360     MOVE ZEROES TO DA-CCYYMMDD-R                                 04360000
004370   WHEN DA-DD-MM-CCYY = '31.12.9999'                              04370000
004380     MOVE '99999999' TO DA-CCYYMMDD-R                             04380000
004390   WHEN OTHER                                                     04390000
004400     MOVE CCYY OF DA-DD-MM-CCYY TO CCYY OF DA-CCYYMMDD-R          04400000
004410     MOVE MM OF DA-DD-MM-CCYY TO MM OF DA-CCYYMMDD-R              04410000
004420     MOVE DD OF DA-DD-MM-CCYY TO DD OF DA-CCYYMMDD-R              04420000
004430 END-EVALUATE                                                     04430000
004440 MOVE DA-CCYYMMDD-R TO HELP-DA-CR-EVENT-PROD.                     04440000
004450 MOVE HELP-DA-CR-EVENT-PROD TO DA-COMPTABILISATION-OPER           04450000
004460   OF VMDZ510I.                                                   04460000
004470 MOVE HELP-DA-CR-EVENT-PROD TO DA-EXEC-OORD OF VMDZ510I.          04470000
004480                                                                  04480000
004490        MOVE NX-CPCRESK-479BEFF OF DCLDZBEFFTV                    04490000
004500       TO NS-RANK-COUP        OF VMDZ510I.                        04500000
004510        MOVE NX-CPAIDSK-479BEFF OF DCLDZBEFFTV                    04510000
004520       TO NX-CPAID-STOCK      OF VMDZ510I.                        04520000
004530*    MOVE NX-CPFDU-STOCK      OF VMBEFF                           04530000
004540                                                                  04540000
004550* EXTRA ZONES OPVULLEN                                            04550000
004560                                                                  04560000
004570        EVALUATE WS-CT-OPD                                        04570000
004580          WHEN 00                                                 04580000
004590               MOVE 'MU' TO CO-TYPOPER-OORD OF VMDZ510I           04590000
004600          WHEN OTHER                                              04600000
004610               MOVE '??' TO CO-TYPOPER-OORD OF VMDZ510I           04610000
004620               DISPLAY 'ABEND VERKEERDE CT-OPD = '                04620000
004630               WS-CT-OPD                                          04630000
004640               DISPLAY DCLDZBEFFTV                                04640000
004650               DISPLAY DCLDZEVEFTV                                04650000
004660               CALL USERABEN                                      04660000
004670        END-EVALUATE.                                             04670000
004680* UITGIFTE = SRW DUS '1'                                          04680000
004690        MOVE '1' TO CO-ISSUIN-OORD OF VMDZ510I.                   04690000
004700        MOVE 001 TO NB-ST-OORD OF VMDZ510I.                       04700000
004710* EFFECT = IKB = DEXIA DUS '1'                                    04710000
004720        MOVE '1' TO CO-STIN-OORD OF VMDZ510I.                     04720000
004730                                                                  04730000
004740        ADD 1 TO VOLGNUMMER.                                      04740000
004750        STRING 'CIR '                                             04750000
004760           CT-OPD-FORM-AS OF VMDZ510I ' '                         04760000
004770           VOLGNUMMER                                             04770000
004780           DELIMITED BY SIZE                                      04780000
004790       INTO NR-REFORD-OORD OF VMDZ510I.                           04790000
004800                                                                  04800000
004810* EXTRA'S ANNIE STEPPE                                            04810000
004820           STRING 'X'                                             04820000
004830            '000000'                                              04830000
004840            '      '                                              04840000
004850              DELIMITED BY SIZE                                   04850000
004860       INTO NR-TRANS-OORD  OF VMDZ510I.                           04860000
004870* 10=AGENCY 11=ZETEL                                              04870000
004880*    IF NR-CIO-FORM-AS OF VMDZ510I =                              04880000
004890*       NR-CIW-FORM-AS OF VMDZ510I                                04890000
004900              MOVE '10' TO CO-TYPKAN2-OORD OF VMDZ510I            04900000
004910*    ELSE                                                         04910000
004920*      MOVE '11' TO CO-TYPKAN2-OORD OF VMDZ510I                   04920000
004930*    END-IF.                                                      04930000
004940              MOVE 'DX' TO CO-BANK-OORD OF VMDZ510I.              04940000
004950                                                                  04950000
004960              MOVE WS-OLD-CI TO NR-CIINPTR-OORD OF VMDZ510I.      04960000
004970                                                                  04970000
004980*----------------------------------------------------------------*04980000
004990 WRITE-MUTATIES.                                                  04990000
005000     DISPLAY 'WRITE-MUTATIES.'.                                   05000000
005010*--------------                                                   05010000
005020     ADD 1 TO WS-COUNT-TREATED                                    05020000
005030     WRITE FO-MUTATIES-REC FROM VMDZ510I                          05030000
005040     .                                                            05040000
005050                                                                  05050000
005060*----------------------------------------------------------------*05060000
005070 READ-MUTATIES.                                                   05070000
005080     DISPLAY 'READ-MUTATIES.'.                                    05080000
005090*-------------                                                    05090000
005100     READ FI-MUTATIES INTO    WS-MUTATIES                         05100000
005110        AT END                                                    05110000
005120        SET MUTATIES-EOF TO TRUE                                  05120000
005130     NOT AT END                                                   05130000
005140        ADD 1 TO WS-TOTAL-INPUT                                   05140000
005150        CONTINUE                                                  05150000
005160     END-READ                                                     05160000
005170     .                                                            05170000
005180                                                                  05180000
005190/---------------------------------------------------------------* 05190000
005200*    ERROR HANDLING                                               05200000
005210*---------------------------------------------------------------* 05210000
005220                                                                  05220000
005230                                                                  05230000
005240 1100-GET-TIMESTAMP.                                              05240000
005250     DISPLAY '1100-GET-TIMESTAMP.'.                               05250000
005260D    DISPLAY '600-GET-TIMESTAMP.'                                 05260000
005270     MOVE FUNCTION CURRENT-DATE TO TS-SYSTEM.                     05270000
005280     MOVE CC OF TS-SYSTEM       TO CC OF TS-TIMESTAMP             05280000
005290     MOVE YY OF TS-SYSTEM       TO YY OF TS-TIMESTAMP             05290000
005300     MOVE MM OF TS-SYSTEM       TO MM OF TS-TIMESTAMP             05300000
005310     MOVE DD OF TS-SYSTEM       TO DD OF TS-TIMESTAMP             05310000
005320     MOVE HH OF TS-SYSTEM       TO HH OF TS-TIMESTAMP             05320000
005330     MOVE MI OF TS-SYSTEM       TO MI OF TS-TIMESTAMP             05330000
005340     MOVE SS OF TS-SYSTEM       TO SS OF TS-TIMESTAMP             05340000
005350     MOVE TT OF TS-SYSTEM       TO TT OF TS-TIMESTAMP             05350000
005360     DISPLAY 'TIMESTAMP: ' TS-TIMESTAMP                           05360000
005370     .                                                            05370000
005380                                                                  05380000
005390*SQLERROR ROUTINE.                                                05390000
005400     EXEC SQL                                                     05400000
005410          INCLUDE SQLERROR                                        05410000
005420     END-EXEC.                                                    05420000
