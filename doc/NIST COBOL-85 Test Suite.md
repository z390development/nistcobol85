# NIST COBOL-85 Test Suite (CCVS85)

## Overview
The **COBOL Compiler Validation System (CCVS85)** is a comprehensive test suite developed by the
National Institute of Standards and Technology (NIST) to validate COBOL compiler conformance to
the COBOL-85 standard (ANSI X3.23-1985, ISO 1989-1985).

**Downloaded for The Ian Index** on December 2024.

## Contents

### Test Suite Files
| File             | Size    | Description                                  |
|------------------|---------|----------------------------------------------|
| `newcob.val.Z`   | 4.21 MB | Original compressed archive (Unix .Z format) |
| `newcob.val`     | 26.9 MB | Decompressed test suite master file          |
| `programs/*.cbl` | ~25 MB  | 391 individual COBOL test programs extracted |

### Documentation
| File                                                 | Size    | Description                             |
|------------------------------------------------------|---------|-----------------------------------------|
| `NISTIR_5731_CCVS_Documentation.pdf`                 | 6.1 MB  | CCVS User Guide and reference           |
| `NIST_SP_500-186_CCVS85_Concepts.pdf`                | 3.9 MB  | CCVS85 concepts and design              |
| `NIST_SP_500-203_COBOL_Intrinsic_Functions_Test.pdf` | 4.6 MB  | Intrinsic function module tests         |
| `NIST_SP_500-162_Compiler_Validation.pdf`            | 21.1 MB | General compiler validation methodology |

## Test Modules

The suite includes **14 test modules** covering all major COBOL-85 features:

| Prefix | Module              | Programs | Description                           |
|--------|---------------------|----------|---------------------------------------|
| NC     | Nucleus             | 95       | Core language features                |
| SQ     | Sequential          | 84       | Sequential file operations            |
| IF     | Intrinsic Functions | 45       | Built-in functions (ANSI X3.23b-1993) |
| IX     | Indexed I/O         | 29       | ISAM/VSAM indexed files               |
| IC     | Inter-program Comm  | 25       | CALL, CANCEL, nested programs         |
| RL     | Relative I/O        | 26       | Relative record file handling         |
| ST     | Sort/Merge          | 25       | SORT and MERGE statements             |
| DB     | Debug               | 15       | Debug module features                 |
| SG     | Segmentation        | 13       | Overlay segmentation                  |
| SM     | Source Modules      | 13       | COPY and COPY REPLACING               |
| K      | Copy members        | 49       | Copy members                          |
| CM     | Communication       | 9        | Communication module                  |
| RW     | Report Writer       | 6        | Report generation                     |
| OB     | Obsolete            | 5        | Deprecated elements                   |
| EX     | Executive           | 1        | Test suite control program            |

## Sources

This archive was assembled from multiple sources:

1. **Wayback Machine** (Primary): `https://web.archive.org/web/20060620073554/http://www.itl.nist.gov/div897/ctg/suites/newcob.val.Z`
2. **NIST Publications**: `https://nvlpubs.nist.gov/`
3. **GnuCOBOL SourceForge**: `https://sourceforge.net/projects/open-cobol/files/nist/`
4. **zCOBOL Project**: `https://www.zcobol.org/`

## Usage

The test suite is used by COBOL compiler vendors and open-source projects (GnuCOBOL, zCOBOL) to validate language conformance.
The `EXEC85.cbl` program is the executive that processes and prepares test programs.

### Running Tests
1. Compile `EXEC85.cbl` (the executive program)
2. Use EXEC85 to extract and configure individual test programs
3. Compile and run each test program
4. Compare output to expected results

## Historical Significance

- **First released**: 1986 (Version 2.0)
- **Final version**: 4.2 (October 1992)
- **Standards tested**: FIPS PUB 21-3, ANSI X3.23-1985, ISO 1989-1985
- **Used by**: IBM, Micro Focus, Fujitsu, GnuCOBOL, and virtually every COBOL compiler vendor

This test suite represents the gold standard for COBOL compiler validation and remains relevant today
for legacy system migration and modern COBOL implementations.

---
*Part of The Ian Index - Preserving computing history for the Hopper project.*

