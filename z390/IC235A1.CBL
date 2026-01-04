054000 IDENTIFICATION DIVISION.                                         IC2354.2
      *
      * This is the z390 version of IC235A-1
      * z390 cannot handle multiple programs in a single source file
      * The subprogram has been extracted and saved as IC235A1
      * IC235A has been modified to call IC235A1 instead of IC235A-1.
      * IC235A has been modified to call IC235A2 instead of IC235A-2.
      *
054100 PROGRAM-ID.                                                      IC2354.2
054200     IC235A1.                                                     IC2354.2
054300****************************************************************  IC2354.2
054400*                                                              *  IC2354.2
054500*    VALIDATION FOR:-                                          *  IC2354.2
054600*                                                              *  IC2354.2
054700*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2354.2
054800*                                                              *  IC2354.2
054900*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2354.2
055000*                                                              *  IC2354.2
055100****************************************************************  IC2354.2
055200*                                                              *  IC2354.2
055300*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2354.2
055400*                                                              *  IC2354.2
055500*        X-55  - SYSTEM PRINTER NAME.                          *  IC2354.2
055600*        X-82  - SOURCE COMPUTER NAME.                         *  IC2354.2
055700*        X-83  - OBJECT COMPUTER NAME.                         *  IC2354.2
055800*                                                              *  IC2354.2
055900****************************************************************  IC2354.2
056000*        THE SUBPROGRAM IC235A-1 HAS THREE OPERANDS IN THE        IC2354.2
056100*    USING PHRASE OF THE PROCEDURE DIVISION HEADER.  TWO          IC2354.2
056200*    OPERANDS ARE 01 GROUP ITEMS AND THE THIRD OPERAND IS         IC2354.2
056300*    AN ELEMENTARY 77 ITEM.  THE DATA DESCRIPTIONS OF THESE       IC2354.2
056400*    OPERANDS IN THE LINKAGE SECTION ARE NOT THE SAME AS THE      IC2354.2
056500*    DATA DESCRIPTIONS IN THE WORKING-STORAGE SECTION OF THE      IC2354.2
056600*    CALLING PROGRAM, BUT AN EQUAL NUMBER OF CHARACTER            IC2354.2
056700*    POSITIONS ARE DEFINED.  THE CALLING PROGRAM IS IC235.        IC2354.2
056800 ENVIRONMENT DIVISION.                                            IC2354.2
056900 INPUT-OUTPUT SECTION.                                            IC2354.2
057000 FILE-CONTROL.                                                    IC2354.2
057100     SELECT PRINT-FILE ASSIGN TO                                  IC2354.2
057200     XXXXX055.                                                    IC2354.2
057300 DATA DIVISION.                                                   IC2354.2
057400 FILE SECTION.                                                    IC2354.2
057500 FD  PRINT-FILE.                                                  IC2354.2
057600 01  PRINT-REC PICTURE X(120).                                    IC2354.2
057700 01  DUMMY-RECORD PICTURE X(120).                                 IC2354.2
057800 WORKING-STORAGE SECTION.                                         IC2354.2
057900 01  CONSTANT-VALUES.                                             IC2354.2
058000     02  AN-CONSTANT PIC X(8) VALUE "IC235A-1".                   IC2354.2
058100     02  NUM-CONSTANT PIC 99V9999 VALUE 0.7654.                   IC2354.2
058200 LINKAGE SECTION.                                                 IC2354.2
058300 01  GRP-01.                                                      IC2354.2
058400     02  AN-FIELD PICTURE X(8).                                   IC2354.2
058500     02  NUM-DISPLAY PIC 99.                                      IC2354.2
058600     02  GRP-LEVEL.                                               IC2354.2
058700         03  A-FIELD PICTURE A(3).                                IC2354.2
058800 77  ELEM-01 PIC  V9(4) COMPUTATIONAL.                            IC2354.2
058900 01  GRP-02.                                                      IC2354.2
059000     02  GRP-03.                                                  IC2354.2
059100         03  NUM-ITEM PICTURE S99.                                IC2354.2
059200         03  EDITED-FIELD  PIC XXBX0X.                            IC2354.2
059300 01  ELEM-NON-01           PIC XX.                                IC2354.2
059400 01  SUBSCRIPTED-DATA PIC XX.                                     IC2354.2
059500 PROCEDURE DIVISION USING GRP-01 ELEM-01 GRP-02                   IC2354.2
059600                          ELEM-NON-01 SUBSCRIPTED-DATA.           IC2354.2
059700 SECT-IC235A-1-001 SECTION.                                       IC2354.2
059800*        THIS SECTION SETS THE PARAMETER FIELDS REFERRED TO       IC2354.2
059900*    IN THE USING PHRASE AND DEFINED IN THE LINKAGE SECTION.      IC2354.2
060000 CALL-TEST-06.                                                    IC2354.2
060100     MOVE AN-CONSTANT TO AN-FIELD.                                IC2354.2
060200     ADD 25 TO NUM-DISPLAY.                                       IC2354.2
060300     MOVE "YES" TO A-FIELD.                                       IC2354.2
060400     MOVE NUM-CONSTANT TO ELEM-01.                                IC2354.2
060500     MOVE NUM-DISPLAY TO NUM-ITEM.                                IC2354.2
060600     MOVE "ABCD" TO EDITED-FIELD.                                 IC2354.2
060700     MOVE "ZZ"   TO ELEM-NON-01.                                  IC2354.2
060800     MOVE "1A"   TO SUBSCRIPTED-DATA.                             IC2354.2
060900 CALL-EXIT-06.                                                    IC2354.2
061000     EXIT PROGRAM.                                                IC2354.2
061100 END PROGRAM IC235A1.                                             IC2354.2
