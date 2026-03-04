* Encoding: UTF-8.
* Script created using the IEA IDB Analyzer (Version 5.0.50).
* Created on 25.02.2026 at 13:31.
* Press Ctrl+A followed by Ctrl+R to submit this merge. 

include file = "%MACROS FOLDER PATH%\IDBAnalyzer.ieasps".
include file = "%PROJECT FOLDER PATH%\DB\IDBAnalyzerCountries.ieasps".

mcrComb 
	 indir="Z:\RandA\Data\TIMSS_2015_IDB\Data\G8\SPSS"/
	 infile=BSGAADM6 BSGABAM6 BSGADUM6 BSGAREM6 BSGAUSM6 BSGBHRM6 BSGBWAM6 BSGCANM6 BSGCHLM6 BSGCOTM6 BSGCQUM6 BSGEGYM6 BSGENGM6 BSGGEOM6 BSGHKGM6 BSGHUNM6 BSGIRLM6 BSGIRNM6 BSGISRM6 BSGITAM6 BSGJORM6 BSGJPNM6 BSGKAZM6 BSGKORM6 BSGKWTM6 BSGLBNM6 BSGLTUM6 BSGMARM6 BSGMLTM6 BSGMYSM6 BSGNO8M6 BSGNORM6 BSGNZLM6 BSGOMNM6 BSGQATM6 BSGRUSM6 BSGSAUM6 BSGSGPM6 BSGSVNM6 BSGSWEM6 BSGTHAM6 BSGTURM6 BSGTWNM6 BSGUSAM6 BSGZAFM6/
	 outdir="%PROJECT FOLDER PATH%\DB"/
	 outfile=tmpBSG/
	 keepVar=
       IDCNTRY 
       IDBOOK 
       IDSCHOOL 
       IDCLASS 
       IDSTUD 
       IDGRADE 
       ITSEX 
       ITADMINI 
       ITLANG 
       BSBG01 
       IDPOP 
       IDGRADER 
       BSDAGE 
       TOTWGT 
       HOUWGT 
       SENWGT 
       JKZONE 
       JKREP 
       BSMMAT01 
       BSMMAT02 
       BSMMAT03 
       BSMMAT04 
       BSMMAT05 
       BSSSCI01 
       BSSSCI02 
       BSSSCI03 
       BSSSCI04 
       BSSSCI05 
       BSMALG01 
       BSMALG02 
       BSMALG03 
       BSMALG04 
       BSMALG05 
       BSMDAT01 
       BSMDAT02 
       BSMDAT03 
       BSMDAT04 
       BSMDAT05 
       BSMNUM01 
       BSMNUM02 
       BSMNUM03 
       BSMNUM04 
       BSMNUM05 
       BSMGEO01 
       BSMGEO02 
       BSMGEO03 
       BSMGEO04 
       BSMGEO05 
       BSSCHE01 
       BSSCHE02 
       BSSCHE03 
       BSSCHE04 
       BSSCHE05 
       BSSEAR01 
       BSSEAR02 
       BSSEAR03 
       BSSEAR04 
       BSSEAR05 
       BSSBIO01 
       BSSBIO02 
       BSSBIO03 
       BSSBIO04 
       BSSBIO05 
       BSSPHY01 
       BSSPHY02 
       BSSPHY03 
       BSSPHY04 
       BSSPHY05 
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
       BSBGHER 
       BSDGHER 
       BSBGSLM 
       BSDGSLM/
	 idbID='MM6'.
EXECUTE.


ctylabls.
SAVE OUTFILE='%PROJECT FOLDER PATH%\DB\TIMSS_8_2015.sav'.
EXECUTE.
host command = ['del "%PROJECT FOLDER PATH%\DB\tmp*.sav"'].
NEW FILE.

