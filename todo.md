# To do list for NIST Cobol repository

- the file [CCVS85 Concepts document](doc/NIST_SP_500-186_CCVS85_Concepts.pdf) holds a document titled "Issues in Transparent File Access".
  We should evaluate whether to rename or remove this file.
- If we can find a document that is actually titled "CCVS85 Concepts", "NIST Special Publication 500-186"
  or something similar, we should add that document to our collection.
- A document `NIST_SP_500-162_Compiler_Validation.pdf` is referenced from our [README document](README.md)
  but is not present in our collection. If we can find a copy, we should add that document.
- The z390/zCobol compiler documentation refers to standards documents.
  We should add a copy of those documents to avoid depending on external sources.
- The [User guide](doc/CCVS85_User_Guide_v4.2.pdf) specifies a collection of additional test programs.
  These programs are not in this repository. If we can find a copy of those programs, we should add them.
- There are purported copies of the NIST suite in the following locations:
  - [archive.org / wayback machine](https://web.archive.org/web/20230917224831/https:/www.itl.nist.gov/div897/ctg/cobol_form.htm)
  - [winworldpc.com](https://winworldpc.com/product/microsoft-cobol/50)
  - [SourceForge for GnuCobol](https://sourceforge.net/projects/gnucobol/#) mentions passing almost all NIST tests. They should have a copy of the test suite somewhere.
  These resources need to be downloaded, unpacked, and compared against our current codebase to establish correct versions.
