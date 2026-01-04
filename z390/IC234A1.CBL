036700 IDENTIFICATION DIVISION.                                         IC2344.2
      *
      * This is the z390 version of IC234A-1
      * z390 cannot handle multiple programs in a single source file
      * The subprogram has been extracted and saved as IC234A1
      * IC234A has been modified to call IC234A1 instead of IC234A-1.
      * IC234A1 has been modified to call IC234A2 instead of IC234A-2.
      *
036800 PROGRAM-ID.                                                      IC2344.2
036900     IC234A1.                                                     IC2344.2
037000****************************************************************  IC2344.2
037100*                                                              *  IC2344.2
037200*    THIS PROGRAM FORMS PART OF THE COBOL COMPILER VALIDATION  *  IC2344.2
037300*    SYSTEM (CCVS) USED TO TEST COBOL COMPILERS FOR            *  IC2344.2
037400*    CONFORMANCE WITH THE AMERICAN NATIONAL STANDARD           *  IC2344.2
037500*    (ANSI DOCUMENT REFERENCE: X3.23-1985) AND THE STANDARD OF *  IC2344.2
037600*    THE INTERNATIONAL ORGANIZATION FOR STANDARDISATION        *  IC2344.2
037700*    (ISO DOCUMENT REFERENCE: ISO-1989-1985).                  *  IC2344.2
037800*                                                              *  IC2344.2
037900*    THIS CCVS INCORPORATES ENHANCEMENTS TO THE CCVS FOR THE   *  IC2344.2
038000*    1974 STANDARD (ANSI DOCUMENT REFERENCE: X3.23-1974; ISO   *  IC2344.2
038100*    DOCUMENT REFERENCE: ISO-1989-1978).                       *  IC2344.2
038200*                                                              *  IC2344.2
038300*    THESE ENHANCEMENTS WERE SPECIFIED BY A PROJECT TEAM WHICH *  IC2344.2
038400*    WAS FUNDED BY THE COMMISSION FOR EUROPEAN COMMUNITIES AND *  IC2344.2
038500*    WHICH WAS RESPONSIBLE FOR TECHNICAL ISSUES TO:            *  IC2344.2
038600*                                                              *  IC2344.2
038700*          THE FEDERAL SOFTWARE TESTING CENTER                 *  IC2344.2
038800*          OFFICE OF SOFTWARE DEVELOPMENT                      *  IC2344.2
038900*                & INFORMATION TECHNOLOGY                      *  IC2344.2
039000*          TWO SKYLINE PLACE                                   *  IC2344.2
039100*          SUITE 1100                                          *  IC2344.2
039200*          5203 LEESBURG PIKE                                  *  IC2344.2
039300*          FALLS CHURCH                                        *  IC2344.2
039400*          VA 22041                                            *  IC2344.2
039500*          U.S.A.                                              *  IC2344.2
039600*                                                              *  IC2344.2
039700*    THE PROJECT TEAM MEMBERS WERE:                            *  IC2344.2
039800*                                                              *  IC2344.2
039900*          BIADI (BUREAU INTER ADMINISTRATION                  *  IC2344.2
040000*                 DE DOCUMENTATION INFORMATIQUE)               *  IC2344.2
040100*          21 RUE BARA                                         *  IC2344.2
040200*          F-92132 ISSY                                        *  IC2344.2
040300*          FRANCE                                              *  IC2344.2
040400*                                                              *  IC2344.2
040500*                                                              *  IC2344.2
040600*          GMD (GESELLSCHAFT FUR MATHEMATIK                    *  IC2344.2
040700*               UND DATENVERARBEITUNG MBH)                     *  IC2344.2
040800*          SCHLOSS BIRLINGHOVEN                                *  IC2344.2
040900*          POSTFACH 12 40                                      *  IC2344.2
041000*          D-5205 ST. AUGUSTIN 1                               *  IC2344.2
041100*          GERMANY FR                                          *  IC2344.2
041200*                                                              *  IC2344.2
041300*                                                              *  IC2344.2
041400*          NCC (THE NATIONAL COMPUTING CENTRE LTD)             *  IC2344.2
041500*          OXFORD ROAD                                         *  IC2344.2
041600*          MANCHESTER                                          *  IC2344.2
041700*          M1 7ED                                              *  IC2344.2
041800*          UNITED KINGDOM                                      *  IC2344.2
041900*                                                              *  IC2344.2
042000*                                                              *  IC2344.2
042100*    THIS TEST SUITE WAS PRODUCED BY THE NATIONAL COMPUTING    *  IC2344.2
042200*    CENTRE IN ENGLAND AND IS THE OFFICIAL CCVS TEST SUITE     *  IC2344.2
042300*    USED THROUGHOUT EUROPE AND THE UNITED STATES OF AMERICA.  *  IC2344.2
042400*                                                              *  IC2344.2
042500****************************************************************  IC2344.2
042600*                                                              *  IC2344.2
042700*    VALIDATION FOR:-                                          *  IC2344.2
042800*                                                              *  IC2344.2
042900*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2344.2
043000*                                                              *  IC2344.2
043100*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2344.2
043200*                                                              *  IC2344.2
043300****************************************************************  IC2344.2
043400*                                                              *  IC2344.2
043500*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2344.2
043600*                                                              *  IC2344.2
043700*        X-55  - SYSTEM PRINTER NAME.                          *  IC2344.2
043800*        X-82  - SOURCE COMPUTER NAME.                         *  IC2344.2
043900*        X-83  - OBJECT COMPUTER NAME.                         *  IC2344.2
044000*                                                              *  IC2344.2
044100****************************************************************  IC2344.2
044200*                                                              *  IC2344.2
044300*    PROGRAMS IC234A, IC234A-1, IC234A-2 AND IC234A-3 TEST     *  IC2344.2
044400*    TEST THAT A "USE" PROCEDURE IN A CALLING PROGRAM IS       *  IC2344.2
044500*    INVOKED BY A QUALIFYING CONDITION OCURRING IN A CONTAINED *  IC2344.2
044600*    PROGRAM NESTED TO FOUR LEVELS.                            *  IC2344.2
044700*                                                              *  IC2344.2
044800*    ALL PROGRAMS WILL BE COMPILED IN ONE INVOCATION OF THE    *  IC2344.2
044900*    COMPILER AS SHOWN BELOW:                                  *  IC2344.2
045000*    IDENTIFICATION DIVISION.                                  *  IC2344.2
045100*    PROGRAM-ID. IC234A.                                       *  IC2344.2
045200*              .                                               *  IC2344.2
045300*              .                                               *  IC2344.2
045400*              .                                               *  IC2344.2
045500*    IDENTIFICATION DIVISION.                                  *  IC2344.2
045600*    PROGRAM-ID. IC234A-1.                                     *  IC2344.2
045700*              .                                               *  IC2344.2
045800*              .                                               *  IC2344.2
045900*    IDENTIFICATION DIVISION.                                  *  IC2344.2
046000*    PROGRAM-ID. IC234A-2.                                     *  IC2344.2
046100*              .                                               *  IC2344.2
046200*              .                                               *  IC2344.2
046300*              .                                               *  IC2344.2
046400*    IDENTIFICATION DIVISION.                                  *  IC2344.2
046500*    PROGRAM-ID. IC234A-3.                                     *  IC2344.2
046600*              .                                               *  IC2344.2
046700*              .                                               *  IC2344.2
046800*    END PROGRAM IC234A-3.                                     *  IC2344.2
046900*    END PROGRAM IC234A-2.                                     *  IC2344.2
047000*    END PROGRAM IC234A-1.                                     *  IC2344.2
047100*    END PROGRAM IC234A.                                       *  IC2344.2
047200****************************************************************  IC2344.2
047300*ENVIRONMENT DIVISION.                                            IC2344.2
047400*INPUT-OUTPUT SECTION.                                            IC2344.2
047500*FILE-CONTROL.                                                    IC2344.2
047600 DATA DIVISION.                                                   IC2344.2
047700 FILE SECTION.                                                    IC2344.2
047800 WORKING-STORAGE SECTION.                                         IC2344.2
047900 PROCEDURE DIVISION.                                              IC2344.2
048000 DECLARATIVES.                                                    IC2344.2
048100 NON-GLOBAL-SECTION SECTION.                                      IC2344.2
048200     USE AFTER STANDARD EXCEPTION PROCEDURE ON TEST-FILE.         IC2344.2
048300 USE-PARA.                                                        IC2344.2
048400     ADD 2 TO DILFRAP.                                            IC2344.2
048500 END DECLARATIVES.                                                IC2344.2
048600 SECT-IC234A-1-001 SECTION.                                       IC2344.2
048700 USE-INIT-1.                                                      IC2344.2
048800     CALL   "IC234A2".                                            IC2344.2
048900     EXIT PROGRAM.                                                IC2344.2
049000*                                                                 IC2344.2
073600 END PROGRAM IC234A1.                                             IC2344.2
