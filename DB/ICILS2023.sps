* Encoding: UTF-8.
* Script created using the IEA IDB Analyzer (Version 5.0.50).
* Created on 23.02.2026 at 09:36.
* Press Ctrl+A followed by Ctrl+R to submit this merge. 

include file = "%MACROS FOLDER PATH%\IDBAnalyzer.ieasps".
include file = "%PROJECT FOLDER PATH%\DB\IDBAnalyzerCountries.ieasps".

mcrComb 
	 indir="Z:\ICILS\ICILS2023\IDB\IDB Public Use\SPSS"/
	 infile=BSGAUTI3 BSGAZEI3 BSGBFLI3 BSGBIHI3 BSGCHLI3 BSGCYPI3 BSGCZEI3 BSGDEUI3 BSGDNKI3 BSGDNWI3 BSGESPI3 BSGFINI3 BSGFRAI3 BSGGRCI3 BSGHRVI3 BSGHUNI3 BSGITAI3 BSGKAZI3 BSGKORI3 BSGLUXI3 BSGLVAI3 BSGMLTI3 BSGNLDI3 BSGNORI3 BSGOMNI3 BSGPRTI3 BSGROUI3 BSGSRBI3 BSGSVKI3 BSGSVNI3 BSGSWEI3 BSGTWNI3 BSGURYI3 BSGUSAI3 BSGXKXI3/
	 outdir="%PROJECT FOLDER PATH%\DB"/
	 outfile=tmpBSG/
	 keepVar=
       IDCNTRY 
       CNTRY 
       IDSCHOOL 
       IDCLASS 
       IDSTUD 
       S_AGE 
       S_SEX 
       SGENDER 
       S_TLANG 
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
	 idbID='EI3'.
EXECUTE.


ctylabls.
SAVE OUTFILE='%PROJECT FOLDER PATH%\DB\ICILS2023.sav'.
EXECUTE.
host command = ['del "%PROJECT FOLDER PATH%\DB\tmp*.sav"'].
NEW FILE.

