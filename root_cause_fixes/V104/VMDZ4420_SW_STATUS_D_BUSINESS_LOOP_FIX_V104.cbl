000010 CBL ARITH(EXTEND)                                                00000100
000020 IDENTIFICATION DIVISION.                                         00000200
000030*------------------------                                         00000300
000040 PROGRAM-ID. VMDZ4420.                                            00000400
000050 AUTHOR.       PYTHON-AUTOMATION-USING-AI.                        00000500
000060 DATE-WRITTEN. 2026-10-26.                                        00000600
000070*                                                                 00000700
000080******************************************************************00000800
000090*                                                                *00000900
000100*                INFORMATORISCHE KASBON 2.                       *00001000
000110*                                                                *00001100
000120******************************************************************00001200
000130*                                                                *00001300
000140*                VERGELIJKING DATABASE EN INVENTARIS             *00001400
000150*                -----------------------------------             *00001500
000160*                                                                *00001600
000170*                TWEEDE PROGRAMMA :                              *00001700
000180*                                                                *00001800
000190*                OPZOEKEN VAN ALLE EFFECTEN EN ALLE EVENEMENTEN  *00001900
000200*                DIE NOG IN LEVEN ZIJN.                          *00002000
000210*                                                                *00002100
000220* 01/06/92 : DE SCHEPPER KOEN (HCS AS) - PROBLEM RECORD 436451   *00002200
000230*            WAARDEN DIE NOG IN STOCK ZIJN MOGEN NIET MEEGENOMEN *00002300
000240*            WORDEN IN HET OUTPUTBESTAND.                        *00002400
000250*                                                                *00002500
000260* 16/06/92 : DE SCHEPPER KOEN (HCS AS) - PROBLEM RECORD 436451   *00002600
000270*            BIJVOEGEN PARMDATE + TEST OP DA-CRE-EVENT-PROD      *00002700
000280*                                                                *00002800
000290* 12/03/97 : HEYSE K. (SOFT GUIDE)                               *00002900
000300*            AANPASSINGEN EURO EN 2000                           *00003000
000310*            UITBREIDEN BEDRAGEN                                 *00003100
000320*            UITBREIDEN JAARTAL TOT 4 POS VOOR 2000              *00003200
000330*                                                                *00003300
000340* 04/03/98 : DE SCHEPPER KOEN - PROJECT 5421 : TESTWAARDEN       *00003400
000350*            CI CREATIE MEE DOORGEVEN NAAR VERVOLG OM DE         *00003500
000360*            SPLITSING TEST-REEEL TE KUNNEN DOEN                 *00003600
000370* J-M BOOGAERTS                                                  *00003700
000380* 2004/12 REPRENDRE N° DE TITRE EN OUTPUT (12 POS DE LIBRES)     *00003800
000390*                                                                *00003900
000400*                                                                *00004000
000410******************************************************************00004100
000420/                                                                 00004200
000430 ENVIRONMENT DIVISION.                                            00004300
000440*---------------------                                            00004400
000450 INPUT-OUTPUT SECTION.                                            00004500
000460 FILE-CONTROL.                                                    00004600
000470     SELECT UITBST ASSIGN TO UT-S-DD005.                          00004700
000480/                                                                 00004800
000490 DATA DIVISION.                                                   00004900
000500*--------------                                                   00005000
000510 FILE SECTION.                                                    00005100
000520*                                                                 00005200
000530 FD  UITBST                                                       00005300
000540     BLOCK CONTAINS 0 RECORDS                                     00005400
000550     RECORD CONTAINS 50 CHARACTERS                                00005500
000560     RECORDING MODE F                                             00005600
000570     LABEL RECORDS STANDARD.                                      00005700
000580 01  UITRECORD.                                                   00005800
000590     03  UIT-AM-CN-STOCK          PIC S9(13)V99 COMP-3.           00005900
000600     03  UIT-AM-CND-STOCK         PIC S9(13)V99 COMP-3.           00006000
000610     03  UIT-NR-CIO-CRE           PIC 9(6).                       00006100
000620     03  UIT-NR-ID                PIC X(04).                      00006200
000630     03  UIT-NS-SEQ               PIC 9(04).                      00006300
000640     03  UIT-DA-UBSEC             PIC X(08).                      00006400
000650     03  UIT-NR-ST                PIC X(12).                      00006500
000660*                                                                 00006600
000670*                                                                 00006700
000680 WORKING-STORAGE SECTION.                                         00006800
000690*                                                                 00006900
000700 01  WS-TE-WORK.                                                  00007000
000710     10  WS-STATUS                PIC X    VALUE SPACE.           00007100
000720     10  SW-STATUS-D              PIC X    VALUE 'N'.             00007200
000730     10  USERABEN                 PIC X(8) VALUE 'USERABEN'.      00007300
000740     10  WS-NR-ID-GOOD.                                           00007400
000750         20  WS-NR-CIO-CRE        PIC 9(8) COMP-3.                00007500
000760         20  WS-DA-CR-CRE         PIC 9(8) COMP-3.                00007600
000770         20  WS-NR-ID-CRE         PIC 9(6) COMP-3.                00007700
000780         20  WS-CT-OPD-CRE        PIC S9(3) COMP-3.               00007800
000790         20  WS-CT-OPG-CRE        PIC 9(3) COMP-3.                00007900
000800         20  FILLER               PIC X(2).                       00008000
000810     10  CS-PROGRAM               PIC X(8)    VALUE 'VMDZ4420'.   00008100
000820     10  WS-NB-OUTPUT-COUNT       PIC 9(7)    COMP-3 VALUE ZEROES.00008200
000830     10  WS-NB-BEFF-COUNT         PIC 9(7)    COMP-3 VALUE ZEROES.00008300
000840*                                                                 00008400
000850*----- FIELDS ESDATMAS ------------------------------------------*00008500
000860     COPY ESDATMAS.                                               00008600
000870*----- FIELDS PARAMETER DATE ------------------------------------*00008700
000880 01  ZONE-DATONLY.                                                00008800
000890     03  DATE6R-WS.                                               00008900
000900         05  D-YEAR               PIC 99.                         00009000
000910         05  D-MONTH              PIC 99.                         00009100
000920         05  D-DAY                PIC 99.                         00009200
000930     03  DATE6 REDEFINES DATE6R-WS.                               00009300
000940         05  D-DAY                PIC 99.                         00009400
000950         05  D-MONTH              PIC 99.                         00009500
000960         05  D-YEAR               PIC 99.                         00009600
000970     03  DATE8.                                                   00009700
000980         05  D-DAY                PIC 99.                         00009800
000990         05  D-MONTH              PIC 99.                         00009900
001000         05  D-CENT               PIC 99.                         00010000
001010         05  D-YEAR               PIC 99.                         00010100
001020     03  PARMDATE.                                                00010200
001030         05  D-YEAR               PIC 9(4).                       00010300
001040         05  D-MONTH              PIC 9(2).                       00010400
001050         05  D-DAY                PIC 9(2).                       00010500
001060*                                                                 00010600
001070                                                                  00010700
001080     EXEC SQL INCLUDE SQLERRWS END-EXEC.                          00010800
001090     EXEC SQL INCLUDE SQLCA END-EXEC.                             00010900
001100     EXEC SQL INCLUDE DZBEFFTV END-EXEC.                          00011000
001110     EXEC SQL INCLUDE DZEVEFTV END-EXEC.                          00011100
001120                                                                  00011200
001130 01  WS-DZBEFFC1-FLAG               PIC X.                        00011300
001140     88  DZBEFFC1-NOT-EOC           VALUE 'N'.                    00011400
001150     88  DZBEFFC1-EOC               VALUE 'Y'.                    00011500
001160                                                                  00011600
001170 01  WS-DZEVEFC1-FLAG               PIC X.                        00011700
001180     88  DZEVEFC1-NOT-EOC           VALUE 'N'.                    00011800
001190     88  DZEVEFC1-EOC               VALUE 'Y'.                    00011900
001200                                                                  00012000
001210                                                                  00012100
001220     EXEC SQL DECLARE DZBEFFC1 CURSOR FOR                         00012200
001230       SELECT AM_CNDSTK_479BEFF                                   00012300
001240            , AM_CNSTK_479BEFF                                    00012400
001250            , CO_IDPRKSK_479BEFF                                  00012500
001260            , DA_UBSECIS_479BEFF                                  00012600
001270            , NR_IDSTOCK_479BEFF                                  00012700
001280            , NS_IRMOSTK_479BEFF                                  00012800
001290            , CT_RKTPROD_479BEFF                                  00012900
001300            , NR_CDSTK_479BEFF                                    00013000
001310            , NS_DBSTK_479BEFF                                    00013100
001320       FROM DZBEFFTV                                              00013200
001330       FOR READ ONLY                                              00013300
001340       QUERYNO 254                                                00013400
001350     END-EXEC                                                     00013500
001360                                                                  00013600
001370     EXEC SQL DECLARE DZEVEFC1 CURSOR FOR                         00013700
001380       SELECT CO_STEVPRN_479EVEF                                  00013800
001390            , CT_RKTEVPR_479EVEF                                  00013900
001400            , DA_CREVTPD_479EVEF                                  00014000
001410            , NR_IDGOOD_479EVEF                                   00014100
001420            , NR_ID_479EVEF                                       00014200
001430       FROM DZEVEFTV                                              00014300
001440       WHERE CT_RKTPROD_479BEFF = :DCLDZBEFFTV.CT-RKTPROD-479BEFF 00014400
001450         AND NR_IDSTOCK_479BEFF = :DCLDZBEFFTV.NR-IDSTOCK-479BEFF 00014500
001460         AND NR_CDSTK_479BEFF = :DCLDZBEFFTV.NR-CDSTK-479BEFF     00014600
001470         AND NS_DBSTK_479BEFF = :DCLDZBEFFTV.NS-DBSTK-479BEFF     00014700
001480       ORDER BY NR_ID_479EVEF DESC                                00014800
001490       FOR READ ONLY                                              00014900
001500       QUERYNO 255                                                00015000
001510     END-EXEC.                                                    00015100
001520                                                                  00015200
001530*DB2 DATE CONVERSION WORKING STORAGE                              00015300
001540 01  WS-DATUMVELDEN.                                              00015400
001550     03  DA-CCYYMMDD.                                             00015500
001560         05  CC                    PIC 99       VALUE ZERO.       00015600
001570         05  YY                    PIC 99       VALUE ZERO.       00015700
001580         05  MM                    PIC 99       VALUE ZERO.       00015800
001590         05  DD                    PIC 99       VALUE ZERO.       00015900
001600     03  DA-CCYYMMDD-R REDEFINES DA-CCYYMMDD.                     00016000
001610         05  CCYY                  PIC 9999.                      00016100
001620         05  MM                    PIC 99.                        00016200
001630         05  DD                    PIC 99.                        00016300
001640     03  DA-DD-MM-CCYY.                                           00016400
001650         05  DD                    PIC 9(02).                     00016500
001660         05  TE-MARKER5            PIC X        VALUE '.'.        00016600
001670         05  MM                    PIC 9(02).                     00016700
001680         05  TE-MARKER6            PIC X        VALUE '.'.        00016800
001690         05  CCYY                  PIC 9(04).                     00016900
001700     02  HELP-DA-CREVTPD-479EVEF        PIC 9(8)     VALUE ZEROES.00017000
001710                                                                  00017100
001720                                                                  00017200
001730 01  WS-TIMESTAMP-FIELDS.                                         00017300
001740     05 TS-SYSTEM.                                                00017400
001750        10  DA-SYS.                                               00017500
001760            15  DA-SYS-CCYY.                                      00017600
001770                20  CC            PIC X(2).                       00017700
001780                20  YY            PIC X(2).                       00017800
001790            15  MM                PIC X(2).                       00017900
001800            15  DD                PIC X(2).                       00018000
001810        10  HR-SYS.                                               00018100
001820            15  HH                PIC X(2).                       00018200
001830            15  MI                PIC X(2).                       00018300
001840            15  SS                PIC X(2).                       00018400
001850            15  TT                PIC X(2).                       00018500
001860     05 TS-TIMESTAMP.                                             00018600
001870        10  CC                    PIC X(2).                       00018700
001880        10  YY                    PIC X(2).                       00018800
001890        10  TE-MARKER1            PIC X             VALUE '-'.    00018900
001900        10  MM                    PIC X(2).                       00019000
001910        10  TE-MARKER2            PIC X             VALUE '-'.    00019100
001920        10  DD                    PIC X(2).                       00019200
001930        10  TE-MARKER3            PIC X             VALUE '-'.    00019300
001940        10  HH                    PIC X(2).                       00019400
001950        10  TE-MARKER4            PIC X             VALUE '.'.    00019500
001960        10  MI                    PIC X(2).                       00019600
001970        10  TE-MARKER5            PIC X             VALUE '.'.    00019700
001980        10  SS                    PIC X(2).                       00019800
001990        10  TE-MARKER6            PIC X             VALUE '.'.    00019900
002000        10  TT                    PIC X(2).                       00020000
002010        10  NNNN                  PIC 9(04)         VALUE 0.      00020100
002020                                                                  00020200
002030 LINKAGE SECTION.                                                 00020300
002040 01  PARAM-DATONLY.                                               00020400
002050     03  L-PARAM                  PIC S9(4) COMP.                 00020500
002060     03  DATUMLS.                                                 00020600
002070         05  DATE-IND             PIC X.                          00020700
002080         05  DATE8-LS             PIC X(8).                       00020800
002090     EJECT                                                        00020900
002100 PROCEDURE DIVISION USING PARAM-DATONLY.                          00021000
002110*                                                                 00021100
002120* INITIALISATIE                                                   00021200
002130*                                                                 00021300
002140     PERFORM 600-GET-TIMESTAMP.                                   00021400
002150     IF DATE-IND = '0'                                            00021500
002160        ACCEPT DATE6R-WS FROM DATE                                00021600
002170        MOVE CORR DATE6R-WS TO DATE8                              00021700
002180        IF D-YEAR OF DATE8 > 60                                   00021800
002190           MOVE 19 TO D-CENT OF DATE8                             00021900
002200        ELSE MOVE 20 TO D-CENT OF DATE8                           00022000
002210        END-IF                                                    00022100
002220        MOVE CORR DATE8 TO DATE6                                  00022200
002230     ELSE                                                         00022300
002240        MOVE DATE8-LS   TO DATE8                                  00022400
002250        MOVE CORR DATE8 TO DATE6                                  00022500
002260     END-IF.                                                      00022600
002270     MOVE DATE6 TO ES-DATUM.                                      00022700
002280     MOVE ZEROES TO ES-DAGEN,                                     00022800
002290                    ES-TYPE-DAG.                                  00022900
002300     MOVE '+' TO ES-PLUS-MIN.                                     00023000
002310*                                                                 00023100
002320     CALL ESDATMAS USING ES-DATUM ES-DAGEN ES-TYPE-DAG ES-PLUS-MIN00023200
002330     ES-ANTWOORD ES-RETURN-CODE ES-WERKZONE.                      00023300
002340*                                                                 00023400
002350     IF ES-RETURN-CODE = '0'                                      00023500
002360        MOVE ES-JJJJ TO D-YEAR OF PARMDATE                        00023600
002370        MOVE ES-MM   TO D-MONTH OF PARMDATE                       00023700
002380        MOVE ES-DD   TO D-DAY OF PARMDATE                         00023800
002390     ELSE DISPLAY '***********************************'           00023900
002400        DISPLAY ' '                                               00024000
002410        DISPLAY 'PARAMETER DATE IN ERROR = ' DATE6                00024100
002420        DISPLAY ' '                                               00024200
002430        DISPLAY '***********************************'             00024300
002440        CALL USERABEN                                             00024400
002450     END-IF.                                                      00024500
002460*                                                                 00024600
002470     MOVE CS-PROGRAM TO PROGRAM-NAME.                             00024700
002480     OPEN OUTPUT UITBST.                                          00024800
002490                                                                  00024900
002500     INITIALIZE DCLDZBEFFTV                                       00025000
002510     PERFORM 2100-OPEN-DZBEFFC1.                                  00025100
002520     PERFORM 2200-FETCH-DZBEFFC1.                                 00025200
002530*                                                                 00025300
002540                                                                  00025400
002550* HOOFDVERWERKING                                                 00025500
002560*                                                                 00025600
002570     PERFORM HOOFDVERWERKING                                      00025700
002580       UNTIL DZBEFFC1-EOC.                                        00025800
002590       PERFORM 2300-CLOSE-DZBEFFC1.                               00025900
002600*                                                                 00026000
002610* EINDVERWERKING                                                  00026100
002620*                                                                 00026200
002630     CLOSE UITBST.                                                00026300
002640     DISPLAY 'TOTAL BEFF RECORDS   : ' WS-NB-BEFF-COUNT           00026400
002650     DISPLAY 'TOTAL OUTPUT RECORDS : ' WS-NB-OUTPUT-COUNT         00026500
002660                                                                  00026600
002670     STOP RUN.                                                    00026700
002680/                                                                 00026800
002690 HOOFDVERWERKING.                                                 00026900
002700     DISPLAY 'HOOFDVERWERKING.'.                                  00027000
002710*                                                                 00027100
002720* OPZOEKEN VAN ALLE EVENEMENTEN BIJ EEN EFFECT                    00027200
002730*                                                                 00027300
002740     MOVE SPACE TO WS-STATUS                                      00027400
002750     INITIALIZE DCLDZEVEFTV                                       00027500
002760     PERFORM 3100-OPEN-DZEVEFC1                                   00027600
002770                                                                  00027700
002780     MOVE 'N' TO SW-STATUS-D                                      00027800
002790     PERFORM 3200-FETCH-DZEVEFC1 UNTIL DZEVEFC1-EOC OR            00027900
002800                                   SW-STATUS-D = 'Y'              00028000
002810     PERFORM 3300-CLOSE-DZEVEFC1.                                 00028100
002820     IF NOT SW-STATUS-D = 'Y'                                     00028200
002830        IF WS-STATUS = 'C'                                        00028300
002840           PERFORM WRITE-UITRECORD                                00028400
002850           ADD 1 TO WS-NB-OUTPUT-COUNT                            00028500
002860        END-IF                                                    00028600
002870     END-IF.                                                      00028700
002880*                                                                 00028800
002890* OPZOEKEN VAN VOLGEND EFFECT IN DE AREA                          00028900
002900*                                                                 00029000
002910     PERFORM 2200-FETCH-DZBEFFC1.                                 00029100
002920*                                                                 00029200
002930 VERWERK-VMBEVEF.                                                 00029300
002940                                                                  00029400
002950                                                                  00029500
002960                                                                  00029600
002970                                                                  00029700
002980                                                                  00029800
002990                                                                  00029900
003000                                                                  00030000
003010                                                                  00030100
003020                                                                  00030200
003030                                                                  00030300
003040                                                                  00030400
003050                                                                  00030500
003060                                                                  00030600
003070                                                                  00030700
003080                                                                  00030800
003090                                                                  00030900
003100                                                                  00031000
003110                                                                  00031100
003120                                                                  00031200
003130                                                                  00031300
003140                                                                  00031400
003150                                                                  00031500
003160                                                                  00031600
003170                                                                  00031700
003180                                                                  00031800
003190                                                                  00031900
003200                                                                  00032000
003210     DISPLAY 'VERWERK-VMBEVEF.'.                                  00032100
003220     MOVE ZEROES TO DA-CCYYMMDD                                   00032200
003230     MOVE ZEROES TO HELP-DA-CREVTPD-479EVEF                       00032300
003240     MOVE DA-CREVTPD-479EVEF OF DCLDZEVEFTV TO DA-DD-MM-CCYY      00032400
003250     EVALUATE TRUE                                                00032500
003260       WHEN DA-DD-MM-CCYY = '01.01.0001'                          00032600
003270            MOVE ZEROES                TO DA-CCYYMMDD-R           00032700
003280       WHEN DA-DD-MM-CCYY = '31.12.9999'                          00032800
003290            MOVE '99999999'            TO DA-CCYYMMDD-R           00032900
003300       WHEN OTHER                                                 00033000
003310            MOVE CCYY OF DA-DD-MM-CCYY TO CCYY OF DA-CCYYMMDD-R   00033100
003320            MOVE MM   OF DA-DD-MM-CCYY TO MM OF DA-CCYYMMDD-R     00033200
003330            MOVE DD   OF DA-DD-MM-CCYY TO DD OF DA-CCYYMMDD-R     00033300
003340     END-EVALUATE                                                 00033400
003350     MOVE DA-CCYYMMDD-R TO HELP-DA-CREVTPD-479EVEF                00033500
003360     IF HELP-DA-CREVTPD-479EVEF NOT > PARMDATE                    00033600
003370        IF CT-RKTEVPR-479EVEF OF DCLDZEVEFTV = '0060' AND         00033700
003380             WS-STATUS NOT = 'D'                                  00033800
003390           MOVE 'C'                              TO WS-STATUS     00033900
003400           MOVE NR-IDGOOD-479EVEF OF DCLDZEVEFTV TO WS-NR-ID-GOOD 00034000
003410        ELSE                                                      00034100
003420           IF CT-RKTEVPR-479EVEF OF DCLDZEVEFTV = '0168' AND      00034200
003430                  CO-STEVPRN-479EVEF OF DCLDZEVEFTV NOT = '1'     00034300
003440              MOVE 'D' TO WS-STATUS                               00034400
003450              MOVE 'Y' TO SW-STATUS-D                             00034500
003460           ELSE                                                   00034600
003470              IF CT-RKTEVPR-479EVEF OF DCLDZEVEFTV = '0217'       00034700
003480                      AND WS-STATUS = SPACE                       00034800
003490                 MOVE 'S' TO WS-STATUS                            00034900
003500              END-IF                                              00035000
003510           END-IF                                                 00035100
003520        END-IF                                                    00035200
003530     END-IF.                                                      00035300
003540/                                                                 00035400
003550                                                                  00035500
003560                                                                  00035600
003570                                                                  00035700
003580/                                                                 00035800
003590 WRITE-UITRECORD.                                                 00035900
003600     DISPLAY 'WRITE-UITRECORD.'.                                  00036000
003610     INITIALIZE UITRECORD                                         00036100
003620     MOVE AM-CNSTK-479BEFF OF DCLDZBEFFTV   TO UIT-AM-CN-STOCK    00036200
003630     MOVE AM-CNDSTK-479BEFF OF DCLDZBEFFTV  TO UIT-AM-CND-STOCK   00036300
003640     MOVE WS-NR-CIO-CRE                     TO UIT-NR-CIO-CRE     00036400
003650     MOVE CO-IDPRKSK-479BEFF OF DCLDZBEFFTV TO UIT-NR-ID          00036500
003660     MOVE NS-IRMOSTK-479BEFF OF DCLDZBEFFTV TO UIT-NS-SEQ         00036600
003670     MOVE ZEROES                            TO DA-CCYYMMDD        00036700
003680     MOVE DA-UBSECIS-479BEFF OF DCLDZBEFFTV TO DA-DD-MM-CCYY      00036800
003690     EVALUATE TRUE                                                00036900
003700       WHEN DA-DD-MM-CCYY = '01.01.0001'                          00037000
003710            MOVE ZEROES                TO DA-CCYYMMDD-R           00037100
003720       WHEN DA-DD-MM-CCYY = '31.12.9999'                          00037200
003730            MOVE '99999999'            TO DA-CCYYMMDD-R           00037300
003740       WHEN OTHER                                                 00037400
003750            MOVE CCYY OF DA-DD-MM-CCYY TO CCYY OF DA-CCYYMMDD-R   00037500
003760            MOVE MM   OF DA-DD-MM-CCYY TO MM OF DA-CCYYMMDD-R     00037600
003770            MOVE DD   OF DA-DD-MM-CCYY TO DD OF DA-CCYYMMDD-R     00037700
003780     END-EVALUATE                                                 00037800
003790     MOVE DA-CCYYMMDD-R                     TO UIT-DA-UBSEC       00037900
003800     MOVE NR-IDSTOCK-479BEFF OF DCLDZBEFFTV TO UIT-NR-ST          00038000
003810     WRITE UITRECORD.                                             00038100
003820                                                                  00038200
003830 2100-OPEN-DZBEFFC1.                                              00038300
003840     DISPLAY '2100-OPEN-DZBEFFC1.'.                               00038400
003850     MOVE 2100 TO SQL-LOCATION                                    00038500
003860                                                                  00038600
003870     EXEC SQL                                                     00038700
003880       OPEN DZBEFFC1                                              00038800
003890     END-EXEC                                                     00038900
003900                                                                  00039000
003910     EVALUATE SQLCODE                                             00039100
003920       WHEN ZERO                                                  00039200
003930            SET DZBEFFC1-NOT-EOC TO TRUE                          00039300
003940       WHEN OTHER                                                 00039400
003950            DISPLAY 'ERROR WHILE OPENING CURSOR DZBEFFC1'         00039500
003960            PERFORM SQLERROR                                      00039600
003970     END-EVALUATE                                                 00039700
003980     .                                                            00039800
003990                                                                  00039900
004000 2200-FETCH-DZBEFFC1.                                             00040000
004010     DISPLAY '2200-FETCH-DZBEFFC1.'.                              00040100
004020     SET DZBEFFC1-NOT-EOC TO TRUE                                 00040200
004030     MOVE 2200 TO SQL-LOCATION                                    00040300
004040                                                                  00040400
004050     EXEC SQL                                                     00040500
004060       FETCH DZBEFFC1                                             00040600
004070        INTO :DCLDZBEFFTV.AM-CNDSTK-479BEFF                       00040700
004080           , :DCLDZBEFFTV.AM-CNSTK-479BEFF                        00040800
004090           , :DCLDZBEFFTV.CO-IDPRKSK-479BEFF                      00040900
004100           , :DCLDZBEFFTV.DA-UBSECIS-479BEFF                      00041000
004110           , :DCLDZBEFFTV.NR-IDSTOCK-479BEFF                      00041100
004120           , :DCLDZBEFFTV.NS-IRMOSTK-479BEFF                      00041200
004130           , :DCLDZBEFFTV.CT-RKTPROD-479BEFF                      00041300
004140           , :DCLDZBEFFTV.NR-CDSTK-479BEFF                        00041400
004150           , :DCLDZBEFFTV.NS-DBSTK-479BEFF                        00041500
004160     END-EXEC                                                     00041600
004170                                                                  00041700
004180     EVALUATE SQLCODE                                             00041800
004190       WHEN ZERO                                                  00041900
004200            ADD 1 TO WS-NB-BEFF-COUNT                             00042000
004210            CONTINUE                                              00042100
004220       WHEN 100                                                   00042200
004230            SET DZBEFFC1-EOC TO TRUE                              00042300
004240       WHEN OTHER                                                 00042400
004250            DISPLAY 'ERROR WHILE FETCHING CURSOR DZBEFFC1'        00042500
004260            PERFORM SQLERROR                                      00042600
004270     END-EVALUATE                                                 00042700
004280                                                                  00042800
004290                                                                  00042900
004300                                                                  00043000
004310                                                                  00043100
004320                                                                  00043200
004330                                                                  00043300
004340                                                                  00043400
004350                                                                  00043500
004360     .                                                            00043600
004370                                                                  00043700
004380 2300-CLOSE-DZBEFFC1.                                             00043800
004390     DISPLAY '2300-CLOSE-DZBEFFC1.'.                              00043900
004400     MOVE 2300 TO SQL-LOCATION                                    00044000
004410                                                                  00044100
004420     EXEC SQL                                                     00044200
004430       CLOSE DZBEFFC1                                             00044300
004440     END-EXEC                                                     00044400
004450                                                                  00044500
004460     EVALUATE SQLCODE                                             00044600
004470       WHEN ZERO                                                  00044700
004480            CONTINUE                                              00044800
004490       WHEN OTHER                                                 00044900
004500            DISPLAY 'ERROR WHILE CLOSING CURSOR DZBEFFC1'         00045000
004510            PERFORM SQLERROR                                      00045100
004520     END-EVALUATE                                                 00045200
004530                                                                  00045300
004540                                                                  00045400
004550                                                                  00045500
004560                                                                  00045600
004570                                                                  00045700
004580                                                                  00045800
004590                                                                  00045900
004600                                                                  00046000
004610     .                                                            00046100
004620                                                                  00046200
004630 3100-OPEN-DZEVEFC1.                                              00046300
004640     DISPLAY '3100-OPEN-DZEVEFC1.'.                               00046400
004650     MOVE 3100 TO SQL-LOCATION                                    00046500
004660                                                                  00046600
004670     EXEC SQL                                                     00046700
004680       OPEN DZEVEFC1                                              00046800
004690     END-EXEC                                                     00046900
004700                                                                  00047000
004710     EVALUATE SQLCODE                                             00047100
004720       WHEN ZERO                                                  00047200
004730            SET DZEVEFC1-NOT-EOC TO TRUE                          00047300
004740       WHEN OTHER                                                 00047400
004750            DISPLAY 'ERROR WHILE OPENING CURSOR DZEVEFC1'         00047500
004760            PERFORM SQLERROR                                      00047600
004770     END-EVALUATE                                                 00047700
004780     .                                                            00047800
004790                                                                  00047900
004800 3200-FETCH-DZEVEFC1.                                             00048000
004810     DISPLAY '3200-FETCH-DZEVEFC1.'.                              00048100
004820     SET DZEVEFC1-NOT-EOC TO TRUE                                 00048200
004830     MOVE 3200 TO SQL-LOCATION                                    00048300
004840                                                                  00048400
004850     EXEC SQL                                                     00048500
004860       FETCH DZEVEFC1                                             00048600
004870        INTO :DCLDZEVEFTV.CO-STEVPRN-479EVEF                      00048700
004880           , :DCLDZEVEFTV.CT-RKTEVPR-479EVEF                      00048800
004890           , :DCLDZEVEFTV.DA-CREVTPD-479EVEF                      00048900
004900           , :DCLDZEVEFTV.NR-IDGOOD-479EVEF                       00049000
004910           , :DCLDZEVEFTV.NR-ID-479EVEF                           00049100
004920     END-EXEC                                                     00049200
004930                                                                  00049300
004940     EVALUATE SQLCODE                                             00049400
004950       WHEN ZERO                                                  00049500
004960     PERFORM VERWERK-VMBEVEF                                      00049600
004970       WHEN 100                                                   00049700
004980            SET DZEVEFC1-EOC TO TRUE                              00049800
004990       WHEN OTHER                                                 00049900
005000            DISPLAY 'ERROR WHILE FETCHING CURSOR DZEVEFC1'        00050000
005010            DISPLAY 'CT-RK-TPROD    = ' CT-RKTPROD-479BEFF        00050100
005020                                        OF DCLDZBEFFTV            00050200
005030            DISPLAY 'NR-ID-STOCK-R1 = ' NR-IDSTOCK-479BEFF        00050300
005040                                        OF DCLDZBEFFTV            00050400
005050            DISPLAY 'NR-CD-STOCK    = ' NR-CDSTK-479BEFF          00050500
005060                                        OF DCLDZBEFFTV            00050600
005070            DISPLAY 'NS-DB-STOCK    = ' NS-DBSTK-479BEFF          00050700
005080                                        OF DCLDZBEFFTV            00050800
005090            PERFORM SQLERROR                                      00050900
005100     END-EVALUATE                                                 00051000
005110                                                                  00051100
005120                                                                  00051200
005130                                                                  00051300
005140                                                                  00051400
005150                                                                  00051500
005160                                                                  00051600
005170                                                                  00051700
005180                                                                  00051800
005190     .                                                            00051900
005200                                                                  00052000
005210 3300-CLOSE-DZEVEFC1.                                             00052100
005220     DISPLAY '3300-CLOSE-DZEVEFC1.'.                              00052200
005230     MOVE 3300 TO SQL-LOCATION                                    00052300
005240                                                                  00052400
005250     EXEC SQL                                                     00052500
005260       CLOSE DZEVEFC1                                             00052600
005270     END-EXEC                                                     00052700
005280                                                                  00052800
005290     EVALUATE SQLCODE                                             00052900
005300       WHEN ZERO                                                  00053000
005310            CONTINUE                                              00053100
005320       WHEN OTHER                                                 00053200
005330            DISPLAY 'ERROR WHILE CLOSING CURSOR DZEVEFC1'         00053300
005340            PERFORM SQLERROR                                      00053400
005350     END-EVALUATE                                                 00053500
005360     .                                                            00053600
005370                                                                  00053700
005380                                                                  00053800
005390 600-GET-TIMESTAMP.                                               00053900
005400     DISPLAY '600-GET-TIMESTAMP.'.                                00054000
005410     MOVE FUNCTION CURRENT-DATE TO TS-SYSTEM.                     00054100
005420     MOVE CC OF TS-SYSTEM       TO CC OF TS-TIMESTAMP             00054200
005430     MOVE YY OF TS-SYSTEM       TO YY OF TS-TIMESTAMP             00054300
005440     MOVE MM OF TS-SYSTEM       TO MM OF TS-TIMESTAMP             00054400
005450     MOVE DD OF TS-SYSTEM       TO DD OF TS-TIMESTAMP             00054500
005460     MOVE HH OF TS-SYSTEM       TO HH OF TS-TIMESTAMP             00054600
005470     MOVE MI OF TS-SYSTEM       TO MI OF TS-TIMESTAMP             00054700
005480     MOVE SS OF TS-SYSTEM       TO SS OF TS-TIMESTAMP             00054800
005490     MOVE TT OF TS-SYSTEM       TO TT OF TS-TIMESTAMP             00054900
005500     DISPLAY 'TIMESTAMP: ' TS-TIMESTAMP                           00055000
005510     .                                                            00055100
005520                                                                  00055200
005530*SQLERROR ROUTINE.                                                00055300
005540     EXEC SQL                                                     00055400
005550          INCLUDE SQLERROR                                        00055500
005560     END-EXEC.                                                    00055600
