* Encoding: UTF-8.
* Script created using the IEA IDB Analyzer (Version 5.0.50).
* Created on 23.02.2026 at 10:31.
* Press Ctrl+A followed by Ctrl+R to submit this merge. 

include file = "%MACROS FOLDER PATH%\IDBAnalyzer.ieasps".
include file = "%PROJECT FOLDER PATH%\DB\IDBAnalyzerCountries.ieasps".

mcrComb 
	 indir="Z:\PIRLS\PRL2001\PIRLS 2001 User Guide\PIRLS\Data\SPSS_Data"/
	 infile=ASGARGR1 ASGBGRR1 ASGBLZR1 ASGCOLR1 ASGCOTR1 ASGCQUR1 ASGCYPR1 ASGCZER1 ASGDEUR1 ASGENGR1 ASGFRAR1 ASGGRCR1 ASGHKGR1 ASGHUNR1 ASGIRNR1 ASGISLR1 ASGISRR1 ASGITAR1 ASGKWTR1 ASGLTUR1 ASGLVAR1 ASGMARR1 ASGMDAR1 ASGMKDR1 ASGNLDR1 ASGNORR1 ASGNZLR1 ASGROMR1 ASGRUSR1 ASGSCOR1 ASGSE3R1 ASGSGPR1 ASGSVKR1 ASGSVNR1 ASGSWER1 ASGTURR1 ASGUSAR1/
	 outdir="%PROJECT FOLDER PATH%\DB"/
	 outfile=tmpASG/
	 keepVar=
       IDCNTRY 
       IDSCHOOL 
       IDCLASS 
       IDGRADE 
       IDSTUD 
       ITBIRTHM 
       ITBIRTHY 
       ITSEX 
       IDBOOK 
       ITADMINI 
       ITDATEM 
       ITDATEY 
       ITLANG 
       IDPOP 
       IDGRADER 
       INPRL01 
       ASBGSEX 
       ITPART 
       ASDGAGE 
       HOUWGT 
       TOTWGT 
       SENWGT 
       JKZONE 
       JKREP 
       IDSTRATE 
       IDSTRATI 
       ASRINF01 
       ASRINF02 
       ASRINF03 
       ASRINF04 
       ASRINF05 
       ASRLIT01 
       ASRLIT02 
       ASRLIT03 
       ASRLIT04 
       ASRLIT05 
       ASRREA01 
       ASRREA02 
       ASRREA03 
       ASRREA04 
       ASRREA05 
       ASDGSATR 
       ASRIBM01 
       ASRIBM02 
       ASRIBM03 
       ASRIBM04 
       ASRIBM05 
       ASDHHER 
       ASRRSI01 
       ASRRSI02 
       ASRRSI03 
       ASRRSI04 
       ASRRSI05 
       ASRIIE01 
       ASRIIE02 
       ASRIIE03 
       ASRIIE04 
       ASRIIE05/
	 idbID='RR1'.
EXECUTE.


ctylabls.
SAVE OUTFILE='%PROJECT FOLDER PATH%\DB\PIRLS2001.sav'.
EXECUTE.
host command = ['del "%PROJECT FOLDER PATH%\DB\tmp*.sav"'].
NEW FILE.

