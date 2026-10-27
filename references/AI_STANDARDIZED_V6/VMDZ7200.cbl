000010 CBL ARITH(EXTEND)                                                00010000
000020 IDENTIFICATION DIVISION.                                         00020000
000030*========================                                         00030000
000040 PROGRAM-ID. VMDZ7200.                                            00040000
000050 AUTHOR.     JAINRG 2026/05.                                      00050000
000060                                                                  00060000
000070******************************************************************00070000
000080*                                                                 00080000
000090*    ARCHIVAGE :  THIS PROGRAM IS BEING USED FOR "ARCHIVING       00090000
000100*    =========    EXTRACT FOR SUBSCRIPTION AND CANCELLATION       00100000
000110*                 FORMS" BY FETCH THE DATA FROM THE FOLLOWING     00110000
000120*                 KASBONS DB2 TABLE BY USING THE INPUT KASBONS    00120000
000130*                 DATA: DZBFASTB                                  00130000
000140******************************************************************00140000
000150                                                                  00150000
000160 ENVIRONMENT DIVISION.                                            00160000
000170*=====================                                            00170000
000180 CONFIGURATION SECTION.                                           00180000
000190*----------------------                                           00190000
000200 SPECIAL-NAMES.                                                   00200000
000210     DECIMAL-POINT IS COMMA.                                      00210000
000220*                                                                 00220000
000230 INPUT-OUTPUT SECTION.                                            00230000
000240*---------------------                                            00240000
000250 FILE-CONTROL.                                                    00250000
000260     SELECT DAARCH   ASSIGN TO UT-S-DD005.                        00260000
000270     SELECT FORM     ASSIGN TO UT-S-DD010.                        00270000
000280*                                                                 00280000
000290/                                                                 00290000
000300 DATA DIVISION.                                                   00300000
000310*==============                                                   00310000
000320 FILE SECTION.                                                    00320000
000330*-------------                                                    00330000
000340*    ----- DATE ARCHIVAGE -----                                   00340000
000350*                                                                 00350000
000360 FD  DAARCH     RECORDING F                                       00360000
000370                RECORD CONTAINS 20                                00370000
000380                BLOCK CONTAINS 0                                  00380000
000390                LABEL RECORD STANDARD.                            00390000
000400 01  DAARCH-REC                PIC X(20).                         00400000
000410*                                                                 00410000
000420*    ----- GESELECTEERDE FORMULIEREN -----                        00420000
000430*                                                                 00430000
000440 FD  FORM       RECORDING F                                       00440000
000450                RECORD CONTAINS 530                               00450000
000460                BLOCK CONTAINS 0                                  00460000
000470                LABEL RECORD STANDARD.                            00470000
000480 01  FORM-REC                  PIC X(530).                        00480000
000490/                                                                 00490000
000500*                                                                 00500000
000510 WORKING-STORAGE SECTION.                                         00510000
000520*------------------------                                         00520000
000530*                                                                 00530000
000540 77  USERABEN                  PIC X(8)          VALUE 'USERABEN'.00540000
000550 77  CS-PROGRAM PIC X(8) VALUE 'VMDZ7200'.                        00550000
000560 77  WS-TELLER                 PIC S9(11) COMP-3 VALUE ZERO.      00560000
000570 77  WS-NB-BFAS-COUNT         PIC 9(7) COMP-3 VALUE ZEROES.       00570000
000580 77  WS-NB-OUTPUT-COUNT       PIC 9(7) COMP-3 VALUE ZEROES.       00580000
000590 77  HELP-TELLER               PIC Z(11).                         00590000
000600 01  WS-DA-ARCH-YMD            PIC 9(10).                         00600000
000610*                                                                 00610000
000620 01  WS-CURSOR-FLAG            PIC X.                             00620000
000630     88  DZBFASC1-NOT-EOC                        VALUE 'N'.       00630000
000640     88  DZBFASC1-EOC                            VALUE 'Y'.       00640000
000650 01  W-NR-IS-FORM-AS           PIC 9(9).                          00650000
000660 01  FILLER REDEFINES W-NR-IS-FORM-AS.                            00660000
000670     05  W-NR-ID-ISSUE         PIC 9(7).                          00670000
000680     05  W-NR-CD-ISSUE         PIC 9(2).                          00680000
000690 01  REC-FORM.                                                    00690000
000700     05  F-FORM.                                                  00700000
000710       06 VMBFAS.                                                 00710000
000720          07 KY-VMBFAS.                                           00720000
000730             08 NR-RK-GOOD-V02.                                   00730000
000740                09 CT-RK-TGDSERV.                                 00740000
000750                   10 CT-RK-TGDSV           PIC X(4).             00750000
000760                   10 CT-RK-TGOOD           REDEFINES CT-RK-TGDSV 00760000
000770                                            PIC 9(4).             00770000
000780                09 GR-ID-GOOD-V02.                                00780000
000790                   10 NR-CIO-FORM-AS        PIC 9(8)       COMP-3.00790000
000800                   10 DA-CR-FORM-AS         PIC 9(8)       COMP-3.00800000
000810                   10 NR-ID-FORM-AS         PIC 9(6)       COMP-3.00810000
000820                   10 CT-OP-FORM-AS.                              00820000
000830                      12 CT-OPD-FORM-AS     PIC S9(3)      COMP-3.00830000
000840                      12 CT-OPG-FORM-AS     PIC 9(3)       COMP-3.00840000
000850                   10 FILLER                PIC X(2).             00850000
000860          07 AT-FORM-AS.                                          00860000
000870             08 NR-CIW-FORM-AS              PIC X(8).             00870000
000880             08 DA-VA-FORM-AS.                                    00880000
000890                09 DA-VA-FORM-AS-Y          PIC 9(4).             00890000
000900                09 DA-VA-FORM-AS-M          PIC 9(2).             00900000
000910                09 DA-VA-FORM-AS-D          PIC 9(2).             00910000
000920             08 CO-VM-FORM-AS               PIC X(1).             00920000
000930             08 NR-IS-FORM-AS               PIC 9(9).             00930000
000940             08 RA-RT-FORM-AS               PIC S9(3)V9(3) COMP-3.00940000
000950             08 RA-CP-FORM-AS               PIC S9(3)V9(3) COMP-3.00950000
000960             08 RA-BASE-FORM-AS             PIC S9(3)V9(3) COMP-3.00960000
000970             08 DA-UB-FORM-AS.                                    00970000
000980                09 DA-UB-FORM-AS-Y          PIC 9(4).             00980000
000990                09 DA-UB-FORM-AS-M          PIC 9(2).             00990000
001000                09 DA-UB-FORM-AS-D          PIC 9(2).             01000000
001010             08 DA-UE-FORM-AS.                                    01010000
001020                09 DA-UE-FORM-AS-Y          PIC 9(4).             01020000
001030                09 DA-UE-FORM-AS-M          PIC 9(2).             01030000
001040                09 DA-UE-FORM-AS-D          PIC 9(2).             01040000
001050             08 DU-ST-FORM-AS               PIC 9(3).             01050000
001060             08 RA-PS-FORM-AS               PIC S9(3)V9(3) COMP-3.01060000
001070             08 RA-PR-FORM-AS               PIC S9(3)V9(3) COMP-3.01070000
001080             08 AM-CNS-FORM-AS              PIC S9(13)V99  COMP-3.01080000
001090             08 AM-PS-FORM-AS               PIC S9(13)V99  COMP-3.01090000
001100             08 NB-FI-FORM-AS               PIC 9(3).             01100000
001110             08 AM-FIN-FORM-AS              PIC S9(13)V99  COMP-3.01110000
001120             08 CO-RI-FORM-AS               PIC X(1).             01120000
001130             08 NR-IDR-FORM-AS              PIC 9(6).             01130000
001140             08 DA-UER-FORM-AS.                                   01140000
001150                09 DA-UER-FORM-AS-Y         PIC 9(4).             01150000
001160                09 DA-UER-FORM-AS-M         PIC 9(2).             01160000
001170                09 DA-UER-FORM-AS-D         PIC 9(2).             01170000
001180             08 AM-FBA-FORM-AS              PIC S9(13)V99  COMP-3.01180000
001190             08 AM-FBB-FORM-AS              PIC S9(13)V99  COMP-3.01190000
001200             08 CO-RM-FORM-AS               PIC X(1).             01200000
001210             08 RA-FB-FORM-AS               PIC S9(3)V9(3) COMP-3.01210000
001220             08 NB-FB-FORM-AS               PIC 9(2).             01220000
001230             08 AM-FBN-FORM-AS              PIC S9(13)V99  COMP-3.01230000
001240             08 RA-TI-FORM-AS               PIC 9(2)V9(2).        01240000
001250             08 AM-CND-FORM-AS              PIC S9(13)V99  COMP-3.01250000
001260             08 AM-CNDN-FORM-AS             PIC S9(13)V99  COMP-3.01260000
001270             08 AM-CNSN-FORM-AS             PIC S9(13)V99  COMP-3.01270000
001280             08 NR-CD-FORM-AS               PIC 9(4).             01280000
001290             08 CT-SL-FORM-AS               PIC X(1).             01290000
001300             08 NR-ST-FORM-AS               PIC 9(13).            01300000
001310             08 CX-TW-FORM-AS               PIC X(1).             01310000
001320             08 NR-DS-FORM-AS               PIC 9(12).            01320000
001330             08 NR-IDX-FORM-AS              PIC 9(6).             01330000
001340             08 CO-LA-FORM-AS               PIC X(1).             01340000
001350             08 AM-INTER-FORM-AS            PIC S9(13)V99  COMP-3.01350000
001360             08 NB-GROUP-FORM-AS            PIC 9(3).             01360000
001370             08 NR-PRGRP-FORM-AS            PIC 9(6).             01370000
001380             08 NR-NEGRP-FORM-AS            PIC 9(6).             01380000
001390             08 NR-FIGRP-FORM-AS            PIC 9(6).             01390000
001400             08 NR-SEGRP-FORM-AS            PIC 9(3).             01400000
001410          07 NS-IDCP-FORM-AS                PIC 9(3).             01410000
001420          07 AM-CNSSP-FORM-AS               PIC S9(13)V99  COMP-3.01420000
001430          07 RA-CPTOT-FORM-AS               PIC S9(3)V9(3) COMP-3.01430000
001440          07 CO-CP-FORM-AS                  PIC X.                01440000
001450          07 CO-PERIN-FORM-AS               PIC X.                01450000
001460          07 NS-ID-FORM-AS                  PIC 9(2).             01460000
001470          07 CO-DEV-FORM-AS                 PIC X(3).             01470000
001480          07 NB-KRDEV-FORM-AS               PIC S9(6)V9(5).       01480000
001490          07 AM-BSDEV-FORM-AS               PIC S9(13)V99  COMP-3.01490000
001500          07 CO-TYP-FORM-AS                 PIC X(3).             01500000
001510          07 CO-SUBTP-FORM-AS               PIC X(3).             01510000
001520          07 CO-CONT-FORM-AS                PIC X(3).             01520000
001530          07 CO-TPVGL-FORM-AS               PIC X(2).             01530000
001540          07 AM-VGL-FORM-AS                 PIC S9(13)V99  COMP-3.01540000
001550          07 NR-PROD-FORM-AS                PIC X(4).             01550000
001560          07 DA-ACTVR-FORM-AS.                                    01560000
001570             08 DY-ACTVR-FORM-AS            PIC 9(4).             01570000
001580             08 DM-ACTVR-FORM-AS            PIC 9(2).             01580000
001590             08 DD-ACTVR-FORM-AS            PIC 9(2).             01590000
001600          07 DA-INVTR-FORM-AS.                                    01600000
001610             08 DY-INVTR-FORM-AS            PIC 9(4).             01610000
001620             08 DM-INVTR-FORM-AS            PIC 9(2).             01620000
001630             08 DD-INVTR-FORM-AS            PIC 9(2).             01630000
001640          07 RA-QZTTI-FORM-AS               PIC S9(3)V999  COMP-3.01640000
001650          07 RA-DGTTI-FORM-AS               PIC S9(3)V9(3) COMP-3.01650000
001660          07 NB-DGTTI-FORM-AS               PIC 9(2).             01660000
001670          07 AM-DGTTI-FORM-AS               PIC S9(13)V99  COMP-3.01670000
001680          07 ST-DGTTI-FORM-AS               PIC 9(1).             01680000
001690          07 ST-PRRW-FORM-AS                PIC 9(1).             01690000
001700          07 RA-GIFT-FORM-AS                PIC S9(3)V9(3) COMP-3.01700000
001710          07 AM-GIFT-FORM-AS                PIC S9(13)V99  COMP-3.01710000
001720          07 ST-VOORH-FORM-AS               PIC 9(1).             01720000
001730          07 DA-CPTA-FORM-AS.                                     01730000
001740             08 DY-CPTA-FORM-AS             PIC 9(4).             01740000
001750             08 DM-CPTA-FORM-AS             PIC 9(2).             01750000
001760             08 DD-CPTA-FORM-AS             PIC 9(2).             01760000
001770          07 CO-EXTOB-FORM-AS               PIC X(1).             01770000
001780          07 CO-PLTOB-FORM-AS               PIC X(1).             01780000
001790          07 RA-TOB-FORM-AS                 PIC S9(3)V9(3) COMP-3.01790000
001800          07 AM-TOB-FORM-AS                 PIC S9(13)V99  COMP-3.01800000
001810          07 RA-TARPH-FORM-AS               PIC S9(3)V9(3) COMP-3.01810000
001820          07 AM-TARPH-FORM-AS               PIC S9(13)V99  COMP-3.01820000
001830          07 AM-BASE-FORM-AS                PIC S9(13)V99  COMP-3.01830000
001840          07 AM-FLK-FORM-AS                 PIC S9(3)V9(2) COMP-3.01840000
001850          07 FILLER                         PIC X(0014).          01850000
001860      06 FILLER                             PIC X(0046).          01860000
001870     05  F-SW-ARCH             PIC X.                             01870000
001880     05  F-SW-VMBFGD           PIC X.                             01880000
001890     05  F-TELLER              PIC S9(11) COMP-3.                 01890000
001900     05  F-NR-IS               PIC 9(7).                          01900000
001910     05  F-NR-ST               PIC 9(13).                         01910000
001920     05  FILLER                PIC X(24).                         01920000
001930*                                                                 01930000
001940 COPY VMDZ270I.                                                   01940000
001950*                                                                 01950000
001960 01  WS-DATUMS.                                                   01960000
001970     03  DATE-NUM8                PIC 9(8) VALUE ZERO.            01970000
001980     02  DATE-YMD.                                                01980000
001990         03  D-YEAR            PIC 9(2).                          01990000
002000         03  D-MONTH           PIC 9(2).                          02000000
002010         03  D-DAY             PIC 9(2).                          02010000
002020     02  DATE-YMD8.                                               02020000
002030         03  D-CENT            PIC 9(2).                          02030000
002040         03  D-YEAR            PIC 9(2).                          02040000
002050         03  D-MONTH           PIC 9(2).                          02050000
002060         03  D-DAY             PIC 9(2).                          02060000
002070     02  DATE-DMY8.                                               02070000
002080         03  D-DAY             PIC 9(2).                          02080000
002090         03  D-MONTH           PIC 9(2).                          02090000
002100         03  D-CENT            PIC 9(2).                          02100000
002110         03  D-YEAR            PIC 9(2).                          02110000
002120 01  WS-TIMESTAMP-FIELDS.                                         02120000
002130     05 TS-SYSTEM.                                                02130000
002140        10  DA-SYS.                                               02140000
002150            15  DA-SYS-CCYY.                                      02150000
002160                20  CC            PIC X(2).                       02160000
002170                20  YY            PIC X(2).                       02170000
002180            15  MM                PIC X(2).                       02180000
002190            15  DD                PIC X(2).                       02190000
002200        10  HR-SYS.                                               02200000
002210            15  HH                PIC X(2).                       02210000
002220            15  MI                PIC X(2).                       02220000
002230            15  SS                PIC X(2).                       02230000
002240            15  TT                PIC X(2).                       02240000
002250     05 TS-TIMESTAMP.                                             02250000
002260        10  CC                    PIC X(2).                       02260000
002270        10  YY                    PIC X(2).                       02270000
002280        10  TE-MARKER1            PIC X             VALUE '-'.    02280000
002290        10  MM                    PIC X(2).                       02290000
002300        10  TE-MARKER2            PIC X             VALUE '-'.    02300000
002310        10  DD                    PIC X(2).                       02310000
002320        10  TE-MARKER3            PIC X             VALUE '-'.    02320000
002330        10  HH                    PIC X(2).                       02330000
002340        10  TE-MARKER4            PIC X             VALUE '.'.    02340000
002350        10  MI                    PIC X(2).                       02350000
002360        10  TE-MARKER5            PIC X             VALUE '.'.    02360000
002370        10  SS                    PIC X(2).                       02370000
002380        10  TE-MARKER6            PIC X             VALUE '.'.    02380000
002390        10  TT                    PIC X(2).                       02390000
002400        10  NNNN                  PIC 9(04)         VALUE 0.      02400000
002410 01 WS-DATUMVELDEN.                                               02410000
002420    03  DA-YYMMDD.                                                02420000
002430        05  YY                   PIC 99       VALUE ZERO.         02430000
002440        05  MM                   PIC 99       VALUE ZERO.         02440000
002450        05  DD                   PIC 99       VALUE ZERO.         02450000
002460    03  DA-DDMMCCYY.                                              02460000
002470        05  DD                   PIC 99       VALUE ZERO.         02470000
002480        05  MM                   PIC 99       VALUE ZERO.         02480000
002490        05  CC                   PIC 99       VALUE ZERO.         02490000
002500        05  YY                   PIC 99       VALUE ZERO.         02500000
002510    03  DA-CCYYMMDD.                                              02510000
002520        05  CC                   PIC 99       VALUE ZERO.         02520000
002530        05  YY                   PIC 99       VALUE ZERO.         02530000
002540        05  MM                   PIC 99       VALUE ZERO.         02540000
002550        05  DD                   PIC 99       VALUE ZERO.         02550000
002560    03  DA-CCYYMMDD-R REDEFINES DA-CCYYMMDD.                      02560000
002570        05  CCYY                 PIC 9999.                        02570000
002580        05  MM                   PIC 99.                          02580000
002590        05  DD                   PIC 99.                          02590000
002600    03  DA-DD-MM-CCYY.                                            02600000
002610        05  DD                   PIC 9(02).                       02610000
002620        05  TE-MARKER5           PIC X        VALUE '.'.          02620000
002630        05  MM                   PIC 9(02).                       02630000
002640        05  TE-MARKER6           PIC X        VALUE '.'.          02640000
002650        05  CCYY                 PIC 9(04).                       02650000
002660*---- INCLUDE FOR DB2 ------------------------------------------* 02660000
002670     EXEC SQL INCLUDE SQLERRWS END-EXEC.                          02670000
002680     EXEC SQL INCLUDE SQLCA    END-EXEC.                          02680000
002690                                                                  02690000
002700*---- INCLUDE VIEWS --------------------------------------------* 02700000
002710     EXEC SQL INCLUDE DZBFASTV END-EXEC.                          02710000
002720                                                                  02720000
002730*---- CURSOR DECLARATION FOR DZBFASTV --------------------------* 02730000
002740     EXEC SQL DECLARE DZBFASC1 CURSOR FOR                         02740000
002750       SELECT CT_RKTGDSV_479BFAS                                  02750000
002760            , NR_CIOFMAS_479BFAS                                  02760000
002770            , DA_CRFMAS_479BFAS                                   02770000
002780            , NR_IDFMAS_479BFAS                                   02780000
002790            , CT_OPD_479BFAS                                      02790000
002800            , CT_OPG_479BFAS                                      02800000
002810            , NR_ID_479BFAS                                       02810000
002820            , NR_CIWFMAS_479BFAS                                  02820000
002830            , DA_VAFMAS_479BFAS                                   02830000
002840            , CO_VMFMAS_479BFAS                                   02840000
002850            , NR_ISFMAS_479BFAS                                   02850000
002860            , RA_RTFMAS_479BFAS                                   02860000
002870            , RA_CPFMAS_479BFAS                                   02870000
002880            , RA_BASFMAS_479BFAS                                  02880000
002890            , DA_UBFMAS_479BFAS                                   02890000
002900            , DA_UEFMAS_479BFAS                                   02900000
002910            , DU_STFMAS_479BFAS                                   02910000
002920            , RA_PSFMAS_479BFAS                                   02920000
002930            , RA_PRFMAS_479BFAS                                   02930000
002940            , AM_CNSFMAS_479BFAS                                  02940000
002950            , AM_PSFMAS_479BFAS                                   02950000
002960            , NB_FIFMAS_479BFAS                                   02960000
002970            , AM_FINFMAS_479BFAS                                  02970000
002980            , CO_RIFMAS_479BFAS                                   02980000
002990            , NR_IDRFMAS_479BFAS                                  02990000
003000            , DA_UERFMAS_479BFAS                                  03000000
003010            , AM_FBAFMAS_479BFAS                                  03010000
003020            , AM_FBBFMAS_479BFAS                                  03020000
003030            , CO_RMFMAS_479BFAS                                   03030000
003040            , RA_FBFMAS_479BFAS                                   03040000
003050            , NB_FBFMAS_479BFAS                                   03050000
003060            , AM_FBNFMAS_479BFAS                                  03060000
003070            , RA_TIFMAS_479BFAS                                   03070000
003080            , AM_CNDFMAS_479BFAS                                  03080000
003090            , AM_CNDNFAS_479BFAS                                  03090000
003100            , AM_CNSNFAS_479BFAS                                  03100000
003110            , NR_CDFMAS_479BFAS                                   03110000
003120            , CT_SLFMAS_479BFAS                                   03120000
003130            , NR_STFMAS_479BFAS                                   03130000
003140            , CX_TWFMAS_479BFAS                                   03140000
003150            , NR_DSFMAS_479BFAS                                   03150000
003160            , NR_IDXFMAS_479BFAS                                  03160000
003170            , CO_LAFMAS_479BFAS                                   03170000
003180            , AM_INTFMAS_479BFAS                                  03180000
003190            , NB_GRPFMAS_479BFAS                                  03190000
003200            , NR_PRGRPFS_479BFAS                                  03200000
003210            , NR_NEGRPFS_479BFAS                                  03210000
003220            , NR_FIGRPFS_479BFAS                                  03220000
003230            , NR_SEGRPFS_479BFAS                                  03230000
003240            , NS_IDCPFS_479BFAS                                   03240000
003250            , AM_CNSSPFS_479BFAS                                  03250000
003260            , RA_CPTOTFS_479BFAS                                  03260000
003270            , CO_CPFMAS_479BFAS                                   03270000
003280            , CO_PERINFS_479BFAS                                  03280000
003290            , NS_IDFMAS_479BFAS                                   03290000
003300            , CO_DEVFMAS_479BFAS                                  03300000
003310            , NB_KRDEVFS_479BFAS                                  03310000
003320            , AM_BSDECFS_479BFAS                                  03320000
003330            , CO_TYPFMAS_479BFAS                                  03330000
003340            , CO_SUBTPFS_479BFAS                                  03340000
003350            , CO_CONTFS_479BFAS                                   03350000
003360            , CO_TPVGLFS_479BFAS                                  03360000
003370            , AM_VGLFMAS_479BFAS                                  03370000
003380            , NR_PRDFMAS_479BFAS                                  03380000
003390            , DA_ACTVRFS_479BFAS                                  03390000
003400            , DA_INVTRFS_479BFAS                                  03400000
003410            , RA_QZTTIFS_479BFAS                                  03410000
003420            , RA_DGTTIFS_479BFAS                                  03420000
003430            , NB_DGTTIFS_479BFAS                                  03430000
003440            , AM_DGTTIFS_479BFAS                                  03440000
003450            , ST_DGTTIFS_479BFAS                                  03450000
003460            , ST_PRRWFS_479BFAS                                   03460000
003470            , RA_GIFTFS_479BFAS                                   03470000
003480            , AM_GIFTFS_479BFAS                                   03480000
003490            , ST_VOORHFS_479BFAS                                  03490000
003500            , DA_CPTAFS_479BFAS                                   03500000
003510            , CO_EXTOBFS_479BFAS                                  03510000
003520            , CO_PLTOBFS_479BFAS                                  03520000
003530            , RA_TOBFS_479BFAS                                    03530000
003540            , AM_TOBFS_479BFAS                                    03540000
003550            , RA_TARPHFS_479BFAS                                  03550000
003560            , AM_TARPH_479BFAS                                    03560000
003570            , AM_BASEFS_479BFAS                                   03570000
003580            , AM_FLKFS_479BFAS                                    03580000
003590       FROM DZBFASTV                                              03590000
003600       WHERE (DA_CPTAFS_479BFAS < :DCLDZBFASTV.DA-CPTAFS-479BFAS  03600000
003610              AND DA_CPTAFS_479BFAS <> '01.01.0001')              03610000
003620              OR                                                  03620000
003630              (DA_CRFMAS_479BFAS < :DCLDZBFASTV.DA-CRFMAS-479BFAS 03630000
003640              AND DA_CPTAFS_479BFAS = '01.01.0001')               03640000
003650       ORDER BY NR_ID_479BFAS ASC                                 03650000
003660       FOR READ ONLY                                              03660000
003670              QUERYNO 254                                         03670000
003680     END-EXEC.                                                    03680000
003690                                                                  03690000
003700/                                                                 03700000
003710 LINKAGE SECTION.                                                 03710000
003720 01  PARAM-ZONEDO.                                                03720000
003730     02  L-PARAM          PIC S9(4)   COMP.                       03730000
003740     02  DATUMLS.                                                 03740000
003750         03  DATE-IND     PIC X.                                  03750000
003760         03  DATE8-LS     PIC 9(8).                               03760000
003770/                                                                 03770000
003780 PROCEDURE DIVISION USING PARAM-ZONEDO.                           03780000
003790 0000-MAIN-PROCEDURE.                                             03790000
003800     PERFORM 1000-INITIALIZE-PROGRAM.                             03800000
003810     PERFORM 2000-PROCESS-PROGRAM.                                03810000
003820     PERFORM 3000-FINALIZE-PROGRAM.                               03820000
003830     GOBACK.                                                      03830000
003840 1000-INITIALIZE-PROGRAM.                                         03840000
003850     PERFORM 600-GET-TIMESTAMP.                                   03850000
003860     PERFORM 1000-BEGIN-PROGRAMMA THRU 1000-BEGIN-PROGRAMMA-EXIT. 03860000
003870 2000-PROCESS-PROGRAM.                                            03870000
003880     PERFORM 2000-TREAT-PROGRAM.                                  03880000
003890 3000-FINALIZE-PROGRAM.                                           03890000
003900     PERFORM EINDE-PROGRAMMA THRU EINDE-PROGRAMMA-EXIT.           03900000
003910     DISPLAY 'TOTAL BFAS RECORDS   : ' WS-NB-BFAS-COUNT.          03910000
003920     DISPLAY 'TOTAL OUTPUT RECORDS : ' WS-NB-OUTPUT-COUNT.        03920000
003930                                                                  03930000
003940 1000-BEGIN-PROGRAMMA.                                            03940000
003950*---------------------                                            03950000
003960     IF DATE-IND = '0'                                            03960000
003970        ACCEPT DATE-YMD         FROM DATE                         03970000
003980        MOVE CORR DATE-YMD    TO DATE-DMY8                        03980000
003990        IF D-YEAR OF DATE-YMD > 60                                03990000
004000           MOVE 19            TO D-CENT OF DATE-DMY8              04000000
004010        ELSE                                                      04010000
004020           MOVE 20            TO D-CENT OF DATE-DMY8              04020000
004030        END-IF                                                    04030000
004040     ELSE                                                         04040000
004050        MOVE DATE8-LS         TO DATE-DMY8                        04050000
004060        MOVE CORR DATE-DMY8   TO DATE-YMD                         04060000
004070     END-IF.                                                      04070000
004080     MOVE CORR DATE-DMY8      TO DATE-YMD8.                       04080000
004090                                                                  04090000
004100     OPEN INPUT  DAARCH                                           04100000
004110          OUTPUT FORM.                                            04110000
004120     READ DAARCH INTO VMDZ270I-REC                                04120000
004130          AT END                                                  04130000
004140             DISPLAY 'VMDZ7200: ** DATE ARCHIVAGE NOT OK **'      04140000
004150             CALL USERABEN.                                       04150000
004160     CLOSE DAARCH.                                                04160000
004170     MOVE CS-PROGRAM TO PROGRAM-NAME.                             04170000
004180     INITIALIZE DCLDZBFASTV.                                      04180000
004190     MOVE DA-ARCH-YMD OF VMDZ270I-REC TO DA-CCYYMMDD.             04190000
004200     MOVE CORR DA-CCYYMMDD-R    TO DA-DD-MM-CCYY.                 04200000
004210     MOVE DA-DD-MM-CCYY         TO WS-DA-ARCH-YMD.                04210000
004220     MOVE WS-DA-ARCH-YMD        TO DA-CPTAFS-479BFAS              04220000
004230                                OF DCLDZBFASTV.                   04230000
004240     MOVE WS-DA-ARCH-YMD        TO DA-CRFMAS-479BFAS              04240000
004250                                OF DCLDZBFASTV.                   04250000
004260*                                                                 04260000
004270 1000-BEGIN-PROGRAMMA-EXIT.                                       04270000
004280*-------------------------                                        04280000
004290     EXIT.                                                        04290000
004300*                                                                 04300000
004310 2100-OPEN-CURSOR-DZBFASC1.                                       04310000
004320*----------------------------                                     04320000
004330     MOVE 2100 TO SQL-LOCATION                                    04330000
004340     EXEC SQL                                                     04340000
004350       OPEN DZBFASC1                                              04350000
004360     END-EXEC                                                     04360000
004370     EVALUATE SQLCODE                                             04370000
004380       WHEN 0                                                     04380000
004390            SET DZBFASC1-NOT-EOC TO TRUE                          04390000
004400       WHEN OTHER                                                 04400000
004410            DISPLAY 'ERROR IN OPENING THE CURSOR DZBFASC1'        04410000
004420            PERFORM SQLERROR                                      04420000
004430     END-EVALUATE                                                 04430000
004440     .                                                            04440000
004450 2200-FETCH-CURSOR-DZBFASC1.                                      04450000
004460*-----------------------------                                    04460000
004470     INITIALIZE DCLDZBFASTV.                                      04470000
004480     SET DZBFASC1-NOT-EOC TO TRUE                                 04480000
004490     MOVE 2200 TO SQL-LOCATION                                    04490000
004500     EXEC SQL                                                     04500000
004510       FETCH DZBFASC1                                             04510000
004520        INTO :DCLDZBFASTV.CT-RKTGDSV-479BFAS                      04520000
004530           , :DCLDZBFASTV.NR-CIOFMAS-479BFAS                      04530000
004540           , :DCLDZBFASTV.DA-CRFMAS-479BFAS                       04540000
004550           , :DCLDZBFASTV.NR-IDFMAS-479BFAS                       04550000
004560           , :DCLDZBFASTV.CT-OPD-479BFAS                          04560000
004570           , :DCLDZBFASTV.CT-OPG-479BFAS                          04570000
004580           , :DCLDZBFASTV.NR-ID-479BFAS                           04580000
004590           , :DCLDZBFASTV.NR-CIWFMAS-479BFAS                      04590000
004600           , :DCLDZBFASTV.DA-VAFMAS-479BFAS                       04600000
004610           , :DCLDZBFASTV.CO-VMFMAS-479BFAS                       04610000
004620           , :DCLDZBFASTV.NR-ISFMAS-479BFAS                       04620000
004630           , :DCLDZBFASTV.RA-RTFMAS-479BFAS                       04630000
004640           , :DCLDZBFASTV.RA-CPFMAS-479BFAS                       04640000
004650           , :DCLDZBFASTV.RA-BASFMAS-479BFAS                      04650000
004660           , :DCLDZBFASTV.DA-UBFMAS-479BFAS                       04660000
004670           , :DCLDZBFASTV.DA-UEFMAS-479BFAS                       04670000
004680           , :DCLDZBFASTV.DU-STFMAS-479BFAS                       04680000
004690           , :DCLDZBFASTV.RA-PSFMAS-479BFAS                       04690000
004700           , :DCLDZBFASTV.RA-PRFMAS-479BFAS                       04700000
004710           , :DCLDZBFASTV.AM-CNSFMAS-479BFAS                      04710000
004720           , :DCLDZBFASTV.AM-PSFMAS-479BFAS                       04720000
004730           , :DCLDZBFASTV.NB-FIFMAS-479BFAS                       04730000
004740           , :DCLDZBFASTV.AM-FINFMAS-479BFAS                      04740000
004750           , :DCLDZBFASTV.CO-RIFMAS-479BFAS                       04750000
004760           , :DCLDZBFASTV.NR-IDRFMAS-479BFAS                      04760000
004770           , :DCLDZBFASTV.DA-UERFMAS-479BFAS                      04770000
004780           , :DCLDZBFASTV.AM-FBAFMAS-479BFAS                      04780000
004790           , :DCLDZBFASTV.AM-FBBFMAS-479BFAS                      04790000
004800           , :DCLDZBFASTV.CO-RMFMAS-479BFAS                       04800000
004810           , :DCLDZBFASTV.RA-FBFMAS-479BFAS                       04810000
004820           , :DCLDZBFASTV.NB-FBFMAS-479BFAS                       04820000
004830           , :DCLDZBFASTV.AM-FBNFMAS-479BFAS                      04830000
004840           , :DCLDZBFASTV.RA-TIFMAS-479BFAS                       04840000
004850           , :DCLDZBFASTV.AM-CNDFMAS-479BFAS                      04850000
004860           , :DCLDZBFASTV.AM-CNDNFAS-479BFAS                      04860000
004870           , :DCLDZBFASTV.AM-CNSNFAS-479BFAS                      04870000
004880           , :DCLDZBFASTV.NR-CDFMAS-479BFAS                       04880000
004890           , :DCLDZBFASTV.CT-SLFMAS-479BFAS                       04890000
004900           , :DCLDZBFASTV.NR-STFMAS-479BFAS                       04900000
004910           , :DCLDZBFASTV.CX-TWFMAS-479BFAS                       04910000
004920           , :DCLDZBFASTV.NR-DSFMAS-479BFAS                       04920000
004930           , :DCLDZBFASTV.NR-IDXFMAS-479BFAS                      04930000
004940           , :DCLDZBFASTV.CO-LAFMAS-479BFAS                       04940000
004950           , :DCLDZBFASTV.AM-INTFMAS-479BFAS                      04950000
004960           , :DCLDZBFASTV.NB-GRPFMAS-479BFAS                      04960000
004970           , :DCLDZBFASTV.NR-PRGRPFS-479BFAS                      04970000
004980           , :DCLDZBFASTV.NR-NEGRPFS-479BFAS                      04980000
004990           , :DCLDZBFASTV.NR-FIGRPFS-479BFAS                      04990000
005000           , :DCLDZBFASTV.NR-SEGRPFS-479BFAS                      05000000
005010           , :DCLDZBFASTV.NS-IDCPFS-479BFAS                       05010000
005020           , :DCLDZBFASTV.AM-CNSSPFS-479BFAS                      05020000
005030           , :DCLDZBFASTV.RA-CPTOTFS-479BFAS                      05030000
005040           , :DCLDZBFASTV.CO-CPFMAS-479BFAS                       05040000
005050           , :DCLDZBFASTV.CO-PERINFS-479BFAS                      05050000
005060           , :DCLDZBFASTV.NS-IDFMAS-479BFAS                       05060000
005070           , :DCLDZBFASTV.CO-DEVFMAS-479BFAS                      05070000
005080           , :DCLDZBFASTV.NB-KRDEVFS-479BFAS                      05080000
005090           , :DCLDZBFASTV.AM-BSDECFS-479BFAS                      05090000
005100           , :DCLDZBFASTV.CO-TYPFMAS-479BFAS                      05100000
005110           , :DCLDZBFASTV.CO-SUBTPFS-479BFAS                      05110000
005120           , :DCLDZBFASTV.CO-CONTFS-479BFAS                       05120000
005130           , :DCLDZBFASTV.CO-TPVGLFS-479BFAS                      05130000
005140           , :DCLDZBFASTV.AM-VGLFMAS-479BFAS                      05140000
005150           , :DCLDZBFASTV.NR-PRDFMAS-479BFAS                      05150000
005160           , :DCLDZBFASTV.DA-ACTVRFS-479BFAS                      05160000
005170           , :DCLDZBFASTV.DA-INVTRFS-479BFAS                      05170000
005180           , :DCLDZBFASTV.RA-QZTTIFS-479BFAS                      05180000
005190           , :DCLDZBFASTV.RA-DGTTIFS-479BFAS                      05190000
005200           , :DCLDZBFASTV.NB-DGTTIFS-479BFAS                      05200000
005210           , :DCLDZBFASTV.AM-DGTTIFS-479BFAS                      05210000
005220           , :DCLDZBFASTV.ST-DGTTIFS-479BFAS                      05220000
005230           , :DCLDZBFASTV.ST-PRRWFS-479BFAS                       05230000
005240           , :DCLDZBFASTV.RA-GIFTFS-479BFAS                       05240000
005250           , :DCLDZBFASTV.AM-GIFTFS-479BFAS                       05250000
005260           , :DCLDZBFASTV.ST-VOORHFS-479BFAS                      05260000
005270           , :DCLDZBFASTV.DA-CPTAFS-479BFAS                       05270000
005280           , :DCLDZBFASTV.CO-EXTOBFS-479BFAS                      05280000
005290           , :DCLDZBFASTV.CO-PLTOBFS-479BFAS                      05290000
005300           , :DCLDZBFASTV.RA-TOBFS-479BFAS                        05300000
005310           , :DCLDZBFASTV.AM-TOBFS-479BFAS                        05310000
005320           , :DCLDZBFASTV.RA-TARPHFS-479BFAS                      05320000
005330           , :DCLDZBFASTV.AM-TARPH-479BFAS                        05330000
005340           , :DCLDZBFASTV.AM-BASEFS-479BFAS                       05340000
005350           , :DCLDZBFASTV.AM-FLKFS-479BFAS                        05350000
005360     END-EXEC.                                                    05360000
005370                                                                  05370000
005380     EVALUATE SQLCODE                                             05380000
005390       WHEN ZERO                                                  05390000
005400     ADD 1 TO WS-NB-BFAS-COUNT                                    05400000
005410            PERFORM 2700-BEHANDELING                              05410000
005420       WHEN 100                                                   05420000
005430            SET DZBFASC1-EOC TO TRUE                              05430000
005440       WHEN OTHER                                                 05440000
005450            DISPLAY 'CT-RK-TGOOD : ' CT-RKTGDSV-479BFAS           05450000
005460                                     OF DCLDZBFASTV               05460000
005470                    'NR-CIO      : ' NR-CIOFMAS-479BFAS           05470000
005480                                     OF DCLDZBFASTV               05480000
005490                    'DA-CR       : ' DA-CRFMAS-479BFAS            05490000
005500                                     OF DCLDZBFASTV               05500000
005510                    'NR-IDFMAS   : ' NR-IDFMAS-479BFAS            05510000
005520                                     OF DCLDZBFASTV               05520000
005530                    'CT-OPG      : ' CT-OPG-479BFAS               05530000
005540                                     OF DCLDZBFASTV               05540000
005550                    'CT-OPD      : ' CT-OPD-479BFAS               05550000
005560                                     OF DCLDZBFASTV               05560000
005570                    'NR-ID       : ' NR-ID-479BFAS                05570000
005580                                     OF DCLDZBFASTV               05580000
005590            PERFORM SQLERROR                                      05590000
005600     END-EVALUATE                                                 05600000
005610     .                                                            05610000
005620*                                                                 05620000
005630 2300-CLOSE-CURSOR-DZBFASC1.                                      05630000
005640*-----------------------------                                    05640000
005650     MOVE 2300 TO SQL-LOCATION                                    05650000
005660     EXEC SQL                                                     05660000
005670       CLOSE DZBFASC1                                             05670000
005680     END-EXEC                                                     05680000
005690                                                                  05690000
005700     EVALUATE SQLCODE                                             05700000
005710       WHEN ZERO                                                  05710000
005720            CONTINUE                                              05720000
005730       WHEN OTHER                                                 05730000
005740            DISPLAY 'ERROR WHILE CLOSING CURSOR DZBFASC1'         05740000
005750            PERFORM SQLERROR                                      05750000
005760     END-EVALUATE                                                 05760000
005770     .                                                            05770000
005780           DISPLAY 'PROGRAM NAME   :' PROGRAM-NAME.               05780000
005790           DISPLAY 'INPUT FILE DATA:'.                            05790000
005800           DISPLAY 'DA-PARM-YMD    :' DA-PARM-YMD OF VMDZ270I-REC.05800000
005810           DISPLAY 'NB-ARCH-MM     :' NB-ARCH-YY  OF VMDZ270I-REC.05810000
005820           DISPLAY 'NB-ARCH-MM     :' NB-ARCH-MM  OF VMDZ270I-REC.05820000
005830           DISPLAY 'DA-ARCH-YMD    :' DA-ARCH-YMD OF VMDZ270I-REC.05830000
005840           MOVE WS-TELLER TO HELP-TELLER.                         05840000
005850           DISPLAY 'RECORDS FETCHED:' HELP-TELLER.                05850000
005860*                                                                 05860000
005870 2000-TREAT-PROGRAM.                                              05870000
005880*-------------------                                              05880000
005890     PERFORM 2100-OPEN-CURSOR-DZBFASC1.                           05890000
005900     PERFORM 2200-FETCH-CURSOR-DZBFASC1 UNTIL DZBFASC1-EOC.       05900000
005910     PERFORM 2300-CLOSE-CURSOR-DZBFASC1.                          05910000
005920*                                                                 05920000
005930 2700-BEHANDELING.                                                05930000
005940*-----------------                                                05940000
005950     MOVE SPACES TO REC-FORM.                                     05950000
005960*    IF (HULP-DA-CPTA-FORM-AS < DA-ARCH-YMD  AND                  05960000
005970*        HULP-DA-CPTA-FORM-AS NOT = '00000000') OR                05970000
005980*       (HULP-DA-CR-FORM-AS  < DA-ARCH-YMD AND                    05980000
005990*        HULP-DA-CPTA-FORM-AS = '00000000')                       05990000
006000           ADD 1              TO WS-TELLER                        06000000
006010           MOVE WS-TELLER     TO F-TELLER                         06010000
006020           MOVE CT-RKTGDSV-479BFAS OF DCLDZBFASTV TO              06020000
006030                                      CT-RK-TGDSV    OF VMBFAS    06030000
006040           MOVE NR-CIOFMAS-479BFAS OF DCLDZBFASTV TO              06040000
006050                                      NR-CIO-FORM-AS OF VMBFAS    06050000
006060           MOVE DA-CRFMAS-479BFAS OF DCLDZBFASTV  TO              06060000
006070                                                 DA-DD-MM-CCYY    06070000
006080           EVALUATE TRUE                                          06080000
006090            WHEN DA-DD-MM-CCYY = '01.01.0001'                     06090000
006100             MOVE ZEROES      TO DA-CCYYMMDD-R                    06100000
006110            WHEN DA-DD-MM-CCYY = '31.12.9999'                     06110000
006120             MOVE '99999999'  TO DA-CCYYMMDD-R                    06120000
006130            WHEN OTHER                                            06130000
006140             MOVE CCYY OF DA-DD-MM-CCYY TO CCYY OF DA-CCYYMMDD-R  06140000
006150             MOVE MM   OF DA-DD-MM-CCYY TO MM   OF DA-CCYYMMDD-R  06150000
006160             MOVE DD   OF DA-DD-MM-CCYY TO DD   OF DA-CCYYMMDD-R  06160000
006170           END-EVALUATE                                           06170000
006180      MOVE DA-CCYYMMDD-R TO DA-CR-FORM-AS  OF VMBFAS.             06180000
006190           MOVE NR-IDFMAS-479BFAS  OF DCLDZBFASTV TO              06190000
006200                                      NR-ID-FORM-AS  OF VMBFAS    06200000
006210           MOVE CT-OPD-479BFAS     OF DCLDZBFASTV TO              06210000
006220                                      CT-OPD-FORM-AS OF VMBFAS    06220000
006230           MOVE CT-OPG-479BFAS     OF DCLDZBFASTV TO              06230000
006240                                      CT-OPG-FORM-AS OF VMBFAS    06240000
006250           MOVE NR-CIWFMAS-479BFAS OF DCLDZBFASTV TO              06250000
006260                                      NR-CIW-FORM-AS OF VMBFAS    06260000
006270           MOVE DA-VAFMAS-479BFAS OF DCLDZBFASTV                  06270000
006280                                         TO DA-DD-MM-CCYY         06280000
006290           EVALUATE TRUE                                          06290000
006300            WHEN DA-DD-MM-CCYY = '01.01.0001'                     06300000
006310              MOVE ZEROES      TO DA-CCYYMMDD-R                   06310000
006320            WHEN DA-DD-MM-CCYY = '31.12.9999'                     06320000
006330              MOVE '99999999'  TO DA-CCYYMMDD-R                   06330000
006340            WHEN OTHER                                            06340000
006350              MOVE CCYY OF DA-DD-MM-CCYY TO CCYY OF DA-CCYYMMDD-R 06350000
006360              MOVE MM   OF DA-DD-MM-CCYY TO MM   OF DA-CCYYMMDD-R 06360000
006370              MOVE DD   OF DA-DD-MM-CCYY TO DD   OF DA-CCYYMMDD-R 06370000
006380           END-EVALUATE                                           06380000
006390      MOVE DA-CCYYMMDD-R TO DA-VA-FORM-AS OF VMBFAS.              06390000
006400           MOVE CO-VMFMAS-479BFAS OF DCLDZBFASTV TO               06400000
006410                                       CO-VM-FORM-AS OF VMBFAS    06410000
006420           MOVE NR-ISFMAS-479BFAS OF DCLDZBFASTV TO               06420000
006430                                       NR-IS-FORM-AS OF VMBFAS    06430000
006440           MOVE RA-RTFMAS-479BFAS OF DCLDZBFASTV TO               06440000
006450                                       RA-RT-FORM-AS OF VMBFAS    06450000
006460           MOVE RA-CPFMAS-479BFAS OF DCLDZBFASTV TO               06460000
006470                                       RA-CP-FORM-AS OF VMBFAS    06470000
006480           MOVE RA-BASFMAS-479BFAS OF DCLDZBFASTV TO              06480000
006490                                     RA-BASE-FORM-AS OF VMBFAS    06490000
006500           MOVE DA-UBFMAS-479BFAS OF DCLDZBFASTV                  06500000
006510                                             TO DA-DD-MM-CCYY     06510000
006520           EVALUATE TRUE                                          06520000
006530           WHEN DA-DD-MM-CCYY = '01.01.0001'                      06530000
006540           MOVE ZEROES      TO DA-CCYYMMDD-R                      06540000
006550           WHEN DA-DD-MM-CCYY = '31.12.9999'                      06550000
006560              MOVE '99999999'  TO DA-CCYYMMDD-R                   06560000
006570           WHEN OTHER                                             06570000
006580              MOVE CCYY OF DA-DD-MM-CCYY TO CCYY OF DA-CCYYMMDD-R 06580000
006590              MOVE MM   OF DA-DD-MM-CCYY TO MM   OF DA-CCYYMMDD-R 06590000
006600              MOVE DD   OF DA-DD-MM-CCYY TO DD   OF DA-CCYYMMDD-R 06600000
006610           END-EVALUATE                                           06610000
006620      MOVE DA-CCYYMMDD-R TO DA-UB-FORM-AS OF VMBFAS.              06620000
006630           MOVE DA-UEFMAS-479BFAS OF DCLDZBFASTV                  06630000
006640                                         TO DA-DD-MM-CCYY         06640000
006650           EVALUATE TRUE                                          06650000
006660           WHEN DA-DD-MM-CCYY = '01.01.0001'                      06660000
006670           MOVE ZEROES      TO DA-CCYYMMDD-R                      06670000
006680           WHEN DA-DD-MM-CCYY = '31.12.9999'                      06680000
006690              MOVE '99999999'  TO DA-CCYYMMDD-R                   06690000
006700           WHEN OTHER                                             06700000
006710              MOVE CCYY OF DA-DD-MM-CCYY TO CCYY OF DA-CCYYMMDD-R 06710000
006720              MOVE MM   OF DA-DD-MM-CCYY TO MM   OF DA-CCYYMMDD-R 06720000
006730              MOVE DD   OF DA-DD-MM-CCYY TO DD   OF DA-CCYYMMDD-R 06730000
006740           END-EVALUATE                                           06740000
006750      MOVE DA-CCYYMMDD-R TO DA-UE-FORM-AS OF VMBFAS.              06750000
006760           MOVE DU-STFMAS-479BFAS OF DCLDZBFASTV TO               06760000
006770                                       DU-ST-FORM-AS OF VMBFAS    06770000
006780           MOVE RA-PSFMAS-479BFAS OF DCLDZBFASTV TO               06780000
006790                                       RA-PS-FORM-AS OF VMBFAS    06790000
006800           MOVE RA-PRFMAS-479BFAS OF DCLDZBFASTV TO               06800000
006810                                       RA-PR-FORM-AS OF VMBFAS    06810000
006820           MOVE AM-CNSFMAS-479BFAS OF DCLDZBFASTV TO              06820000
006830                                      AM-CNS-FORM-AS OF VMBFAS    06830000
006840           MOVE AM-PSFMAS-479BFAS OF DCLDZBFASTV TO               06840000
006850                                       AM-PS-FORM-AS OF VMBFAS    06850000
006860           MOVE NB-FIFMAS-479BFAS OF DCLDZBFASTV TO               06860000
006870                                       NB-FI-FORM-AS OF VMBFAS    06870000
006880           MOVE AM-FINFMAS-479BFAS OF DCLDZBFASTV TO              06880000
006890                                      AM-FIN-FORM-AS OF VMBFAS    06890000
006900           MOVE CO-RIFMAS-479BFAS OF DCLDZBFASTV TO               06900000
006910                                       CO-RI-FORM-AS OF VMBFAS    06910000
006920           MOVE NR-IDRFMAS-479BFAS OF DCLDZBFASTV TO              06920000
006930                                      NR-IDR-FORM-AS OF VMBFAS    06930000
006940           MOVE DA-UERFMAS-479BFAS OF DCLDZBFASTV                 06940000
006950                                            TO DA-DD-MM-CCYY      06950000
006960           EVALUATE TRUE                                          06960000
006970           WHEN DA-DD-MM-CCYY = '01.01.0001'                      06970000
006980           MOVE ZEROES      TO DA-CCYYMMDD-R                      06980000
006990           WHEN DA-DD-MM-CCYY = '31.12.9999'                      06990000
007000              MOVE '99999999'  TO DA-CCYYMMDD-R                   07000000
007010           WHEN OTHER                                             07010000
007020              MOVE CCYY OF DA-DD-MM-CCYY TO CCYY OF DA-CCYYMMDD-R 07020000
007030              MOVE MM   OF DA-DD-MM-CCYY TO MM   OF DA-CCYYMMDD-R 07030000
007040              MOVE DD   OF DA-DD-MM-CCYY TO DD   OF DA-CCYYMMDD-R 07040000
007050           END-EVALUATE                                           07050000
007060      MOVE DA-CCYYMMDD-R TO DA-UER-FORM-AS OF VMBFAS.             07060000
007070           MOVE AM-FBAFMAS-479BFAS       OF DCLDZBFASTV TO        07070000
007080                                      AM-FBA-FORM-AS OF VMBFAS    07080000
007090           MOVE CO-RMFMAS-479BFAS        OF DCLDZBFASTV TO        07090000
007100                                       CO-RM-FORM-AS OF VMBFAS    07100000
007110           MOVE RA-FBFMAS-479BFAS        OF DCLDZBFASTV TO        07110000
007120                                       RA-FB-FORM-AS OF VMBFAS    07120000
007130           MOVE AM-FBBFMAS-479BFAS       OF DCLDZBFASTV TO        07130000
007140                                       AM-FBB-FORM-AS OF VMBFAS   07140000
007150           MOVE CO-RMFMAS-479BFAS        OF DCLDZBFASTV TO        07150000
007160                                       CO-RM-FORM-AS OF VMBFAS    07160000
007170           MOVE RA-FBFMAS-479BFAS        OF DCLDZBFASTV TO        07170000
007180                                       RA-FB-FORM-AS OF VMBFAS    07180000
007190           MOVE NB-FBFMAS-479BFAS        OF DCLDZBFASTV TO        07190000
007200                                       NB-FB-FORM-AS OF VMBFAS    07200000
007210           MOVE AM-FBNFMAS-479BFAS       OF DCLDZBFASTV TO        07210000
007220                                       AM-FBN-FORM-AS OF VMBFAS   07220000
007230           MOVE RA-TIFMAS-479BFAS        OF DCLDZBFASTV TO        07230000
007240                                       RA-TI-FORM-AS OF VMBFAS    07240000
007250           MOVE AM-CNDFMAS-479BFAS       OF DCLDZBFASTV TO        07250000
007260                                      AM-CND-FORM-AS OF VMBFAS    07260000
007270           MOVE AM-CNDNFAS-479BFAS       OF DCLDZBFASTV TO        07270000
007280                                     AM-CNDN-FORM-AS OF VMBFAS    07280000
007290           MOVE AM-CNSNFAS-479BFAS       OF DCLDZBFASTV TO        07290000
007300                                     AM-CNSN-FORM-AS OF VMBFAS    07300000
007310           MOVE NR-CDFMAS-479BFAS        OF DCLDZBFASTV TO        07310000
007320                                      NR-CD-FORM-AS  OF VMBFAS    07320000
007330           MOVE CT-SLFMAS-479BFAS        OF DCLDZBFASTV TO        07330000
007340                                     CT-SL-FORM-AS   OF VMBFAS    07340000
007350           MOVE NR-STFMAS-479BFAS        OF DCLDZBFASTV TO        07350000
007360                                       NR-ST-FORM-AS OF VMBFAS    07360000
007370           MOVE CX-TWFMAS-479BFAS        OF DCLDZBFASTV TO        07370000
007380                                       CX-TW-FORM-AS OF VMBFAS    07380000
007390           MOVE NR-DSFMAS-479BFAS        OF DCLDZBFASTV TO        07390000
007400                                       NR-DS-FORM-AS OF VMBFAS    07400000
007410           MOVE NR-IDXFMAS-479BFAS       OF DCLDZBFASTV TO        07410000
007420                                      NR-IDX-FORM-AS OF VMBFAS    07420000
007430           MOVE CO-LAFMAS-479BFAS        OF DCLDZBFASTV TO        07430000
007440                                       CO-LA-FORM-AS OF VMBFAS    07440000
007450           MOVE AM-INTFMAS-479BFAS       OF DCLDZBFASTV TO        07450000
007460                                    AM-INTER-FORM-AS OF VMBFAS    07460000
007470           MOVE NB-GRPFMAS-479BFAS       OF DCLDZBFASTV TO        07470000
007480                                    NB-GROUP-FORM-AS OF VMBFAS    07480000
007490           MOVE NR-PRGRPFS-479BFAS       OF DCLDZBFASTV TO        07490000
007500                                    NR-PRGRP-FORM-AS OF VMBFAS    07500000
007510           MOVE NR-NEGRPFS-479BFAS       OF DCLDZBFASTV TO        07510000
007520                                    NR-NEGRP-FORM-AS OF VMBFAS    07520000
007530           MOVE NR-FIGRPFS-479BFAS       OF DCLDZBFASTV TO        07530000
007540                                    NR-FIGRP-FORM-AS OF VMBFAS    07540000
007550           MOVE NR-SEGRPFS-479BFAS       OF DCLDZBFASTV TO        07550000
007560                                    NR-SEGRP-FORM-AS OF VMBFAS    07560000
007570           MOVE NS-IDCPFS-479BFAS        OF DCLDZBFASTV TO        07570000
007580                                    NS-IDCP-FORM-AS  OF VMBFAS    07580000
007590           MOVE AM-CNSSPFS-479BFAS       OF DCLDZBFASTV TO        07590000
007600                                    AM-CNSSP-FORM-AS OF VMBFAS    07600000
007610           MOVE RA-CPTOTFS-479BFAS       OF DCLDZBFASTV TO        07610000
007620                                    RA-CPTOT-FORM-AS OF VMBFAS    07620000
007630           MOVE CO-CPFMAS-479BFAS        OF DCLDZBFASTV TO        07630000
007640                                    CO-CP-FORM-AS    OF VMBFAS    07640000
007650           MOVE CO-PERINFS-479BFAS       OF DCLDZBFASTV TO        07650000
007660                                    CO-PERIN-FORM-AS OF VMBFAS    07660000
007670           MOVE NS-IDFMAS-479BFAS        OF DCLDZBFASTV TO        07670000
007680                                    NS-ID-FORM-AS    OF VMBFAS    07680000
007690           MOVE CO-DEVFMAS-479BFAS       OF DCLDZBFASTV TO        07690000
007700                                    CO-DEV-FORM-AS   OF VMBFAS    07700000
007710           MOVE NB-KRDEVFS-479BFAS       OF DCLDZBFASTV TO        07710000
007720                                    NB-KRDEV-FORM-AS OF VMBFAS    07720000
007730           MOVE AM-BSDECFS-479BFAS       OF DCLDZBFASTV TO        07730000
007740                                    AM-BSDEV-FORM-AS OF VMBFAS    07740000
007750           MOVE CO-TYPFMAS-479BFAS       OF DCLDZBFASTV TO        07750000
007760                                    CO-TYP-FORM-AS   OF VMBFAS    07760000
007770           MOVE CO-SUBTPFS-479BFAS       OF DCLDZBFASTV TO        07770000
007780                                    CO-SUBTP-FORM-AS OF VMBFAS    07780000
007790           MOVE CO-CONTFS-479BFAS        OF DCLDZBFASTV TO        07790000
007800                                    CO-CONT-FORM-AS  OF VMBFAS    07800000
007810           MOVE CO-TPVGLFS-479BFAS       OF DCLDZBFASTV TO        07810000
007820                                    CO-TPVGL-FORM-AS OF VMBFAS    07820000
007830           MOVE AM-VGLFMAS-479BFAS       OF DCLDZBFASTV TO        07830000
007840                                    AM-VGL-FORM-AS   OF VMBFAS    07840000
007850           MOVE NR-PRDFMAS-479BFAS       OF DCLDZBFASTV TO        07850000
007860                                    NR-PROD-FORM-AS  OF VMBFAS    07860000
007870           MOVE DA-ACTVRFS-479BFAS OF DCLDZBFASTV                 07870000
007880                                           TO DA-DD-MM-CCYY       07880000
007890           EVALUATE TRUE                                          07890000
007900           WHEN DA-DD-MM-CCYY = '01.01.0001'                      07900000
007910           MOVE ZEROES      TO DA-CCYYMMDD-R                      07910000
007920           WHEN DA-DD-MM-CCYY = '31.12.9999'                      07920000
007930              MOVE '99999999'  TO DA-CCYYMMDD-R                   07930000
007940           WHEN OTHER                                             07940000
007950              MOVE CCYY OF DA-DD-MM-CCYY TO CCYY OF DA-CCYYMMDD-R 07950000
007960              MOVE MM   OF DA-DD-MM-CCYY TO MM   OF DA-CCYYMMDD-R 07960000
007970              MOVE DD   OF DA-DD-MM-CCYY TO DD   OF DA-CCYYMMDD-R 07970000
007980           END-EVALUATE                                           07980000
007990      MOVE DA-CCYYMMDD-R TO DA-ACTVR-FORM-AS OF VMBFAS.           07990000
008000           MOVE DA-INVTRFS-479BFAS OF DCLDZBFASTV                 08000000
008010                                            TO DA-DD-MM-CCYY      08010000
008020           EVALUATE TRUE                                          08020000
008030           WHEN DA-DD-MM-CCYY = '01.01.0001'                      08030000
008040           MOVE ZEROES      TO DA-CCYYMMDD-R                      08040000
008050           WHEN DA-DD-MM-CCYY = '31.12.9999'                      08050000
008060              MOVE '99999999'  TO DA-CCYYMMDD-R                   08060000
008070           WHEN OTHER                                             08070000
008080              MOVE CCYY OF DA-DD-MM-CCYY TO CCYY OF DA-CCYYMMDD-R 08080000
008090              MOVE MM   OF DA-DD-MM-CCYY TO MM   OF DA-CCYYMMDD-R 08090000
008100              MOVE DD   OF DA-DD-MM-CCYY TO DD   OF DA-CCYYMMDD-R 08100000
008110           END-EVALUATE                                           08110000
008120      MOVE DA-CCYYMMDD-R TO DA-INVTR-FORM-AS OF VMBFAS.           08120000
008130           MOVE RA-QZTTIFS-479BFAS       OF DCLDZBFASTV TO        08130000
008140                                    RA-QZTTI-FORM-AS OF VMBFAS    08140000
008150           MOVE RA-DGTTIFS-479BFAS       OF DCLDZBFASTV TO        08150000
008160                                    RA-DGTTI-FORM-AS OF VMBFAS    08160000
008170           MOVE NB-DGTTIFS-479BFAS       OF DCLDZBFASTV TO        08170000
008180                                    NB-DGTTI-FORM-AS OF VMBFAS    08180000
008190           MOVE AM-DGTTIFS-479BFAS       OF DCLDZBFASTV TO        08190000
008200                                    AM-DGTTI-FORM-AS OF VMBFAS    08200000
008210           MOVE ST-DGTTIFS-479BFAS       OF DCLDZBFASTV TO        08210000
008220                                    ST-DGTTI-FORM-AS OF VMBFAS    08220000
008230           MOVE ST-PRRWFS-479BFAS        OF DCLDZBFASTV TO        08230000
008240                                    ST-PRRW-FORM-AS  OF VMBFAS    08240000
008250           MOVE RA-GIFTFS-479BFAS        OF DCLDZBFASTV TO        08250000
008260                                    RA-GIFT-FORM-AS  OF VMBFAS    08260000
008270           MOVE AM-GIFTFS-479BFAS        OF DCLDZBFASTV TO        08270000
008280                                    AM-GIFT-FORM-AS  OF VMBFAS    08280000
008290           MOVE ST-VOORHFS-479BFAS       OF DCLDZBFASTV TO        08290000
008300                                    ST-VOORH-FORM-AS OF VMBFAS    08300000
008310           MOVE DA-CPTAFS-479BFAS OF DCLDZBFASTV TO               08310000
008320                                               DA-DD-MM-CCYY      08320000
008330           EVALUATE TRUE                                          08330000
008340            WHEN DA-DD-MM-CCYY = '01.01.0001'                     08340000
008350             MOVE ZEROES      TO DA-CCYYMMDD-R                    08350000
008360            WHEN DA-DD-MM-CCYY = '31.12.9999'                     08360000
008370             MOVE '99999999'  TO DA-CCYYMMDD-R                    08370000
008380            WHEN OTHER                                            08380000
008390             MOVE CCYY OF DA-DD-MM-CCYY TO CCYY OF DA-CCYYMMDD-R  08390000
008400             MOVE MM   OF DA-DD-MM-CCYY TO MM   OF DA-CCYYMMDD-R  08400000
008410             MOVE DD   OF DA-DD-MM-CCYY TO DD   OF DA-CCYYMMDD-R  08410000
008420           END-EVALUATE                                           08420000
008430      MOVE DA-CCYYMMDD-R TO DA-CPTA-FORM-AS OF VMBFAS.            08430000
008440           MOVE CO-EXTOBFS-479BFAS       OF DCLDZBFASTV TO        08440000
008450                                    CO-EXTOB-FORM-AS OF VMBFAS    08450000
008460           MOVE CO-PLTOBFS-479BFAS       OF DCLDZBFASTV TO        08460000
008470                                    CO-PLTOB-FORM-AS OF VMBFAS    08470000
008480           MOVE RA-TOBFS-479BFAS         OF DCLDZBFASTV TO        08480000
008490                                    RA-TOB-FORM-AS   OF VMBFAS    08490000
008500           MOVE AM-TOBFS-479BFAS          OF DCLDZBFASTV TO       08500000
008510                                    AM-TOB-FORM-AS   OF VMBFAS    08510000
008520           MOVE RA-TARPHFS-479BFAS        OF DCLDZBFASTV TO       08520000
008530                                    RA-TARPH-FORM-AS OF VMBFAS    08530000
008540           MOVE AM-TARPH-479BFAS          OF DCLDZBFASTV TO       08540000
008550                                    AM-TARPH-FORM-AS OF VMBFAS    08550000
008560           MOVE AM-BASEFS-479BFAS         OF DCLDZBFASTV TO       08560000
008570                                    AM-BASE-FORM-AS  OF VMBFAS    08570000
008580           MOVE AM-FLKFS-479BFAS          OF DCLDZBFASTV TO       08580000
008590                                    AM-FLK-FORM-AS   OF VMBFAS    08590000
008600*OTHER MOVES                                                      08600000
008610           MOVE NR-ISFMAS-479BFAS         OF DCLDZBFASTV          08610000
008620                                          TO W-NR-IS-FORM-AS      08620000
008630           MOVE W-NR-ID-ISSUE             TO F-NR-IS              08630000
008640           MOVE NR-STFMAS-479BFAS         OF DCLDZBFASTV          08640000
008650                                          TO F-NR-ST              08650000
008660           WRITE FORM-REC FROM REC-FORM                           08660000
008670     ADD 1 TO WS-NB-OUTPUT-COUNT                                  08670000
008680           .                                                      08680000
008690*                                                                 08690000
008700 EINDE-PROGRAMMA.                                                 08700000
008710*----------------                                                 08710000
008720     CLOSE FORM.                                                  08720000
008730*                                                                 08730000
008740 EINDE-PROGRAMMA-EXIT.                                            08740000
008750*----------------                                                 08750000
008760*                                                                 08760000
008770     EXIT.                                                        08770000
008780 600-GET-TIMESTAMP.                                               08780000
008790D    DISPLAY '600-GET-TIMESTAMP.'                                 08790000
008800     MOVE FUNCTION CURRENT-DATE TO TS-SYSTEM.                     08800000
008810     MOVE CC OF TS-SYSTEM       TO CC OF TS-TIMESTAMP             08810000
008820     MOVE YY OF TS-SYSTEM       TO YY OF TS-TIMESTAMP             08820000
008830     MOVE MM OF TS-SYSTEM       TO MM OF TS-TIMESTAMP             08830000
008840     MOVE DD OF TS-SYSTEM       TO DD OF TS-TIMESTAMP             08840000
008850     MOVE HH OF TS-SYSTEM       TO HH OF TS-TIMESTAMP             08850000
008860     MOVE MI OF TS-SYSTEM       TO MI OF TS-TIMESTAMP             08860000
008870     MOVE SS OF TS-SYSTEM       TO SS OF TS-TIMESTAMP             08870000
008880     MOVE TT OF TS-SYSTEM       TO TT OF TS-TIMESTAMP             08880000
008890     DISPLAY 'TIMESTAMP: ' TS-TIMESTAMP                           08890000
008900     .                                                            08900000
008910                                                                  08910000
008920* SQLERROR ROUTINE.                                               08920000
008930     EXEC SQL                                                     08930000
008940          INCLUDE SQLERROR                                        08940000
008950     END-EXEC.                                                    08950000
