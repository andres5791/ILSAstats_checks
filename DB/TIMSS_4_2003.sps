* Encoding: UTF-8.
* Script created using the IEA IDB Analyzer (Version 5.0.50).
* Created on 24.02.2026 at 18:38.
* Press Ctrl+A followed by Ctrl+R to submit this merge. 

include file = "%MACROS FOLDER PATH%\IDBAnalyzer.ieasps".
include file = "%PROJECT FOLDER PATH%\DB\IDBAnalyzerCountries.ieasps".

mcrComb 
	 indir="Z:\RandA\Data\TIMSS_2003_IDB\Data\G4\SPSS"/
	 infile=ASGARMM3 ASGAUSM3 ASGBFLM3 ASGCOTM3 ASGCQUM3 ASGCYPM3 ASGENGM3 ASGHKGM3 ASGHUNM3 ASGIRNM3 ASGITAM3 ASGJPNM3 ASGLTUM3 ASGLVAM3 ASGMARM3 ASGMDAM3 ASGNLDM3 ASGNORM3 ASGNZLM3 ASGPHLM3 ASGRUSM3 ASGSCOM3 ASGSGPM3 ASGSVNM3 ASGTUNM3 ASGTWNM3 ASGUINM3 ASGUSAM3 ASGYEMM3/
	 outdir="%PROJECT FOLDER PATH%\DB"/
	 outfile=tmpASG/
	 keepVar=
       idcntry 
       idschool 
       idclass 
       idgrade 
       idstud 
       itbirthm 
       itbirthy 
       itsex 
       idbook 
       itadmini 
       itdatem 
       itdatey 
       itlang 
       asbgsex 
       asbgbook 
       idpop 
       idgrader 
       asdage 
       houwgt 
       totwgt 
       senwgt 
       jkzone 
       jkrep 
       intms03 
       idstrate 
       idstrati 
       intms99 
       intms95 
       asmmat01 
       asmmat02 
       asmmat03 
       asmmat04 
       asmmat05 
       asssci01 
       asssci02 
       asssci03 
       asssci04 
       asssci05 
       asmalg01 
       asmalg02 
       asmalg03 
       asmalg04 
       asmalg05 
       asmdap01 
       asmdap02 
       asmdap03 
       asmdap04 
       asmdap05 
       asmfns01 
       asmfns02 
       asmfns03 
       asmfns04 
       asmfns05 
       asmgeo01 
       asmgeo02 
       asmgeo03 
       asmgeo04 
       asmgeo05 
       asmmea01 
       asmmea02 
       asmmea03 
       asmmea04 
       asmmea05 
       asseas01 
       asseas02 
       asseas03 
       asseas04 
       asseas05 
       asslis01 
       asslis02 
       asslis03 
       asslis04 
       asslis05 
       assphy01 
       assphy02 
       assphy03 
       assphy04 
       assphy05 
       asmapp01 
       asmapp02 
       asmapp03 
       asmapp04 
       asmapp05 
       asmkno01 
       asmkno02 
       asmkno03 
       asmkno04 
       asmkno05 
       asmrea01 
       asmrea02 
       asmrea03 
       asmrea04 
       asmrea05 
       asdmscl/
	 idbID='MM3'.
EXECUTE.


ctylabls.
SAVE OUTFILE='%PROJECT FOLDER PATH%\DB\TIMSS_4_2003.sav'.
EXECUTE.
host command = ['del "%PROJECT FOLDER PATH%\DB\tmp*.sav"'].
NEW FILE.

