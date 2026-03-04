* Encoding: UTF-8.
* Script created using the IEA IDB Analyzer (Version 5.0.50).
* Created on 25.02.2026 at 13:46.
* Press Ctrl+A followed by Ctrl+R to submit this merge. 

include file = "%MACROS FOLDER PATH%\IDBAnalyzer.ieasps".
include file = "%PROJECT FOLDER PATH%\DB\IDBAnalyzerCountries.ieasps".

mcrComb 
	 indir="Z:\RandA\Data\TIMSS_2023_IDB\G8\2_Data Files\SPSS Data"/
	 infile=BSGAADM8 BSGADUM8 BSGAREM8 BSGASHM8 BSGAUSM8 BSGAUTM8 BSGAZEM8 BSGBHRM8 BSGBRAM8 BSGCHLM8 BSGCIVM8 BSGCYPM8 BSGCZEM8 BSGENGM8 BSGFINM8 BSGFRAM8 BSGGEOM8 BSGHKGM8 BSGHUNM8 BSGIRLM8 BSGIRNM8 BSGISRM8 BSGITAM8 BSGJORM8 BSGJPNM8 BSGKAZM8 BSGKORM8 BSGKWTM8 BSGLTUM8 BSGMARM8 BSGMLTM8 BSGMYSM8 BSGNORM8 BSGNZLM8 BSGOMNM8 BSGPRTM8 BSGPSEM8 BSGQATM8 BSGROMM8 BSGSAUM8 BSGSGPM8 BSGSWEM8 BSGTURM8 BSGTWNM8 BSGUSAM8 BSGUZBM8 BSGZAFM8/
	 outdir="%PROJECT FOLDER PATH%\DB"/
	 outfile=tmpBSG/
	 keepVar=
       IDCNTRY 
       IDPOP 
       IDGRADER 
       IDGRADE 
       ITASSESS 
       IDBOOK 
       IDSCHOOL 
       IDCLASS 
       IDSTUD 
       ITSEX 
       BSDAGE 
       ITADMINI 
       ILRELIAB 
       BSBG01 
       JKZONE 
       JKREP 
       TOTWGT 
       HOUWGT 
       SENWGT 
       BSMMAT01 
       BSMMAT02 
       BSMMAT03 
       BSMMAT04 
       BSMMAT05 
       BSMNUM01 
       BSMNUM02 
       BSMNUM03 
       BSMNUM04 
       BSMNUM05 
       BSMALG01 
       BSMALG02 
       BSMALG03 
       BSMALG04 
       BSMALG05 
       BSMGEO01 
       BSMGEO02 
       BSMGEO03 
       BSMGEO04 
       BSMGEO05 
       BSMDAT01 
       BSMDAT02 
       BSMDAT03 
       BSMDAT04 
       BSMDAT05 
       BSMKNO01 
       BSMKNO02 
       BSMKNO03 
       BSMKNO04 
       BSMKNO05 
       BSMAPP01 
       BSMAPP02 
       BSMAPP03 
       BSMAPP04 
       BSMAPP05 
       BSMREA01 
       BSMREA02 
       BSMREA03 
       BSMREA04 
       BSMREA05 
       BSSSCI01 
       BSSSCI02 
       BSSSCI03 
       BSSSCI04 
       BSSSCI05 
       BSSBIO01 
       BSSBIO02 
       BSSBIO03 
       BSSBIO04 
       BSSBIO05 
       BSSCHE01 
       BSSCHE02 
       BSSCHE03 
       BSSCHE04 
       BSSCHE05 
       BSSPHY01 
       BSSPHY02 
       BSSPHY03 
       BSSPHY04 
       BSSPHY05 
       BSSEAR01 
       BSSEAR02 
       BSSEAR03 
       BSSEAR04 
       BSSEAR05 
       BSSKNO01 
       BSSKNO02 
       BSSKNO03 
       BSSKNO04 
       BSSKNO05 
       BSSAPP01 
       BSSAPP02 
       BSSAPP03 
       BSSAPP04 
       BSSAPP05 
       BSSREA01 
       BSSREA02 
       BSSREA03 
       BSSREA04 
       BSSREA05 
       BSSENV01 
       BSSENV02 
       BSSENV03 
       BSSENV04 
       BSSENV05 
       BSBGHER 
       BSDGHER 
       BSBGSLM 
       BSDGSLM/
	 idbID='MM8'.
EXECUTE.


ctylabls.
SAVE OUTFILE='%PROJECT FOLDER PATH%\DB\TIMSS_8_2023.sav'.
EXECUTE.
host command = ['del "%PROJECT FOLDER PATH%\DB\tmp*.sav"'].
NEW FILE.

