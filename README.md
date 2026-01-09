# NIST ANSI COBOL85 Test Suite

This repository holds the COBOL source code for the NIST ANSI COBOL 85 test suite.

    COBOL 85 VERSION 4.2, Apr  1993 SSVG

SSVG stands for Software Standards Validation Group which was a division of NIST (National Institute of Standards
and Technology).

The source was obtained from <https://web.archive.org/web/20230917224831/https:/www.itl.nist.gov/div897/ctg/cobol_form.htm>

The file hosted on this site is contained in a Unix Z archive.
The archive contains a single file `newcob.val` containing all the COBOL source programs.

The decompressed version is available in this repository.

Use the Python script `split_val.py` to decompose into individial programs.

    python split_val.py

The script will split the `newcob.val` file into individial files and place it into the `src` folder.

The script assigns file extensions based on the file type provided in the header records.

* COBOL -> .COB
* CLBRY -> .CPY
* DATA -> .DAT

## Description from internet archive

The COBOL85 test suite is a product of the National Computing Centre, UK. It is used to determine, insofar as is practical, the degree to which a COBOL processor conforms to the COBOL standard (ANSI X3.23-1985, ISO 1989-1985, ANSI X3.23a-1989 and ANSI X3.23b-1993.)

The COBOL85 test suite consists of programs containing features of Standard COBOL, their related data and an executive program that prepares the test programs for compilation. Each program includes tests and supporting procedures indicating the results of the tests. The testing of a processor in a particular hardware/operating system environment is accomplished by compiling and executing each program.

The COBOL Test Suite is a compressed file that must be extracted from a UNIX system. Please rename the file as "filename" Z. To run the test suite, you need to extract and set up the COBOL Executive routine program; execute the COBOL Executive to select and prepare the test programs for compilation, and then prepare the necessary job scripts to compile and execute the test programs.

## License and copyright

There are no specific licences specified in the source code.

There are copyright notices in some of the reports generated stating:

    FOR OFFICIAL USE ONLY
    ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.
    COPYRIGHT 1985

The code is already available in some other projects for validation of COBOL functionality.

https://sourceforge.net/projects/gnucobol/files/nist/

The best case is this code could be treated as in the public domain.

## More information

- [NIST COBOL-85 Test Suite documentation](docs/NIST COBOL-85 Test Suite.md)
- [NIST CCVS85 Concepts](docs/NIST_SP_500-186_CCVS85_Concepts.pdf)
- [NIST COBOL Intrinsic Functions Test](docs/NIST_SP_500-203_COBOL_Intrinsic_Functions_Test.pdf)
- [NISTIR CCVS Documentation](docs/NISTIR_5731_CCVS_Documentation.pdf)

## Status in relation to z390 / zCobol compiler

The zCobol compiler has a lot of limitations resulting in a large number of errors and failed compiles.
The z390 subdirectory holds source versions specific to z390/zCobol. Most importantly:
- The IC module uses nested programs which are not supported by zCobol. The programs have been stored as separate source files.
- The copy members used in the SM module have an extension of .CPY, but zCobol requires .CPZ instead. Required copy members are stored as .CPZ files.
- The RUNNIST.BAT script will compile the entire NIST suite and create #full_log.txt
- The #full_log.txt is intended to be used to monitor effects of code changes in z390/zCobol.
  Each code change to zCobol should lead to reduction of error messages in this file. No new additions should be allowed to appear.

