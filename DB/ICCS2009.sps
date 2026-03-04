* Encoding: UTF-8.
* Script created using the IEA IDB Analyzer (Version 5.0.50).
* Created on 25.02.2026 at 14:26.
* Press Ctrl+A followed by Ctrl+R to submit this merge. 

include file = "%MACROS FOLDER PATH%\IDBAnalyzer.ieasps".
include file = "%PROJECT FOLDER PATH%\DB\IDBAnalyzerCountries.ieasps".

mcrComb 
	 indir="Z:\RandA\Data\ICCS_2009_IDB\Data\SPSS"/
	 infile=ISGAUTC2 ISGBFLC2 ISGBGRC2 ISGCHEC2 ISGCHLC2 ISGCOLC2 ISGCYPC2 ISGCZEC2 ISGDNKC2 ISGDOMC2 ISGENGC2 ISGESPC2 ISGESTC2 ISGFINC2 ISGGRCC2 ISGGTMC2 ISGHKGC2 ISGIDNC2 ISGIRLC2 ISGITAC2 ISGKORC2 ISGLIEC2 ISGLTUC2 ISGLUXC2 ISGLVAC2 ISGMEXC2 ISGMLTC2 ISGNLDC2 ISGNORC2 ISGNZLC2 ISGPOLC2 ISGPRYC2 ISGRUSC2 ISGSVKC2 ISGSVNC2 ISGSWEC2 ISGTHAC2 ISGTWNC2/
	 outdir="%PROJECT FOLDER PATH%\DB"/
	 outfile=tmpISG/
	 keepVar=
       IDCNTRY 
       IDSTUD 
       IDCLASS 
       IDSCHOOL 
       SPART 
       IDPOP 
       IDSTRATE 
       IDSTRATI 
       TOTWGTS 
       JKZONES 
       JKREPS 
       IDGRADE 
       STREAM 
       ITEXCLUD 
       ITPART1 
       ITPART2 
       ITADMINI 
       ITDATEM 
       ITDATEY 
       ITPARTR 
       ITRM 
       RELBOOK 
       IDBOOK 
       SAGE 
       SGENDER 
       HOMELIT 
       HISCED 
       PV1CIV 
       PV2CIV 
       PV3CIV 
       PV4CIV 
       PV5CIV 
       OPDISC/
	 idbID='IC2'.
EXECUTE.


ctylabls.
SAVE OUTFILE='%PROJECT FOLDER PATH%\DB\ICCS2009.sav'.
EXECUTE.
host command = ['del "%PROJECT FOLDER PATH%\DB\tmp*.sav"'].
NEW FILE.

