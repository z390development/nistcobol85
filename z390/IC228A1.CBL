038900 IDENTIFICATION DIVISION.                                         IC2284.2
      *
      * This is the z390 version of IC228A-1
      * z390 cannot handle multiple programs in a single source file
      * The subprogram has been extracted and saved as IC228A1
      * IC228A has been modified to call IC228A1 instead of IC228A-1.
      *
039000 PROGRAM-ID.                                                      IC2284.2
039100     IC228A1.                                                     IC2284.2
039200****************************************************************  IC2284.2
039300*                                                              *  IC2284.2
039400*    VALIDATION FOR:-                                          *  IC2284.2
039500*                                                              *  IC2284.2
039600*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2284.2
039700*                                                              *  IC2284.2
039800*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2284.2
039900*                                                              *  IC2284.2
040000****************************************************************  IC2284.2
040100*                                                              *  IC2284.2
040200*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2284.2
040300*                                                              *  IC2284.2
040400*        X-55  - SYSTEM PRINTER NAME.                          *  IC2284.2
040500*        X-82  - SOURCE COMPUTER NAME.                         *  IC2284.2
040600*        X-83  - OBJECT COMPUTER NAME.                         *  IC2284.2
040700*                                                              *  IC2284.2
040800****************************************************************  IC2284.2
040900*                                                              *  IC2284.2
041000*    PROGRAM IC228A AND IC228A-1 WILL TEST THE NEW LANGUAGE    *  IC2284.2
041100*    ELEMENTS FOR THE LEVEL 2 INTER-PROGRAM COMMUNICATION      *  IC2284.2
041200*    MODULE.                                                   *  IC2284.2
041300*    THE NEW LANGUAGE ELEMENTS TO BE TESTED WILL BE:           *  IC2284.2
041400*           THE "GLOBAL" CLAUSE IN WORKING-STORAGE.          *    IC2284.2
041500*    THE TWO PROGRAMS WILL BE COMPILED IN THE SAME FLOW        *  IC2284.2
041600*    (TO TEST THE "END PROGRAM" STATEMENT) AS SHOWN BELOW:     *  IC2284.2
041700*    IDENTIFICATION DIVISION.                                  *  IC2284.2
041800*    PROGRAM-ID. IC228A.                                       *  IC2284.2
041900*              .                                               *  IC2284.2
042000*              .                                               *  IC2284.2
042100*              .                                               *  IC2284.2
042200*    IDENTIFICATION DIVISION.                                  *  IC2284.2
042300*    PROGRAM-ID. IC228A-1.                                     *  IC2284.2
042400*              .                                               *  IC2284.2
042500*              .                                               *  IC2284.2
042600*              .                                               *  IC2284.2
042700*    END PROGRAM IC228A-1.                                     *  IC2284.2
042800*    END PROGRAM IC228A.                                       *  IC2284.2
042900****************************************************************  IC2284.2
043000 ENVIRONMENT DIVISION.                                            IC2284.2
043100*INPUT-OUTPUT SECTION.                                            IC2284.2
043200 DATA DIVISION.                                                   IC2284.2
043300*FILE SECTION.                                                    IC2284.2
043400 WORKING-STORAGE SECTION.                                         IC2284.2
043500 PROCEDURE DIVISION.                                              IC2284.2
043600 SECT-IC228A-1-001 SECTION.                                       IC2284.2
043700 GLO-TEST-001.                                                    IC2284.2
043800     MOVE   "ZZ"      TO GLO-DATA-1.                              IC2284.2
043900     MOVE   "CHANGE"  TO GLO-DATA-2.                              IC2284.2
044000     MOVE    87654321 TO GLO-DATA-3.                              IC2284.2
044100     ADD     10       TO GLO-DATA-4.                              IC2284.2
044200 GLO-EXIT-001.                                                    IC2284.2
044300     EXIT PROGRAM.                                                IC2284.2
044400 END PROGRAM IC228A1.                                             IC2284.2
