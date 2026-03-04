* Encoding: UTF-8.
* Script created using the IEA IDB Analyzer (Version 5.0.50).
* Created on 25.02.2026 at 14:47.
* Press Ctrl+A followed by Ctrl+R to submit this merge. 

include file = "%MACROS FOLDER PATH%\IDBAnalyzer.ieasps".
include file = "%PROJECT FOLDER PATH%\DB\IDBAnalyzerCountries.ieasps".

mcrComb 
	 indir="Z:\RandA\Data\ICILS_2018_IDB\Data\SPSS"/
	 infile=BSGCHLI2 BSGDEUI2 BSGDNKI2 BSGDNWI2 BSGFINI2 BSGFRAI2 BSGITAI2 BSGKAZI2 BSGKORI2 BSGLUXI2 BSGPRTI2 BSGRMOI2 BSGURYI2 BSGUSAI2/
	 outdir="%PROJECT FOLDER PATH%\DB"/
	 outfile=tmpBSG/
	 keepVar=
       IDSCHOOL 
       IDSTUD 
       IDCNTRY 
       IDBOOK 
       S_SEX 
       S_AGE 
       S_HISCED 
       S_HOMLIT 
       S_GENEFF 
       PV1CIL 
       PV2CIL 
       PV3CIL 
       PV4CIL 
       PV5CIL 
       PV1CT 
       PV2CT 
       PV3CT 
       PV4CT 
       PV5CT 
       TOTWGTS 
       JKZONES 
       JKREPS/
	 idbID='EI2'.
EXECUTE.


ctylabls.
SAVE OUTFILE='%PROJECT FOLDER PATH%\DB\ICILS2018.sav'.
EXECUTE.
host command = ['del "%PROJECT FOLDER PATH%\DB\tmp*.sav"'].
NEW FILE.

