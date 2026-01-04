049100 IDENTIFICATION DIVISION.                                         IC2344.2
      *
      * This is the z390 version of IC234A-2
      * z390 cannot handle multiple programs in a single source file
      * The subprogram has been extracted and saved as IC234A2
      * IC234A has been modified to call IC234A1 instead of IC234A-1.
      * IC234A2 has been modified to call IC234A3 instead of IC234A-3.
      *
049200 PROGRAM-ID.                                                      IC2344.2
049300     IC234A2.                                                     IC2344.2
049400****************************************************************  IC2344.2
049500*                                                              *  IC2344.2
049600*    THIS PROGRAM FORMS PART OF THE COBOL COMPILER VALIDATION  *  IC2344.2
049700*    SYSTEM (CCVS) USED TO TEST COBOL COMPILERS FOR            *  IC2344.2
049800*    CONFORMANCE WITH THE AMERICAN NATIONAL STANDARD           *  IC2344.2
049900*    (ANSI DOCUMENT REFERENCE: X3.23-1985) AND THE STANDARD OF *  IC2344.2
050000*    THE INTERNATIONAL ORGANIZATION FOR STANDARDISATION        *  IC2344.2
050100*    (ISO DOCUMENT REFERENCE: ISO-1989-1985).                  *  IC2344.2
050200*                                                              *  IC2344.2
050300*    THIS CCVS INCORPORATES ENHANCEMENTS TO THE CCVS FOR THE   *  IC2344.2
050400*    1974 STANDARD (ANSI DOCUMENT REFERENCE: X3.23-1974; ISO   *  IC2344.2
050500*    DOCUMENT REFERENCE: ISO-1989-1978).                       *  IC2344.2
050600*                                                              *  IC2344.2
050700*    THESE ENHANCEMENTS WERE SPECIFIED BY A PROJECT TEAM WHICH *  IC2344.2
050800*    WAS FUNDED BY THE COMMISSION FOR EUROPEAN COMMUNITIES AND *  IC2344.2
050900*    WHICH WAS RESPONSIBLE FOR TECHNICAL ISSUES TO:            *  IC2344.2
051000*                                                              *  IC2344.2
051100*          THE FEDERAL SOFTWARE TESTING CENTER                 *  IC2344.2
051200*          OFFICE OF SOFTWARE DEVELOPMENT                      *  IC2344.2
051300*                & INFORMATION TECHNOLOGY                      *  IC2344.2
051400*          TWO SKYLINE PLACE                                   *  IC2344.2
051500*          SUITE 1100                                          *  IC2344.2
051600*          5203 LEESBURG PIKE                                  *  IC2344.2
051700*          FALLS CHURCH                                        *  IC2344.2
051800*          VA 22041                                            *  IC2344.2
051900*          U.S.A.                                              *  IC2344.2
052000*                                                              *  IC2344.2
052100*    THE PROJECT TEAM MEMBERS WERE:                            *  IC2344.2
052200*                                                              *  IC2344.2
052300*          BIADI (BUREAU INTER ADMINISTRATION                  *  IC2344.2
052400*                 DE DOCUMENTATION INFORMATIQUE)               *  IC2344.2
052500*          21 RUE BARA                                         *  IC2344.2
052600*          F-92132 ISSY                                        *  IC2344.2
052700*          FRANCE                                              *  IC2344.2
052800*                                                              *  IC2344.2
052900*                                                              *  IC2344.2
053000*          GMD (GESELLSCHAFT FUR MATHEMATIK                    *  IC2344.2
053100*               UND DATENVERARBEITUNG MBH)                     *  IC2344.2
053200*          SCHLOSS BIRLINGHOVEN                                *  IC2344.2
053300*          POSTFACH 12 40                                      *  IC2344.2
053400*          D-5205 ST. AUGUSTIN 1                               *  IC2344.2
053500*          GERMANY FR                                          *  IC2344.2
053600*                                                              *  IC2344.2
053700*                                                              *  IC2344.2
053800*          NCC (THE NATIONAL COMPUTING CENTRE LTD)             *  IC2344.2
053900*          OXFORD ROAD                                         *  IC2344.2
054000*          MANCHESTER                                          *  IC2344.2
054100*          M1 7ED                                              *  IC2344.2
054200*          UNITED KINGDOM                                      *  IC2344.2
054300*                                                              *  IC2344.2
054400*                                                              *  IC2344.2
054500*    THIS TEST SUITE WAS PRODUCED BY THE NATIONAL COMPUTING    *  IC2344.2
054600*    CENTRE IN ENGLAND AND IS THE OFFICIAL CCVS TEST SUITE     *  IC2344.2
054700*    USED THROUGHOUT EUROPE AND THE UNITED STATES OF AMERICA.  *  IC2344.2
054800*                                                              *  IC2344.2
054900****************************************************************  IC2344.2
055000*                                                              *  IC2344.2
055100*    VALIDATION FOR:-                                          *  IC2344.2
055200*                                                              *  IC2344.2
055300*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2344.2
055400*                                                              *  IC2344.2
055500*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2344.2
055600*                                                              *  IC2344.2
055700****************************************************************  IC2344.2
055800*                                                              *  IC2344.2
055900*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2344.2
056000*                                                              *  IC2344.2
056100*        X-55  - SYSTEM PRINTER NAME.                          *  IC2344.2
056200*        X-82  - SOURCE COMPUTER NAME.                         *  IC2344.2
056300*        X-83  - OBJECT COMPUTER NAME.                         *  IC2344.2
056400*                                                              *  IC2344.2
056500****************************************************************  IC2344.2
056600*                                                              *  IC2344.2
056700*    PROGRAMS IC234A, IC234A-1, IC234A-2 AND IC234A-3 TEST     *  IC2344.2
056800*    TEST THAT A "USE" PROCEDURE IN A CALLING PROGRAM IS       *  IC2344.2
056900*    INVOKED BY A QUALIFYING CONDITION OCURRING IN A CONTAINED *  IC2344.2
057000*    PROGRAM NESTED TO FOUR LEVELS.                            *  IC2344.2
057100*                                                              *  IC2344.2
057200*    ALL PROGRAMS WILL BE COMPILED IN ONE INVOCATION OF THE    *  IC2344.2
057300*    COMPILER AS SHOWN BELOW:                                  *  IC2344.2
057400*    IDENTIFICATION DIVISION.                                  *  IC2344.2
057500*    PROGRAM-ID. IC234A.                                       *  IC2344.2
057600*              .                                               *  IC2344.2
057700*              .                                               *  IC2344.2
057800*              .                                               *  IC2344.2
057900*    IDENTIFICATION DIVISION.                                  *  IC2344.2
058000*    PROGRAM-ID. IC234A-1.                                     *  IC2344.2
058100*              .                                               *  IC2344.2
058200*              .                                               *  IC2344.2
058300*    IDENTIFICATION DIVISION.                                  *  IC2344.2
058400*    PROGRAM-ID. IC234A-2.                                     *  IC2344.2
058500*              .                                               *  IC2344.2
058600*              .                                               *  IC2344.2
058700*              .                                               *  IC2344.2
058800*    IDENTIFICATION DIVISION.                                  *  IC2344.2
058900*    PROGRAM-ID. IC234A-3.                                     *  IC2344.2
059000*              .                                               *  IC2344.2
059100*              .                                               *  IC2344.2
059200*    END PROGRAM IC234A-3.                                     *  IC2344.2
059300*    END PROGRAM IC234A-2.                                     *  IC2344.2
059400*    END PROGRAM IC234A-1.                                     *  IC2344.2
059500*    END PROGRAM IC234A.                                       *  IC2344.2
059600****************************************************************  IC2344.2
059700*ENVIRONMENT DIVISION.                                            IC2344.2
059800*INPUT-OUTPUT SECTION.                                            IC2344.2
059900*FILE-CONTROL.                                                    IC2344.2
060000 DATA DIVISION.                                                   IC2344.2
060100 FILE SECTION.                                                    IC2344.2
060200 WORKING-STORAGE SECTION.                                         IC2344.2
060300 PROCEDURE DIVISION.                                              IC2344.2
060400 DECLARATIVES.                                                    IC2344.2
060500 USE-TEST SECTION.                                                IC2344.2
060600     USE GLOBAL AFTER ERROR PROCEDURE ON OUTPUT.                  IC2344.2
060700 USE-TEST-1.                                                      IC2344.2
060800     ADD  4 TO DILFRAP.                                           IC2344.2
060900 END DECLARATIVES.                                                IC2344.2
061000 SECT-IC234A-2-001 SECTION.                                       IC2344.2
061100 USE-INIT-1.                                                      IC2344.2
061200     CALL   "IC234A3".                                            IC2344.2
061300     EXIT PROGRAM.                                                IC2344.2
061400*                                                                 IC2344.2
073500 END PROGRAM IC234A2.                                             IC2344.2
