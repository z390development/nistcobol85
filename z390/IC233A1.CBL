040200 IDENTIFICATION DIVISION.                                         IC2334.2
      *
      * This is the z390 version of IC233A-1
      * z390 cannot handle multiple programs in a single source file
      * The subprogram has been extracted and saved as IC233A1
      * IC233A has been modified to call IC233A1 instead of IC233A-1.
      *
040300 PROGRAM-ID.                                                      IC2334.2
040400     IC233A1.                                                     IC2334.2
040500****************************************************************  IC2334.2
040600*                                                              *  IC2334.2
040700*    THIS PROGRAM FORMS PART OF THE COBOL COMPILER VALIDATION  *  IC2334.2
040800*    SYSTEM (CCVS) USED TO TEST COBOL COMPILERS FOR            *  IC2334.2
040900*    CONFORMANCE WITH THE AMERICAN NATIONAL STANDARD           *  IC2334.2
041000*    (ANSI DOCUMENT REFERENCE: X3.23-1985) AND THE STANDARD OF *  IC2334.2
041100*    THE INTERNATIONAL ORGANIZATION FOR STANDARDISATION        *  IC2334.2
041200*    (ISO DOCUMENT REFERENCE: ISO-1989-1985).                  *  IC2334.2
041300*                                                              *  IC2334.2
041400*    THIS CCVS INCORPORATES ENHANCEMENTS TO THE CCVS FOR THE   *  IC2334.2
041500*    1974 STANDARD (ANSI DOCUMENT REFERENCE: X3.23-1974; ISO   *  IC2334.2
041600*    DOCUMENT REFERENCE: ISO-1989-1978).                       *  IC2334.2
041700*                                                              *  IC2334.2
041800*    THESE ENHANCEMENTS WERE SPECIFIED BY A PROJECT TEAM WHICH *  IC2334.2
041900*    WAS FUNDED BY THE COMMISSION FOR EUROPEAN COMMUNITIES AND *  IC2334.2
042000*    WHICH WAS RESPONSIBLE FOR TECHNICAL ISSUES TO:            *  IC2334.2
042100*                                                              *  IC2334.2
042200*          THE FEDERAL SOFTWARE TESTING CENTER                 *  IC2334.2
042300*          OFFICE OF SOFTWARE DEVELOPMENT                      *  IC2334.2
042400*                & INFORMATION TECHNOLOGY                      *  IC2334.2
042500*          TWO SKYLINE PLACE                                   *  IC2334.2
042600*          SUITE 1100                                          *  IC2334.2
042700*          5203 LEESBURG PIKE                                  *  IC2334.2
042800*          FALLS CHURCH                                        *  IC2334.2
042900*          VA 22041                                            *  IC2334.2
043000*          U.S.A.                                              *  IC2334.2
043100*                                                              *  IC2334.2
043200*    THE PROJECT TEAM MEMBERS WERE:                            *  IC2334.2
043300*                                                              *  IC2334.2
043400*          BIADI (BUREAU INTER ADMINISTRATION                  *  IC2334.2
043500*                 DE DOCUMENTATION INFORMATIQUE)               *  IC2334.2
043600*          21 RUE BARA                                         *  IC2334.2
043700*          F-92132 ISSY                                        *  IC2334.2
043800*          FRANCE                                              *  IC2334.2
043900*                                                              *  IC2334.2
044000*                                                              *  IC2334.2
044100*          GMD (GESELLSCHAFT FUR MATHEMATIK                    *  IC2334.2
044200*               UND DATENVERARBEITUNG MBH)                     *  IC2334.2
044300*          SCHLOSS BIRLINGHOVEN                                *  IC2334.2
044400*          POSTFACH 12 40                                      *  IC2334.2
044500*          D-5205 ST. AUGUSTIN 1                               *  IC2334.2
044600*          GERMANY FR                                          *  IC2334.2
044700*                                                              *  IC2334.2
044800*                                                              *  IC2334.2
044900*          NCC (THE NATIONAL COMPUTING CENTRE LTD)             *  IC2334.2
045000*          OXFORD ROAD                                         *  IC2334.2
045100*          MANCHESTER                                          *  IC2334.2
045200*          M1 7ED                                              *  IC2334.2
045300*          UNITED KINGDOM                                      *  IC2334.2
045400*                                                              *  IC2334.2
045500*                                                              *  IC2334.2
045600*    THIS TEST SUITE WAS PRODUCED BY THE NATIONAL COMPUTING    *  IC2334.2
045700*    CENTRE IN ENGLAND AND IS THE OFFICIAL CCVS TEST SUITE     *  IC2334.2
045800*    USED THROUGHOUT EUROPE AND THE UNITED STATES OF AMERICA.  *  IC2334.2
045900*                                                              *  IC2334.2
046000****************************************************************  IC2334.2
046100*                                                              *  IC2334.2
046200*    VALIDATION FOR:-                                          *  IC2334.2
046300*                                                              *  IC2334.2
046400*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2334.2
046500*                                                              *  IC2334.2
046600*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2334.2
046700*                                                              *  IC2334.2
046800****************************************************************  IC2334.2
046900*                                                              *  IC2334.2
047000*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2334.2
047100*                                                              *  IC2334.2
047200*        X-55  - SYSTEM PRINTER NAME.                          *  IC2334.2
047300*        X-82  - SOURCE COMPUTER NAME.                         *  IC2334.2
047400*        X-83  - OBJECT COMPUTER NAME.                         *  IC2334.2
047500*        X-92  - TEST-FILE.                                    *  IC2334.2
047600*                                                              *  IC2334.2
047700****************************************************************  IC2334.2
047800*                                                              *  IC2334.2
047900*    PROGRAMS IC233A AND IC233A-1 TEST THAT A "USE" PROCEDURE  *  IC2334.2
048000*    IN A CALLING PROGRAM IS INVOKED BY A QUALIFYING CONDITION *  IC2334.2
048100*    OCCURRING IN A CONTAINED PROGRAM.                         *  IC2334.2
048200*                                                              *  IC2334.2
048300*    BOTH PROGRAMS WILL BE COMPILED IN ONE INVOCATION OF THE   *  IC2334.2
048400*    COMPILER AS SHOWN BELOW:                                  *  IC2334.2
048500*    IDENTIFICATION DIVISION.                                  *  IC2334.2
048600*    PROGRAM-ID. IC233A.                                       *  IC2334.2
048700*              .                                               *  IC2334.2
048800*              .                                               *  IC2334.2
048900*              .                                               *  IC2334.2
049000*    IDENTIFICATION DIVISION.                                  *  IC2334.2
049100*    PROGRAM-ID. IC233A-1.                                     *  IC2334.2
049200*              .                                               *  IC2334.2
049300*              .                                               *  IC2334.2
049400*    END PROGRAM IC233A-1.                                     *  IC2334.2
049500*    END PROGRAM IC233A.                                       *  IC2334.2
049600****************************************************************  IC2334.2
049700*ENVIRONMENT DIVISION.                                            IC2334.2
049800*INPUT-OUTPUT SECTION.                                            IC2334.2
049900*FILE-CONTROL.                                                    IC2334.2
050000*    SELECT TEST-FILE ASSIGN TO                                   IC2334.2
050100*    XXXXX018.                                                    IC2334.2
050200 DATA DIVISION.                                                   IC2334.2
050300 FILE SECTION.                                                    IC2334.2
050400 WORKING-STORAGE SECTION.                                         IC2334.2
050500 PROCEDURE DIVISION.                                              IC2334.2
050600 SECT-IC233A-1-001 SECTION.                                       IC2334.2
050700 USE-INIT-1.                                                      IC2334.2
050800     OPEN    INPUT TEST-FILE.                                     IC2334.2
050900     READ    TEST-FILE.                                           IC2334.2
051000 END-PROG.                                                        IC2334.2
051100     EXIT PROGRAM.                                                IC2334.2
051200 END PROGRAM IC233A1.                                             IC2334.2
