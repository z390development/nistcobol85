061500 IDENTIFICATION DIVISION.                                         IC2344.2
      *
      * This is the z390 version of IC234A-3
      * z390 cannot handle multiple programs in a single source file
      * The subprogram has been extracted and saved as IC234A3
      * IC234A has been modified to call IC234A1 instead of IC234A-1.
      *
061600 PROGRAM-ID.                                                      IC2344.2
061700     IC234A3.                                                     IC2344.2
061800****************************************************************  IC2344.2
061900*                                                              *  IC2344.2
062000*    THIS PROGRAM FORMS PART OF THE COBOL COMPILER VALIDATION  *  IC2344.2
062100*    SYSTEM (CCVS) USED TO TEST COBOL COMPILERS FOR            *  IC2344.2
062200*    CONFORMANCE WITH THE AMERICAN NATIONAL STANDARD           *  IC2344.2
062300*    (ANSI DOCUMENT REFERENCE: X3.23-1985) AND THE STANDARD OF *  IC2344.2
062400*    THE INTERNATIONAL ORGANIZATION FOR STANDARDISATION        *  IC2344.2
062500*    (ISO DOCUMENT REFERENCE: ISO-1989-1985).                  *  IC2344.2
062600*                                                              *  IC2344.2
062700*    THIS CCVS INCORPORATES ENHANCEMENTS TO THE CCVS FOR THE   *  IC2344.2
062800*    1974 STANDARD (ANSI DOCUMENT REFERENCE: X3.23-1974; ISO   *  IC2344.2
062900*    DOCUMENT REFERENCE: ISO-1989-1978).                       *  IC2344.2
063000*                                                              *  IC2344.2
063100*    THESE ENHANCEMENTS WERE SPECIFIED BY A PROJECT TEAM WHICH *  IC2344.2
063200*    WAS FUNDED BY THE COMMISSION FOR EUROPEAN COMMUNITIES AND *  IC2344.2
063300*    WHICH WAS RESPONSIBLE FOR TECHNICAL ISSUES TO:            *  IC2344.2
063400*                                                              *  IC2344.2
063500*          THE FEDERAL SOFTWARE TESTING CENTER                 *  IC2344.2
063600*          OFFICE OF SOFTWARE DEVELOPMENT                      *  IC2344.2
063700*                & INFORMATION TECHNOLOGY                      *  IC2344.2
063800*          TWO SKYLINE PLACE                                   *  IC2344.2
063900*          SUITE 1100                                          *  IC2344.2
064000*          5203 LEESBURG PIKE                                  *  IC2344.2
064100*          FALLS CHURCH                                        *  IC2344.2
064200*          VA 22041                                            *  IC2344.2
064300*          U.S.A.                                              *  IC2344.2
064400*                                                              *  IC2344.2
064500*    THE PROJECT TEAM MEMBERS WERE:                            *  IC2344.2
064600*                                                              *  IC2344.2
064700*          BIADI (BUREAU INTER ADMINISTRATION                  *  IC2344.2
064800*                 DE DOCUMENTATION INFORMATIQUE)               *  IC2344.2
064900*          21 RUE BARA                                         *  IC2344.2
065000*          F-92132 ISSY                                        *  IC2344.2
065100*          FRANCE                                              *  IC2344.2
065200*                                                              *  IC2344.2
065300*                                                              *  IC2344.2
065400*          GMD (GESELLSCHAFT FUR MATHEMATIK                    *  IC2344.2
065500*               UND DATENVERARBEITUNG MBH)                     *  IC2344.2
065600*          SCHLOSS BIRLINGHOVEN                                *  IC2344.2
065700*          POSTFACH 12 40                                      *  IC2344.2
065800*          D-5205 ST. AUGUSTIN 1                               *  IC2344.2
065900*          GERMANY FR                                          *  IC2344.2
066000*                                                              *  IC2344.2
066100*                                                              *  IC2344.2
066200*          NCC (THE NATIONAL COMPUTING CENTRE LTD)             *  IC2344.2
066300*          OXFORD ROAD                                         *  IC2344.2
066400*          MANCHESTER                                          *  IC2344.2
066500*          M1 7ED                                              *  IC2344.2
066600*          UNITED KINGDOM                                      *  IC2344.2
066700*                                                              *  IC2344.2
066800*                                                              *  IC2344.2
066900*    THIS TEST SUITE WAS PRODUCED BY THE NATIONAL COMPUTING    *  IC2344.2
067000*    CENTRE IN ENGLAND AND IS THE OFFICIAL CCVS TEST SUITE     *  IC2344.2
067100*    USED THROUGHOUT EUROPE AND THE UNITED STATES OF AMERICA.  *  IC2344.2
067200*                                                              *  IC2344.2
067300****************************************************************  IC2344.2
067400*                                                              *  IC2344.2
067500*    VALIDATION FOR:-                                          *  IC2344.2
067600*                                                              *  IC2344.2
067700*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2344.2
067800*                                                              *  IC2344.2
067900*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2344.2
068000*                                                              *  IC2344.2
068100****************************************************************  IC2344.2
068200*                                                              *  IC2344.2
068300*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2344.2
068400*                                                              *  IC2344.2
068500*        X-55  - SYSTEM PRINTER NAME.                          *  IC2344.2
068600*        X-82  - SOURCE COMPUTER NAME.                         *  IC2344.2
068700*        X-83  - OBJECT COMPUTER NAME.                         *  IC2344.2
068800*                                                              *  IC2344.2
068900****************************************************************  IC2344.2
069000*                                                              *  IC2344.2
069100*    PROGRAMS IC234A, IC234A-1, IC234A-2 AND IC234A-3 TEST     *  IC2344.2
069200*    TEST THAT A "USE" PROCEDURE IN A CALLING PROGRAM IS       *  IC2344.2
069300*    INVOKED BY A QUALIFYING CONDITION OCURRING IN A CONTAINED *  IC2344.2
069400*    PROGRAM NESTED TO FOUR LEVELS.                            *  IC2344.2
069500*                                                              *  IC2344.2
069600*    ALL PROGRAMS WILL BE COMPILED IN ONE INVOCATION OF THE    *  IC2344.2
069700*    COMPILER AS SHOWN BELOW:                                  *  IC2344.2
069800*    IDENTIFICATION DIVISION.                                  *  IC2344.2
069900*    PROGRAM-ID. IC234A.                                       *  IC2344.2
070000*              .                                               *  IC2344.2
070100*              .                                               *  IC2344.2
070200*              .                                               *  IC2344.2
070300*    IDENTIFICATION DIVISION.                                  *  IC2344.2
070400*    PROGRAM-ID. IC234A-1.                                     *  IC2344.2
070500*              .                                               *  IC2344.2
070600*              .                                               *  IC2344.2
070700*    IDENTIFICATION DIVISION.                                  *  IC2344.2
070800*    PROGRAM-ID. IC234A-2.                                     *  IC2344.2
070900*              .                                               *  IC2344.2
071000*              .                                               *  IC2344.2
071100*              .                                               *  IC2344.2
071200*    IDENTIFICATION DIVISION.                                  *  IC2344.2
071300*    PROGRAM-ID. IC234A-3.                                     *  IC2344.2
071400*              .                                               *  IC2344.2
071500*              .                                               *  IC2344.2
071600*    END PROGRAM IC234A-3.                                     *  IC2344.2
071700*    END PROGRAM IC234A-2.                                     *  IC2344.2
071800*    END PROGRAM IC234A-1.                                     *  IC2344.2
071900*    END PROGRAM IC234A.                                       *  IC2344.2
072000****************************************************************  IC2344.2
072100*ENVIRONMENT DIVISION.                                            IC2344.2
072200*INPUT-OUTPUT SECTION.                                            IC2344.2
072300*FILE-CONTROL.                                                    IC2344.2
072400 DATA DIVISION.                                                   IC2344.2
072500 FILE SECTION.                                                    IC2344.2
072600 WORKING-STORAGE SECTION.                                         IC2344.2
072700 PROCEDURE DIVISION.                                              IC2344.2
072800 SECT-IC234A-3-001 SECTION.                                       IC2344.2
072900 USE-INIT-1.                                                      IC2344.2
073000     OPEN    INPUT TEST-FILE.                                     IC2344.2
073100     READ    TEST-FILE.                                           IC2344.2
073200     EXIT PROGRAM.                                                IC2344.2
073300*                                                                 IC2344.2
073400 END PROGRAM IC234A3.                                             IC2344.2
