061200 IDENTIFICATION DIVISION.                                         IC2354.2
      *
      * This is the z390 version of IC235A-2
      * z390 cannot handle multiple programs in a single source file
      * The subprogram has been extracted and saved as IC235A2
      * IC235A has been modified to call IC235A1 instead of IC235A-1.
      * IC235A has been modified to call IC235A2 instead of IC235A-2.
      *
061300 PROGRAM-ID.                                                      IC2354.2
061400     IC235A2.                                                     IC2354.2
061500****************************************************************  IC2354.2
061600*                                                              *  IC2354.2
061700*    VALIDATION FOR:-                                          *  IC2354.2
061800*                                                              *  IC2354.2
061900*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2354.2
062000*                                                              *  IC2354.2
062100*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2354.2
062200*                                                              *  IC2354.2
062300****************************************************************  IC2354.2
062400*                                                              *  IC2354.2
062500*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2354.2
062600*                                                              *  IC2354.2
062700*        X-55  - SYSTEM PRINTER NAME.                          *  IC2354.2
062800*        X-82  - SOURCE COMPUTER NAME.                         *  IC2354.2
062900*        X-83  - OBJECT COMPUTER NAME.                         *  IC2354.2
063000*                                                              *  IC2354.2
063100****************************************************************  IC2354.2
063200*        THE SUBPROGRAM IC235A-2 HAS TWO OPERANDS IN THE          IC2354.2
063300*    PROCEDURE DIVISION HEADER AND THE ROUTINE CONTAINS           IC2354.2
063400*    FOUR EXIT PROGRAM STATEMENTS.  THE CALLING PROGRAM           IC2354.2
063500*    IS IC235.                                                    IC2354.2
063600 ENVIRONMENT DIVISION.                                            IC2354.2
063700 DATA DIVISION.                                                   IC2354.2
063800 LINKAGE SECTION.                                                 IC2354.2
063900 77  DN1 PICTURE 999.                                             IC2354.2
064000 77  DN2 PICTURE S99 COMPUTATIONAL.                               IC2354.2
064100 PROCEDURE DIVISION  USING DN1 DN2.                               IC2354.2
064200*        THIS SUBPROGRAM CONTANS FOUR EXIT PROGRAM STATEMENTS.    IC2354.2
064300 SECT-IC235A-2-0001 SECTION.                                      IC2354.2
064400 EXIT-TEST-001.                                                   IC2354.2
064500     IF DN1 IS NOT EQUAL TO 1                                     IC2354.2
064600          GO TO EXIT-TEST-002.                                    IC2354.2
064700     MOVE 1 TO DN2.                                               IC2354.2
064800     EXIT PROGRAM.                                                IC2354.2
064900 EXIT-TEST-002.                                                   IC2354.2
065000     IF DN1 IS NOT EQUAL TO 2                                     IC2354.2
065100          GO TO EXIT-TEST-003.                                    IC2354.2
065200     MOVE 2 TO DN2.                                               IC2354.2
065300     EXIT PROGRAM.                                                IC2354.2
065400 EXIT-TEST-003.                                                   IC2354.2
065500     IF DN1 NOT EQUAL TO 3                                        IC2354.2
065600          GO TO EXIT-TEST-004.                                    IC2354.2
065700     MOVE 3 TO DN2.                                               IC2354.2
065800     EXIT PROGRAM.                                                IC2354.2
065900 EXIT-TEST-004.                                                   IC2354.2
066000     MOVE 4 TO DN2.                                               IC2354.2
066100     GO TO EXIT-STATEMENT-004.                                    IC2354.2
066200 EXTRANEOUS-PARAGRAPH.                                            IC2354.2
066300*        THIS PARAGRAPH IS NEVER EXECUTED.                        IC2354.2
066400     MOVE 5 TO DN2.                                               IC2354.2
066500 EXIT-STATEMENT-004.                                              IC2354.2
066600     EXIT PROGRAM.                                                IC2354.2
066700 END PROGRAM IC235A2.                                             IC2354.2
