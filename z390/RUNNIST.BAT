
@if /I "%1" == "tron" (echo on) else (echo off)
rem run z390 zcobol sample regression tests

setlocal
if /I "%1" == "tron" (set z_TraceMode=tron
                      shift /1
              ) else (if /I "%1" == "troff" (set z_TraceMode=troff
                                             shift /1
                                     ) else (set z_TraceMode=)
                      )
set /A z_NestLevel=%z_NestLevel%+1
rem ----- Lvl(%z_NestLevel%) Start %0 %1 %2 %3 %4 %5 %6 %7 %8 %9

rem -- *************************************************************
rem -- 
rem -- This script runs the NIST cobol test suite using z390 zCobol
rem -- which can be found in github repository z390development/z390
rem -- 
rem -- This bat script reflects the current status of the adoption
rem -- process of the NIST test suite in z390 / zCobol.
rem -- We have found 5 sets of the NIST test suite. None of them seem
rem -- to be ultimately authoritative as the NIST itself has abandoned
rem -- the entire test suite.
rem -- 
rem -- We are moving forward one program at a time, comparing the program
rem -- versions available and fixing any breakages in zCobol as we go.
rem -- That is, most compiles end with RC=8 - there are tons of issues
rem -- to be resolved. What we fix is where the compile process ends
rem -- abnormally, e.g. with a java exception and a stack trace.
rem -- 
rem -- Long story short: we reconcile source versions, and fix compiler breakage.
rem -- All other issues are left for future maintenance.
rem -- 
rem -- *************************************************************

pushd %~dps0..
if %1. == . goto help

set parmrc=0
:parmloop
if /I %1. EQU   .  goto parmdone
if /I %1. EQU CM. (set test_CM=Y
                   goto parmnotall)
if /I %1. EQU DB. (set test_DB=Y
                   goto parmnotall)
if /I %1. EQU EX. (set test_EX=Y
                   goto parmnotall)
if /I %1. EQU IC. (set test_IC=Y
                   goto parmnotall)
if /I %1. EQU IF. (set test_IF=Y
                   goto parmnotall)
if /I %1. EQU IX. (set test_IX=Y
                   goto parmnotall)
if /I %1. EQU NC. (set test_NC=Y
                   goto parmnotall)
if /I %1. EQU cleanup. (set cleanup=Y
                        goto parmnotall)
rem -- should be the path to z390
if exist %1\bat\CBLCLG.BAT (set z390dir=%1
                            goto parmnext)
echo %0 Unknown parameter: %1
set parmrc=8
:parmnotall
set test_all=N
:parmnext
shift /1
goto parmloop
:parmdone
rem -- check for prior errors and validate path to z390
set nistdir=%CD%
if %parmrc%   EQU 8  goto return
if %cleanup%. EQU Y. goto cleanup
if %z390dir%. EQU .  goto help
if not exist %z390dir%\z390.jar goto help
rem -- switch to z390 directory
cd %z390dir%

rem --
rem -- clear leftovers from prior runs
:cleanup
echo Cleaning up...
if exist %nistdir%\src\*.390                del %nistdir%\src\*.390
if exist %nistdir%\src\*.BAL                del %nistdir%\src\*.BAL
if exist %nistdir%\src\*.ERR                del %nistdir%\src\*.ERR
if exist %nistdir%\src\*.LOG                del %nistdir%\src\*.LOG
if exist %nistdir%\src\*.LST                del %nistdir%\src\*.LST
if exist %nistdir%\src\*.MLC                del %nistdir%\src\*.MLC
if exist %nistdir%\src\*.OBJ                del %nistdir%\src\*.OBJ
if exist %nistdir%\src\*.OUT                del %nistdir%\src\*.OUT
if exist %nistdir%\src\*.PRN                del %nistdir%\src\*.PRN
if exist %nistdir%\src\*.CBL_ZC_LABELS.CPY  del %nistdir%\src\*.CBL_ZC_LABELS.CPY
if exist %nistdir%\z390\*.390               del %nistdir%\z390\*.390
if exist %nistdir%\z390\*.BAL               del %nistdir%\z390\*.BAL
if exist %nistdir%\z390\*.ERR               del %nistdir%\z390\*.ERR
if exist %nistdir%\z390\*.LOG               del %nistdir%\z390\*.LOG
if exist %nistdir%\z390\*.LST               del %nistdir%\z390\*.LST
if exist %nistdir%\z390\*.MLC               del %nistdir%\z390\*.MLC
if exist %nistdir%\z390\*.OBJ               del %nistdir%\z390\*.OBJ
if exist %nistdir%\z390\*.OUT               del %nistdir%\z390\*.OUT
if exist %nistdir%\z390\*.PRN               del %nistdir%\z390\*.PRN
if exist %nistdir%\z390\*.CBL_ZC_LABELS.CPY del %nistdir%\z390\*.CBL_ZC_LABELS.CPY
echo Cleanup complete
if %cleanup%. EQU Y. goto return

rem --
rem -- Copy members and purpose:
rem ALTL1.CPY - intended for use by EXEC85
rem ALTLB.CPY - intended for use by EXEC85

rem --
rem -- CM = Communications Module
if /I %test_all%. EQU N. if /I %test_CM%. NEQ Y. goto skip_CM
call bat\CBLCLG %z_TraceMode% %nistdir%\src\CM101M
call bat\CBLCLG %z_TraceMode% %nistdir%\src\CM102M
call bat\CBLCLG %z_TraceMode% %nistdir%\src\CM103M
call bat\CBLCLG %z_TraceMode% %nistdir%\src\CM104M
call bat\CBLCLG %z_TraceMode% %nistdir%\src\CM105M
call bat\CBLCLG %z_TraceMode% %nistdir%\src\CM201M
call bat\CBLCLG %z_TraceMode% %nistdir%\src\CM202M
call bat\CBLCLG %z_TraceMode% %nistdir%\src\CM303M
call bat\CBLC   %z_TraceMode% %nistdir%\src\CM401M || rem test error mesages
:skip_CM

rem --
rem -- DB = Debug module
if /I %test_all%. EQU N. if /I %test_DB%. NEQ Y. goto skip_DB
call bat\CBLCLG %z_TraceMode% %nistdir%\src\DB101A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\DB102A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\DB103M
call bat\CBLCLG %z_TraceMode% %nistdir%\src\DB104A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\DB105A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\DB201A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\DB202A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\DB203A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\DB204A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\DB205A
call bat\CBLC   %z_TraceMode% %nistdir%\src\DB301M || rem test error mesages
call bat\CBLC   %z_TraceMode% %nistdir%\src\DB302M || rem test error mesages
call bat\CBLC   %z_TraceMode% %nistdir%\src\DB303M || rem test error mesages
call bat\CBLC   %z_TraceMode% %nistdir%\src\DB304M || rem test error mesages
call bat\CBLC   %z_TraceMode% %nistdir%\src\DB305M || rem test error mesages
:skip_DB

rem --
rem -- EX = Executive module
if /I %test_all%. EQU N. if /I %test_EX%. NEQ Y. goto skip_EX
call bat\CBLCLG %z_TraceMode% %nistdir%\src\EXEC85
:skip_EX

rem --
rem -- IC = Inter-Program Communication - subprograms must be compiled before each main program!
if /I %test_all%. EQU N. if /I %test_IC%. NEQ Y. goto skip_IC
del %nistdir%\src\IC*.OBJ >NUL                     || rem clear out leftovers of prior run
set XXXXX055=%nistdir%\src\IC101A_XXXXX055.OUT
call bat\CBLC   %z_TraceMode% %nistdir%\src\IC102A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IC101A
set XXXXX055=%nistdir%\src\IC103A_XXXXX055.OUT
call bat\CBLC   %z_TraceMode% %nistdir%\src\IC104A
call bat\CBLC   %z_TraceMode% %nistdir%\src\IC105A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IC103A
set XXXXX055=%nistdir%\src\IC106A_XXXXX055.OUT
call bat\CBLC   %z_TraceMode% %nistdir%\src\IC107A
call bat\CBLCL  %z_TraceMode% %nistdir%\src\IC106A || rem execution ends S0C7
set XXXXX055=%nistdir%\src\IC108A_XXXXX055.OUT
call bat\CBLC   %z_TraceMode% %nistdir%\src\IC109A
call bat\CBLC   %z_TraceMode% %nistdir%\src\IC110A
call bat\CBLC   %z_TraceMode% %nistdir%\src\IC111A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IC108A
set XXXXX055=%nistdir%\src\IC112A_XXXXX055.OUT
call bat\CBLC   %z_TraceMode% %nistdir%\src\IC113A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IC112A || rem fails to generate the call to IC113A
set XXXXX055=%nistdir%\src\IC114A_XXXXX055.OUT
call bat\CBLC   %z_TraceMode% %nistdir%\src\IC115A
call bat\CBLC   %z_TraceMode% %nistdir%\src\IC114A || rem fails to link because of errors in IC115A
set XXXXX055=%nistdir%\src\IC116M_XXXXX055.OUT
call bat\CBLC   %z_TraceMode% %nistdir%\src\IC117M
call bat\CBLC   %z_TraceMode% %nistdir%\src\IC118M
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IC116M
set XXXXX055=%nistdir%\src\IC201A_XXXXX055.OUT
call bat\CBLC   %z_TraceMode% %nistdir%\src\IC202A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IC201A
set XXXXX055=%nistdir%\src\IC203A_XXXXX055.OUT
call bat\CBLC   %z_TraceMode% %nistdir%\src\IC204A
call bat\CBLC   %z_TraceMode% %nistdir%\src\IC205A
call bat\CBLC   %z_TraceMode% %nistdir%\src\IC206A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IC203A
set XXXXX055=%nistdir%\src\IC207A_XXXXX055.OUT
call bat\CBLC   %z_TraceMode% %nistdir%\src\IC208A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IC207A
set XXXXX055=%nistdir%\src\IC209A_XXXXX055.OUT
call bat\CBLC   %z_TraceMode% %nistdir%\src\IC210A
call bat\CBLC   %z_TraceMode% %nistdir%\src\IC211A
call bat\CBLC   %z_TraceMode% %nistdir%\src\IC212A
call bat\CBLC   %z_TraceMode% %nistdir%\src\IC209A || rem fails to link because of errors in IC209A
set XXXXX055=%nistdir%\src\IC213A_XXXXX055.OUT
call bat\CBLC   %z_TraceMode% %nistdir%\src\IC214A
call bat\CBLC   %z_TraceMode% %nistdir%\src\IC215A
call bat\CBLC   %z_TraceMode% %nistdir%\src\IC213A || rem fails to link because of errors in IC215A
set XXXXX055=%nistdir%\src\IC216A_XXXXX055.OUT
call bat\CBLC   %z_TraceMode% %nistdir%\src\IC217A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IC216A
set XXXXX055=
rem  bat\CBLCLG %z_TraceMode% %nistdir%\src\IC222A   || rem uses multiple programs in 1 source file
call bat\CBLC   %z_TraceMode% %nistdir%\z390\IC222A1 || instead of the original
call bat\CBLCLG %z_TraceMode% %nistdir%\z390\IC222A  || instead of the original
rem  bat\CBLCLG %z_TraceMode% %nistdir%\src\IC223A   || rem uses multiple programs in 1 source file
call bat\CBLC   %z_TraceMode% %nistdir%\z390\IC223A1 || instead of the original
call bat\CBLCLG %z_TraceMode% %nistdir%\z390\IC223A  || instead of the original
rem  bat\CBLCLG %z_TraceMode% %nistdir%\src\IC224A   || rem uses multiple programs in 1 source file
call bat\CBLC   %z_TraceMode% %nistdir%\z390\IC224A1 || instead of the original
call bat\CBLCLG %z_TraceMode% %nistdir%\z390\IC224A  || instead of the original
rem  bat\CBLCLG %z_TraceMode% %nistdir%\src\IC225A   || rem uses multiple programs in 1 source file
call bat\CBLC   %z_TraceMode% %nistdir%\z390\IC225A1 || instead of the original
call bat\CBLCLG %z_TraceMode% %nistdir%\z390\IC225A  || instead of the original
rem  bat\CBLCLG %z_TraceMode% %nistdir%\src\IC226A   || rem uses multiple programs in 1 source file
call bat\CBLC   %z_TraceMode% %nistdir%\z390\IC226A1 || instead of the original
call bat\CBLCLG %z_TraceMode% %nistdir%\z390\IC226A  || instead of the original
rem  bat\CBLCLG %z_TraceMode% %nistdir%\src\IC227A   || rem uses multiple programs in 1 source file
call bat\CBLC   %z_TraceMode% %nistdir%\z390\IC227A1 || instead of the original
call bat\CBLCLG %z_TraceMode% %nistdir%\z390\IC227A  || instead of the original
rem  bat\CBLCLG %z_TraceMode% %nistdir%\src\IC228A   || rem uses multiple programs in 1 source file
call bat\CBLC   %z_TraceMode% %nistdir%\z390\IC228A1 || instead of the original
call bat\CBLCLG %z_TraceMode% %nistdir%\z390\IC228A  || instead of the original
rem  bat\CBLCLG %z_TraceMode% %nistdir%\src\IC233A   || rem uses multiple programs in 1 source file
call bat\CBLC   %z_TraceMode% %nistdir%\z390\IC233A1 || instead of the original
call bat\CBLCLG %z_TraceMode% %nistdir%\z390\IC233A  || instead of the original
rem  bat\CBLCLG %z_TraceMode% %nistdir%\src\IC234A   || rem uses multiple programs in 1 source file
call bat\CBLC   %z_TraceMode% %nistdir%\z390\IC234A1 || instead of the original
call bat\CBLC   %z_TraceMode% %nistdir%\z390\IC234A2 || instead of the original
call bat\CBLC   %z_TraceMode% %nistdir%\z390\IC234A3 || instead of the original
call bat\CBLCLG %z_TraceMode% %nistdir%\z390\IC234A  || instead of the original
rem  bat\CBLCLG %z_TraceMode% %nistdir%\src\IC235A   || rem uses multiple programs in 1 source file
call bat\CBLC   %z_TraceMode% %nistdir%\z390\IC235A1 || instead of the original
call bat\CBLC   %z_TraceMode% %nistdir%\z390\IC235A2 || instead of the original
call bat\CBLCLG %z_TraceMode% %nistdir%\z390\IC235A  || instead of the original
set XXXXX055=%nistdir%\src\IC237A_XXXXX055.OUT
rem  bat\CBLCLG %z_TraceMode% %nistdir%\src\IC237A   || rem uses multiple programs in 1 source file
call bat\CBLC   %z_TraceMode% %nistdir%\z390\IC237A1 || instead of the original
call bat\CBLCL  %z_TraceMode% %nistdir%\z390\IC237A  || instead of the original - incurs S0C5 at runtime
set XXXXX055=
rem  bat\CBLCLG %z_TraceMode% %nistdir%\src\IC401M   || rem uses multiple programs in 1 source file
:skip_IC

rem --
rem -- IF = Intrinsic Functions
if /I %test_all%. EQU N. if /I %test_IF%. NEQ Y. goto skip_IF
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF101A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF102A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF103A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF104A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF105A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF106A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF107A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF108A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF109A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF110A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF111A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF112A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF113A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF114A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF115A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF116A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF117A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF118A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF119A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF120A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF121A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF122A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF123A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF124A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF125A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF126A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF127A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF128A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF129A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF130A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF131A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF132A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF133A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF134A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF135A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF136A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF137A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF138A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF139A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF140A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF141A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IF142A
call bat\CBLC   %z_TraceMode% %nistdir%\src\IF401M || rem test error mesages
call bat\CBLC   %z_TraceMode% %nistdir%\src\IF402M || rem test error mesages
call bat\CBLC   %z_TraceMode% %nistdir%\src\IF403M || rem test error mesages
:skip_IF

rem --
rem -- IX = Indexed I/O
if /I %test_all%. EQU N. if /I %test_IX%. NEQ Y. goto skip_IX
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX101A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX102A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX103A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX104A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX105A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX106A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX107A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX108A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX109A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX110A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX111A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX112A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX113A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX114A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX115A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX116A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX117A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX118A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX119A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX120A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX121A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX201A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX202A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX203A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX204A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX205A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX206A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX207A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX208A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX209A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX210A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX211A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX212A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX213A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX214A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX215A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX216A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX217A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\IX218A
call bat\CBLC   %z_TraceMode% %nistdir%\src\IX301M || rem test error mesages
call bat\CBLC   %z_TraceMode% %nistdir%\src\IX302M || rem test error mesages
call bat\CBLC   %z_TraceMode% %nistdir%\src\IX401M || rem test error mesages
:skip_IX

rem --
rem -- Copy members and purpose:
rem K101A.CPY intended usage unknown
rem K1DAA.CPY intended usage unknown
rem K1FDA.CPY intended usage unknown
rem K1P01.CPY intended usage unknown
rem K1PRA.CPY intended usage unknown
rem K1PRB.CPY intended usage unknown
rem K1PRC.CPY intended usage unknown
rem K1SEA.CPY intended usage unknown
rem K1W01.CPY intended usage unknown
rem K1W02.CPY intended usage unknown
rem K1W03.CPY intended usage unknown
rem K1W04.CPY intended usage unknown
rem K1WKA.CPY intended usage unknown
rem K1WKB.CPY intended usage unknown
rem K1WKC.CPY intended usage unknown
rem K1WKY.CPY intended usage unknown
rem K1WKZ.CPY intended usage unknown
rem K2PRA.CPY intended usage unknown
rem K2SEA.CPY intended usage unknown
rem K3FCA.CPY intended usage unknown
rem K3FCB.CPY intended usage unknown
rem K3IOA.CPY intended usage unknown
rem K3IOB.CPY intended usage unknown
rem K3LGE.CPY intended usage unknown
rem K3OCA.CPY intended usage unknown
rem K3SCA.CPY intended usage unknown
rem K3SML.CPY intended usage unknown
rem K3SNA.CPY intended usage unknown
rem K3SNB.CPY intended usage unknown
rem K4NTA.CPY intended usage unknown
rem K501A.CPY intended usage unknown
rem K501B.CPY intended usage unknown
rem K5SDA.CPY intended usage unknown
rem K5SDB.CPY intended usage unknown
rem K6SCA.CPY intended usage unknown
rem K7SEA.CPY intended usage unknown
rem KK208A.CPY intended usage unknown
rem KP001.CPY intended usage unknown
rem KP002.CPY intended usage unknown
rem KP003.CPY intended usage unknown
rem KP004.CPY intended usage unknown
rem KP005.CPY intended usage unknown
rem KP006.CPY intended usage unknown
rem KP007.CPY intended usage unknown
rem KP008.CPY intended usage unknown
rem KP009.CPY intended usage unknown
rem KP010.CPY intended usage unknown
rem KSM31.CPY intended usage unknown
rem KSM41.CPY intended usage unknown

rem --
rem -- NC = Nucleus
if /I %test_all%. EQU N. if /I %test_NC%. NEQ Y. goto skip_NC
call bat\CBLCLG %z_TraceMode% %nistdir%\src\NC101A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\NC102A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\NC103A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\NC104A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\NC105A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\NC106A
call bat\CBLCLG %z_TraceMode% %nistdir%\src\NC107A
call bat\CBLC   %z_TraceMode% %nistdir%\src\NC108M || rem test error mesages
call bat\CBLC   %z_TraceMode% %nistdir%\src\NC109M || rem test error mesages
call bat\CBLC   %z_TraceMode% %nistdir%\src\NC110M || rem test error mesages
set XXXXX055=%nistdir%\src\NC111A_XXXXX055.OUT
call bat\CBLCL  %z_TraceMode% %nistdir%\src\NC111A || rem Abend S0CA
set XXXXX055=
call bat\CBLCLG %z_TraceMode% %nistdir%\src\NC112A
set XXXXX055=%nistdir%\src\NC113M_XXXXX055.OUT
call bat\CBLCLG %z_TraceMode% %nistdir%\src\NC113M
set XXXXX055=
call bat\CBLCLG %z_TraceMode% %nistdir%\src\NC114M
:skip_NC

rem --
rem -- sort all error messages from all compiles
type %nistdir%\src\*.err >%nistdir%\src\$all.err 2>nul
sort /+26 %nistdir%\src\$all.err /O %nistdir%\src\$allsort.err
echo .
echo All compiles completed
echo See %nistdir%\src\$allsort.err for complete list of all messages

set z_ReturnCode=0
goto return

:help
set z_ReturnCode=8
echo .
echo %0 ERROR: no arguments provided - path to z390 repository unknown
echo .
echo The path to a local clone of the z390 repository with z390.jar available must be specified.
echo Note: if z390.jar is not available, please run the z390 documented build procedure.
echo .
echo When the z390 path is omitted, no tests can be run
echo When the z390 path is specified, the default is to run all tests
echo This default can be overriden by specifying one or more of the following parameters:
echo - cleanup = cleanup only; no compiles
echo - CM = Communications Module
echo - DB = Debug module
echo - EX = Executive module
echo - IC = Inter-Program Communication
echo - IF = Intrinsic Functions
echo - IX = Indexed I/O
echo - NC = Nucleus
echo .
echo There is no prescribed order of parameters
echo .
goto return

:error
set z_ReturnCode=%ERRORLEVEL%
echo %0 ERROR: Encountered RC %z_ReturnCode% - exiting

:return
popd
rem ----- Lvl(%z_NestLevel%)  End %0 %1 %2 %3 %4 %5 %6 %7 %8 %9
exit /b %z_ReturnCode%
