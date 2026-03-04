* Encoding: windows-1252.
SHOW.
OUTPUT SAVE OUTFILE='%PROJECT FOLDER PATH%\output\output_t0.spv'.



include file = "%MACROS PATH%\JB_Bnch.ieasps".

JB_bnch 	 infile="%PROJECT FOLDER PATH%\DB\PIRLS2001.sav"/
	 cvar=IDCNTRY /
	 rootpv=ASRREA0/
	 tailpv=/
	 npv=5/
	 bnchmrk=400 475 550 625 /
	 incnopv=N/
	 wgt=TOTWGT/
	 nrwgt=75 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=HALF/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut=Y/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 intavg = Y/
	 graphs=N/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="PIRLS2001_BENCHMARK".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_Bnch.ieasps".

JB_bnch 	 infile="%PROJECT FOLDER PATH%\DB\PIRLS2016.sav"/
	 cvar=IDCNTRY /
	 rootpv=ASRREA0/
	 tailpv=/
	 npv=5/
	 bnchmrk=400 475 550 625 /
	 incnopv=N/
	 wgt=TOTWGT/
	 nrwgt=150 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 intavg = Y/
	 graphs=N/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="PIRLS2016_BENCHMARK".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_Bnch.ieasps".

JB_bnch 	 infile="%PROJECT FOLDER PATH%\DB\TIMSS_4_2003.sav"/
	 cvar=IDCNTRY /
	 rootpv=ASMMAT0/
	 tailpv=/
	 npv=5/
	 bnchmrk=400 475 550 625 /
	 incnopv=N/
	 wgt=TOTWGT/
	 nrwgt=75 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=HALF/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut=Y/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 intavg = Y/
	 graphs=N/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_4_2003_BENCHMARK".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_Bnch.ieasps".

JB_bnch 	 infile="%PROJECT FOLDER PATH%\DB\TIMSS_8_2015.sav"/
	 cvar=IDCNTRY /
	 rootpv=BSMMAT0/
	 tailpv=/
	 npv=5/
	 bnchmrk=400 475 550 625 /
	 incnopv=N/
	 wgt=TOTWGT/
	 nrwgt=150 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 intavg = Y/
	 graphs=N/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_8_2015_BENCHMARK".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_Bnch.ieasps".

JB_bnch 	 infile="%PROJECT FOLDER PATH%\DB\ICCS2009.sav"/
	 cvar=IDCNTRY /
	 rootpv=PV/
	 tailpv=CIV/
	 npv=5/
	 bnchmrk=311 395 479 563 /
	 incnopv=N/
	 wgt=TOTWGTS/
	 nrwgt=75 /
	 rwgt=/
	 jkz=JKZONES/
	 jkr=JKREPS/
	 jk2type=HALF/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 intavg = Y/
	 graphs=N/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="ICCS2009_BENCHMARK".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_Bnch.ieasps".

JB_bnch 	 infile="%PROJECT FOLDER PATH%\DB\ICILS2018.sav"/
	 cvar=IDCNTRY /
	 rootpv=PV/
	 tailpv=CIL/
	 npv=5/
	 bnchmrk=407.001 492.001 576.001 661.001 /
	 incnopv=N/
	 wgt=TOTWGTS/
	 nrwgt=75 /
	 rwgt=/
	 jkz=JKZONES/
	 jkr=JKREPS/
	 jk2type=HALF/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 intavg = Y/
	 graphs=N/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="ICILS2018_BENCHMARK".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_Bnch.ieasps".

JB_bnch 	 infile="%PROJECT FOLDER PATH%\DB\TIMSS_8_2023.sav"/
	 cvar=IDCNTRY /
	 rootpv=BSMMAT0/
	 tailpv=/
	 npv=5/
	 bnchmrk=400 475 550 625 /
	 incnopv=N/
	 wgt=TOTWGT/
	 nrwgt=250 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 intavg = Y/
	 graphs=N/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_8_2023_BENCHMARK".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_CorP.ieasps".

JB_CorP 	 infile="%PROJECT FOLDER PATH%\DB\PIRLS2001.sav"/
	 cvar=IDCNTRY /
	 xvar0=ASDGAGE /
	 PVRoots=ASRREA0 /
	 PVTails=/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=75 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=HALF/
	 stratvar=JKZONE/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 pairwise=N/
	 kfac=0/
	 shrtcut=Y/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="PIRLS2001_COR_PEARSON_ASDGAGE".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_CorP.ieasps".

JB_CorP 	 infile="%PROJECT FOLDER PATH%\DB\PIRLS2001.sav"/
	 cvar=IDCNTRY /
	 xvar0= /
	 PVRoots=ASRINF0 ASRIIE0 /
	 PVTails=/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=75 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=HALF/
	 stratvar=JKZONE/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 pairwise=N/
	 kfac=0/
	 shrtcut=Y/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="PIRLS2001_COR_PEARSON_PVS".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_CorP.ieasps".

JB_CorP 	 infile="%PROJECT FOLDER PATH%\DB\PIRLS2016.sav"/
	 cvar=IDCNTRY /
	 xvar0=ASDAGE /
	 PVRoots=ASRREA0 /
	 PVTails=/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=150 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 stratvar=JKZONE/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 pairwise=N/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="PIRLS2016_COR_PEARSON_ASDAGE".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_CorP.ieasps".

JB_CorP 	 infile="%PROJECT FOLDER PATH%\DB\PIRLS2016.sav"/
	 cvar=IDCNTRY /
	 xvar0= /
	 PVRoots=ASRINF0 ASRIIE0 /
	 PVTails=/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=150 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 stratvar=JKZONE/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 pairwise=N/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="PIRLS2016_COR_PEARSON_PVS".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_CorP.ieasps".

JB_CorP 	 infile="%PROJECT FOLDER PATH%\DB\TIMSS_4_2003.sav"/
	 cvar=IDCNTRY /
	 xvar0=ASDAGE /
	 PVRoots=ASMMAT0 /
	 PVTails=/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=75 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=HALF/
	 stratvar=JKZONE/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 pairwise=N/
	 kfac=0/
	 shrtcut=Y/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_4_2003_COR_PEARSON_ASDAGE".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_CorP.ieasps".

JB_CorP 	 infile="%PROJECT FOLDER PATH%\DB\TIMSS_4_2003.sav"/
	 cvar=IDCNTRY /
	 xvar0= /
	 PVRoots=ASSSCI0 ASMDAP0 /
	 PVTails=/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=75 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=HALF/
	 stratvar=JKZONE/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 pairwise=N/
	 kfac=0/
	 shrtcut=Y/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_4_2003_COR_PEARSON_PVS".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_CorP.ieasps".

JB_CorP 	 infile="%PROJECT FOLDER PATH%\DB\TIMSS_8_2015.sav"/
	 cvar=IDCNTRY /
	 xvar0=BSDAGE /
	 PVRoots=BSMMAT0 /
	 PVTails=/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=150 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 stratvar=JKZONE/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 pairwise=N/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_8_2015_COR_PEARSON_BSDAGE".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_CorP.ieasps".

JB_CorP 	 infile="%PROJECT FOLDER PATH%\DB\TIMSS_8_2015.sav"/
	 cvar=IDCNTRY /
	 xvar0= /
	 PVRoots=BSSSCI0 BSMALG0 /
	 PVTails=/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=150 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 stratvar=JKZONE/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 pairwise=N/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_8_2015_COR_PEARSON_PVS".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_CorP.ieasps".

JB_CorP 	 infile="%PROJECT FOLDER PATH%\DB\ICCS2009.sav"/
	 cvar=IDCNTRY /
	 xvar0=OPDISC /
	 PVRoots=PV /
	 PVTails=CIV/
	 npv=5/
	 wgt=TOTWGTS/
	 nrwgt=75 /
	 rwgt=/
	 jkz=JKZONES/
	 jkr=JKREPS/
	 jk2type=HALF/
	 stratvar=JKZONES/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 pairwise=N/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="ICCS2009_COR_PEARSON_OPDISC".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_CorP.ieasps".

JB_CorP 	 infile="%PROJECT FOLDER PATH%\DB\ICILS2018.sav"/
	 cvar=IDCNTRY /
	 xvar0=S_GENEFF /
	 PVRoots=PV /
	 PVTails=CIL/
	 npv=5/
	 wgt=TOTWGTS/
	 nrwgt=75 /
	 rwgt=/
	 jkz=JKZONES/
	 jkr=JKREPS/
	 jk2type=HALF/
	 stratvar=JKZONES/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 pairwise=N/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="ICILS2018_COR_PEARSON_S_GENEFF".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_CorP.ieasps".

JB_CorP 	 infile="%PROJECT FOLDER PATH%\DB\ICILS2018.sav"/
	 cvar=IDCNTRY /
	 xvar0= /
	 PVRoots=PV PV /
	 PVTails=CIL CT/
	 npv=5/
	 wgt=TOTWGTS/
	 nrwgt=75 /
	 rwgt=/
	 jkz=JKZONES/
	 jkr=JKREPS/
	 jk2type=HALF/
	 stratvar=JKZONES/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 pairwise=N/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="ICILS2018_COR_PEARSON_PVS".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_CorP.ieasps".

JB_CorP 	 infile="%PROJECT FOLDER PATH%\DB\TIMSS_8_2023.sav"/
	 cvar=IDCNTRY /
	 xvar0=BSDAGE /
	 PVRoots=BSMMAT0 /
	 PVTails=/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=250 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 stratvar=JKZONE/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 pairwise=N/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_8_2023_COR_PEARSON_BSDAGE".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_CorP.ieasps".

JB_CorP 	 infile="%PROJECT FOLDER PATH%\DB\TIMSS_8_2023.sav"/
	 cvar=IDCNTRY /
	 xvar0= /
	 PVRoots=BSSSCI0 BSMALG0 /
	 PVTails=/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=250 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 stratvar=JKZONE/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 pairwise=N/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_8_2023_COR_PEARSON_PVS".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_Cor.ieasps".

JB_Cor 	 infile="%PROJECT FOLDER PATH%\DB\PIRLS2001.sav"/
	 cvar=IDCNTRY /
	 xvar=ASDHHER ASDGSATR /
	 wgt=TOTWGT/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=HALF/
	 stratvar=JKZONE/
	 nrwgt=75/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 corrtype=PEARSON/
	 pairwise=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="PIRLS2001_COR_PEARSON_NOPV".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_Cor.ieasps".

JB_Cor 	 infile="%PROJECT FOLDER PATH%\DB\PIRLS2016.sav"/
	 cvar=IDCNTRY /
	 xvar=ASDGHRL ASDGSLR /
	 wgt=TOTWGT/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 stratvar=JKZONE/
	 nrwgt=150/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 corrtype=PEARSON/
	 pairwise=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="PIRLS2016_COR_PEARSON_NOPV".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_Cor.ieasps".

JB_Cor 	 infile="%PROJECT FOLDER PATH%\DB\TIMSS_4_2003.sav"/
	 cvar=IDCNTRY /
	 xvar=ASBGBOOK ASDMSCL /
	 wgt=TOTWGT/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=HALF/
	 stratvar=JKZONE/
	 nrwgt=75/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 corrtype=PEARSON/
	 pairwise=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_4_2003_COR_PEARSON_NOPV".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_Cor.ieasps".

JB_Cor 	 infile="%PROJECT FOLDER PATH%\DB\TIMSS_8_2015.sav"/
	 cvar=IDCNTRY /
	 xvar=BSDGHER BSDGSLM /
	 wgt=TOTWGT/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 stratvar=JKZONE/
	 nrwgt=150/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 corrtype=PEARSON/
	 pairwise=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_8_2015_COR_PEARSON_NOPV".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_Cor.ieasps".

JB_Cor 	 infile="%PROJECT FOLDER PATH%\DB\ICCS2009.sav"/
	 cvar=IDCNTRY /
	 xvar=HOMELIT HISCED /
	 wgt=TOTWGTS/
	 jkz=JKZONES/
	 jkr=JKREPS/
	 jk2type=HALF/
	 stratvar=JKZONES/
	 nrwgt=75/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 corrtype=PEARSON/
	 pairwise=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="ICCS2009_COR_PEARSON_NOPV".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_Cor.ieasps".

JB_Cor 	 infile="%PROJECT FOLDER PATH%\DB\ICILS2018.sav"/
	 cvar=IDCNTRY /
	 xvar=S_HOMLIT S_HISCED /
	 wgt=TOTWGTS/
	 jkz=JKZONES/
	 jkr=JKREPS/
	 jk2type=HALF/
	 stratvar=JKZONES/
	 nrwgt=75/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 corrtype=PEARSON/
	 pairwise=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="ICILS2018_COR_PEARSON_NOPV".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_Cor.ieasps".

JB_Cor 	 infile="%PROJECT FOLDER PATH%\DB\TIMSS_8_2023.sav"/
	 cvar=IDCNTRY /
	 xvar=BSDGHER BSDGSLM /
	 wgt=TOTWGT/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 stratvar=JKZONE/
	 nrwgt=250/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 corrtype=PEARSON/
	 pairwise=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_8_2023_COR_PEARSON_NOPV".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_Cor.ieasps".

JB_Cor 	 infile="%PROJECT FOLDER PATH%\DB\PIRLS2001.sav"/
	 cvar=IDCNTRY /
	 xvar=ASDHHER ASDGSATR /
	 wgt=TOTWGT/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=HALF/
	 stratvar=JKZONE/
	 nrwgt=75/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 corrtype=SPEARMAN/
	 pairwise=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="PIRLS2001_COR_SPEARMAN".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_Cor.ieasps".

JB_Cor 	 infile="%PROJECT FOLDER PATH%\DB\PIRLS2016.sav"/
	 cvar=IDCNTRY /
	 xvar=ASDGHRL ASDGSLR /
	 wgt=TOTWGT/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 stratvar=JKZONE/
	 nrwgt=150/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 corrtype=SPEARMAN/
	 pairwise=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="PIRLS2016_COR_SPEARMAN".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_Cor.ieasps".

JB_Cor 	 infile="%PROJECT FOLDER PATH%\DB\TIMSS_4_2003.sav"/
	 cvar=IDCNTRY /
	 xvar=ASBGBOOK ASDMSCL /
	 wgt=TOTWGT/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=HALF/
	 stratvar=JKZONE/
	 nrwgt=75/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 corrtype=SPEARMAN/
	 pairwise=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_4_2003_COR_SPEARMAN".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_Cor.ieasps".

JB_Cor 	 infile="%PROJECT FOLDER PATH%\DB\TIMSS_8_2015.sav"/
	 cvar=IDCNTRY /
	 xvar=BSDGHER BSDGSLM /
	 wgt=TOTWGT/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 stratvar=JKZONE/
	 nrwgt=150/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 corrtype=SPEARMAN/
	 pairwise=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_8_2015_COR_SPEARMAN".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_Cor.ieasps".

JB_Cor 	 infile="%PROJECT FOLDER PATH%\DB\ICCS2009.sav"/
	 cvar=IDCNTRY /
	 xvar=HOMELIT HISCED /
	 wgt=TOTWGTS/
	 jkz=JKZONES/
	 jkr=JKREPS/
	 jk2type=HALF/
	 stratvar=JKZONES/
	 nrwgt=75/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 corrtype=SPEARMAN/
	 pairwise=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="ICCS2009_COR_SPEARMAN".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_Cor.ieasps".

JB_Cor 	 infile="%PROJECT FOLDER PATH%\DB\ICILS2018.sav"/
	 cvar=IDCNTRY /
	 xvar=S_HOMLIT S_HISCED /
	 wgt=TOTWGTS/
	 jkz=JKZONES/
	 jkr=JKREPS/
	 jk2type=HALF/
	 stratvar=JKZONES/
	 nrwgt=75/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 corrtype=SPEARMAN/
	 pairwise=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="ICILS2018_COR_SPEARMAN".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_Cor.ieasps".

JB_Cor 	 infile="%PROJECT FOLDER PATH%\DB\TIMSS_8_2023.sav"/
	 cvar=IDCNTRY /
	 xvar=BSDGHER BSDGSLM /
	 wgt=TOTWGT/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 stratvar=JKZONE/
	 nrwgt=250/
	 nomiss=Y/
	 strctry = N/
	 method=JRR/
	 corrtype=SPEARMAN/
	 pairwise=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 selcrit = /
	 selvar = /
	 intavg = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_8_2023_COR_SPEARMAN".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_Gen.ieasps".

JB_gen 	 infile="%PROJECT FOLDER PATH%\DB\PIRLS2001.sav"/
	 cvar=IDCNTRY /
	 almvars=ASBGSEX /
	 xvar=ASDGSATR /
	 wgt=TOTWGT/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=HALF/
	 stratvar=JKZONE/
	 nrwgt=75/
	 nomiss=Y/
	 method=JRR/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 intavg = Y/
	 graphs=Y/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="PIRLS2001_GROUP_DIF_NOPV".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_Gen.ieasps".

JB_gen 	 infile="%PROJECT FOLDER PATH%\DB\PIRLS2016.sav"/
	 cvar=IDCNTRY /
	 almvars=ASBG01 /
	 xvar=ASDGSLR /
	 wgt=TOTWGT/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 stratvar=JKZONE/
	 nrwgt=150/
	 nomiss=Y/
	 method=JRR/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 intavg = Y/
	 graphs=Y/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="PIRLS2016_GROUP_DIF_NOPV".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_Gen.ieasps".

JB_gen 	 infile="%PROJECT FOLDER PATH%\DB\TIMSS_4_2003.sav"/
	 cvar=IDCNTRY /
	 almvars=ASBGSEX /
	 xvar=ASDMSCL /
	 wgt=TOTWGT/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=HALF/
	 stratvar=JKZONE/
	 nrwgt=75/
	 nomiss=Y/
	 method=JRR/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 intavg = Y/
	 graphs=Y/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_4_2003_GROUP_DIF_NOPV".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_Gen.ieasps".

JB_gen 	 infile="%PROJECT FOLDER PATH%\DB\TIMSS_8_2015.sav"/
	 cvar=IDCNTRY /
	 almvars=BSBG01 /
	 xvar=BSDGSLM /
	 wgt=TOTWGT/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 stratvar=JKZONE/
	 nrwgt=150/
	 nomiss=Y/
	 method=JRR/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 intavg = Y/
	 graphs=Y/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_8_2015_GROUP_DIF_NOPV".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_Gen.ieasps".

JB_gen 	 infile="%PROJECT FOLDER PATH%\DB\ICCS2009.sav"/
	 cvar=IDCNTRY /
	 almvars=SGENDER /
	 xvar=HISCED /
	 wgt=TOTWGTS/
	 jkz=JKZONES/
	 jkr=JKREPS/
	 jk2type=HALF/
	 stratvar=JKZONES/
	 nrwgt=75/
	 nomiss=Y/
	 method=JRR/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 intavg = Y/
	 graphs=Y/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="ICCS2009_GROUP_DIF_NOPV".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_Gen.ieasps".

JB_gen 	 infile="%PROJECT FOLDER PATH%\DB\ICILS2018.sav"/
	 cvar=IDCNTRY /
	 almvars=S_SEX /
	 xvar=S_HISCED /
	 wgt=TOTWGTS/
	 jkz=JKZONES/
	 jkr=JKREPS/
	 jk2type=HALF/
	 stratvar=JKZONES/
	 nrwgt=75/
	 nomiss=Y/
	 method=JRR/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 intavg = Y/
	 graphs=Y/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="ICILS2018_GROUP_DIF_NOPV".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_Gen.ieasps".

JB_gen 	 infile="%PROJECT FOLDER PATH%\DB\TIMSS_8_2023.sav"/
	 cvar=IDCNTRY /
	 almvars=BSBG01 /
	 xvar=BSDGSLM /
	 wgt=TOTWGT/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 stratvar=JKZONE/
	 nrwgt=250/
	 nomiss=Y/
	 method=JRR/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 intavg = Y/
	 graphs=Y/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_8_2023_GROUP_DIF_NOPV".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_PV.ieasps".

JB_PV 	 infile="%PROJECT FOLDER PATH%\DB\PIRLS2001.sav"/
	 cvar=IDCNTRY /
	 almvars=ASBGSEX /
	 rootpv=ASRREA0 /
	 tailpv=/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=75 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=HALF/
	 stratvar=JKZONE/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut=Y/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 intavg = Y/
	 graphs=Y/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="PIRLS2001_GROUP_DIF_PV".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_PV.ieasps".

JB_PV 	 infile="%PROJECT FOLDER PATH%\DB\PIRLS2016.sav"/
	 cvar=IDCNTRY /
	 almvars=ASBG01 /
	 rootpv=ASRREA0 /
	 tailpv=/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=150 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 stratvar=JKZONE/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 intavg = Y/
	 graphs=Y/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="PIRLS2016_GROUP_DIF_PV".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_PV.ieasps".

JB_PV 	 infile="%PROJECT FOLDER PATH%\DB\TIMSS_4_2003.sav"/
	 cvar=IDCNTRY /
	 almvars=ASBGSEX /
	 rootpv=ASMMAT0 /
	 tailpv=/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=75 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=HALF/
	 stratvar=JKZONE/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut=Y/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 intavg = Y/
	 graphs=Y/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_4_2003_GROUP_DIF_PV".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_PV.ieasps".

JB_PV 	 infile="%PROJECT FOLDER PATH%\DB\TIMSS_8_2015.sav"/
	 cvar=IDCNTRY /
	 almvars=BSBG01 /
	 rootpv=BSMMAT0 /
	 tailpv=/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=150 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 stratvar=JKZONE/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 intavg = Y/
	 graphs=Y/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_8_2015_GROUP_DIF_PV".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_PV.ieasps".

JB_PV 	 infile="%PROJECT FOLDER PATH%\DB\ICCS2009.sav"/
	 cvar=IDCNTRY /
	 almvars=SGENDER /
	 rootpv=PV /
	 tailpv=CIV/
	 npv=5/
	 wgt=TOTWGTS/
	 nrwgt=75 /
	 rwgt=/
	 jkz=JKZONES/
	 jkr=JKREPS/
	 jk2type=HALF/
	 stratvar=JKZONES/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 intavg = Y/
	 graphs=Y/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="ICCS2009_GROUP_DIF_PV".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_PV.ieasps".

JB_PV 	 infile="%PROJECT FOLDER PATH%\DB\ICILS2018.sav"/
	 cvar=IDCNTRY /
	 almvars=S_SEX /
	 rootpv=PV /
	 tailpv=CIL/
	 npv=5/
	 wgt=TOTWGTS/
	 nrwgt=75 /
	 rwgt=/
	 jkz=JKZONES/
	 jkr=JKREPS/
	 jk2type=HALF/
	 stratvar=JKZONES/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 intavg = Y/
	 graphs=Y/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="ICILS2018_GROUP_DIF_PV".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_PV.ieasps".

JB_PV 	 infile="%PROJECT FOLDER PATH%\DB\TIMSS_8_2023.sav"/
	 cvar=IDCNTRY /
	 almvars=BSBG01 /
	 rootpv=BSMMAT0 /
	 tailpv=/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=250 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 stratvar=JKZONE/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 intavg = Y/
	 graphs=Y/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_8_2023_GROUP_DIF_PV".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_PctilesP.ieasps".

JB_PctilesP infile="%PROJECT FOLDER PATH%\DB\PIRLS2001.sav"/
	 cvar=IDCNTRY ASBGSEX /
	 pctiles=10 50 90 /
	 rootpv=ASRREA0 /
	 tailpv=/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=75 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=HALF/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut=Y/
	 viewcod=N/
	 ndec=2/
	 clean=Y/
	 strctry=N/
	 graphs = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="PIRLS2001_PERCENTILES".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_PctilesP.ieasps".

JB_PctilesP infile="%PROJECT FOLDER PATH%\DB\PIRLS2016.sav"/
	 cvar=IDCNTRY ASBG01 /
	 pctiles=10 50 90 /
	 rootpv=ASRREA0 /
	 tailpv=/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=150 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 ndec=2/
	 clean=Y/
	 strctry=N/
	 graphs = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="PIRLS2016_PERCENTILES".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_PctilesP.ieasps".

JB_PctilesP infile="%PROJECT FOLDER PATH%\DB\TIMSS_4_2003.sav"/
	 cvar=IDCNTRY ASBGSEX /
	 pctiles=10 50 90 /
	 rootpv=ASMMAT0 /
	 tailpv=/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=75 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=HALF/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut=Y/
	 viewcod=N/
	 ndec=2/
	 clean=Y/
	 strctry=N/
	 graphs = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_4_2003_PERCENTILES".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_PctilesP.ieasps".

JB_PctilesP infile="%PROJECT FOLDER PATH%\DB\TIMSS_8_2015.sav"/
	 cvar=IDCNTRY BSBG01 /
	 pctiles=10 50 90 /
	 rootpv=BSMMAT0 /
	 tailpv=/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=150 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 ndec=2/
	 clean=Y/
	 strctry=N/
	 graphs = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_8_2015_PERCENTILES".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_PctilesP.ieasps".

JB_PctilesP infile="%PROJECT FOLDER PATH%\DB\ICCS2009.sav"/
	 cvar=IDCNTRY SGENDER /
	 pctiles=10 50 90 /
	 rootpv=PV /
	 tailpv=CIV/
	 npv=5/
	 wgt=TOTWGTS/
	 nrwgt=75 /
	 rwgt=/
	 jkz=JKZONES/
	 jkr=JKREPS/
	 jk2type=HALF/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 ndec=2/
	 clean=Y/
	 strctry=N/
	 graphs = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="ICCS2009_PERCENTILES".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_PctilesP.ieasps".

JB_PctilesP infile="%PROJECT FOLDER PATH%\DB\ICILS2018.sav"/
	 cvar=IDCNTRY S_SEX /
	 pctiles=10 50 90 /
	 rootpv=PV /
	 tailpv=CIL/
	 npv=5/
	 wgt=TOTWGTS/
	 nrwgt=75 /
	 rwgt=/
	 jkz=JKZONES/
	 jkr=JKREPS/
	 jk2type=HALF/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 ndec=2/
	 clean=Y/
	 strctry=N/
	 graphs = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="ICILS2018_PERCENTILES".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_PctilesP.ieasps".

JB_PctilesP infile="%PROJECT FOLDER PATH%\DB\TIMSS_8_2023.sav"/
	 cvar=IDCNTRY BSBG01 /
	 pctiles=10 50 90 /
	 rootpv=BSMMAT0 /
	 tailpv=/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=250 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 ndec=2/
	 clean=Y/
	 strctry=N/
	 graphs = Y/
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_8_2023_PERCENTILES".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_RegGP.ieasps".

JB_RegGP 	 infile="%PROJECT FOLDER PATH%\DB\PIRLS2001.sav"/
	 cvar=IDCNTRY /
	 convar=ASDGAGE /
	 catvar=ASDGSATR ASBGSEX /
	 codings=D D/
	 refcats=1 1/
	 ncats=3 2/
	 PVRoots=ASRINF0/
	 PVTails=/
	 dvar0=/
	 rootpv=ASRIIE0 /
	 tailpv=/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=75 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=HALF/
	 stratvar=JKZONE/
	 nomiss=Y/
	 method=JRR/
	 missing=listwise/
	 kfac=0/
	 shrtcut=Y/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 viewprgs=Y/
	 viewlbl=Y/
	 qcstats=Y/
	 newout=Y/
	 intavg = Y/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="PIRLS2001_OLS".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_RegGP.ieasps".

JB_RegGP 	 infile="%PROJECT FOLDER PATH%\DB\PIRLS2016.sav"/
	 cvar=IDCNTRY /
	 convar=ASDAGE /
	 catvar=ASDGSLR ASBG01 /
	 codings=D D/
	 refcats=1 1/
	 ncats=3 2/
	 PVRoots=ASRINF0/
	 PVTails=/
	 dvar0=/
	 rootpv=ASRIIE0 /
	 tailpv=/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=150 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 stratvar=JKZONE/
	 nomiss=Y/
	 method=JRR/
	 missing=listwise/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 viewprgs=Y/
	 viewlbl=Y/
	 qcstats=Y/
	 newout=Y/
	 intavg = Y/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="PIRLS2016_OLS".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_RegGP.ieasps".

JB_RegGP 	 infile="%PROJECT FOLDER PATH%\DB\TIMSS_4_2003.sav"/
	 cvar=IDCNTRY /
	 convar=ASDAGE /
	 catvar=ASDMSCL ASBGSEX /
	 codings=D D/
	 refcats=1 1/
	 ncats=3 2/
	 PVRoots=ASSSCI0/
	 PVTails=/
	 dvar0=/
	 rootpv=ASMDAP0 /
	 tailpv=/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=75 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=HALF/
	 stratvar=JKZONE/
	 nomiss=Y/
	 method=JRR/
	 missing=listwise/
	 kfac=0/
	 shrtcut=Y/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 viewprgs=Y/
	 viewlbl=Y/
	 qcstats=Y/
	 newout=Y/
	 intavg = Y/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_4_2003_OLS".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_RegGP.ieasps".

JB_RegGP 	 infile="%PROJECT FOLDER PATH%\DB\TIMSS_8_2015.sav"/
	 cvar=IDCNTRY /
	 convar=BSDAGE /
	 catvar=BSDGSLM BSBG01 /
	 codings=D D/
	 refcats=1 1/
	 ncats=3 2/
	 PVRoots=BSSSCI0/
	 PVTails=/
	 dvar0=/
	 rootpv=BSMALG0 /
	 tailpv=/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=150 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 stratvar=JKZONE/
	 nomiss=Y/
	 method=JRR/
	 missing=listwise/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 viewprgs=Y/
	 viewlbl=Y/
	 qcstats=Y/
	 newout=Y/
	 intavg = Y/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_8_2015_OLS".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_RegGP.ieasps".

JB_RegGP 	 infile="%PROJECT FOLDER PATH%\DB\ICCS2009.sav"/
	 cvar=IDCNTRY /
	 convar=SAGE OPDISC /
	 catvar=HISCED SGENDER /
	 codings=D D/
	 refcats=6 1/
	 ncats=6 2/
	 PVRoots=/
	 PVTails=/
	 dvar0=/
	 rootpv=PV /
	 tailpv=CIV/
	 npv=5/
	 wgt=TOTWGTS/
	 nrwgt=75 /
	 rwgt=/
	 jkz=JKZONES/
	 jkr=JKREPS/
	 jk2type=HALF/
	 stratvar=JKZONES/
	 nomiss=Y/
	 method=JRR/
	 missing=listwise/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 viewprgs=Y/
	 viewlbl=Y/
	 qcstats=Y/
	 newout=Y/
	 intavg = Y/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="ICCS2009_OLS".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_RegGP.ieasps".

JB_RegGP 	 infile="%PROJECT FOLDER PATH%\DB\ICILS2018.sav"/
	 cvar=IDCNTRY /
	 convar=S_AGE S_GENEFF /
	 catvar=S_HISCED S_SEX /
	 codings=D D/
	 refcats=5 1/
	 ncats=5 2/
	 PVRoots=PV/
	 PVTails=CT/
	 dvar0=/
	 rootpv=PV /
	 tailpv=CIL/
	 npv=5/
	 wgt=TOTWGTS/
	 nrwgt=75 /
	 rwgt=/
	 jkz=JKZONES/
	 jkr=JKREPS/
	 jk2type=HALF/
	 stratvar=JKZONES/
	 nomiss=Y/
	 method=JRR/
	 missing=listwise/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 viewprgs=Y/
	 viewlbl=Y/
	 qcstats=Y/
	 newout=Y/
	 intavg = Y/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="ICILS2018_OLS".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_RegGP.ieasps".

JB_RegGP 	 infile="%PROJECT FOLDER PATH%\DB\TIMSS_8_2023.sav"/
	 cvar=IDCNTRY /
	 convar=BSDAGE /
	 catvar=BSDGSLM BSBG01 /
	 codings=D D/
	 refcats=1 1/
	 ncats=3 2/
	 PVRoots=BSSSCI0/
	 PVTails=/
	 dvar0=/
	 rootpv=BSMALG0 /
	 tailpv=/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=250 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 stratvar=JKZONE/
	 nomiss=Y/
	 method=JRR/
	 missing=listwise/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 viewprgs=Y/
	 viewlbl=Y/
	 qcstats=Y/
	 newout=Y/
	 intavg = Y/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_8_2023_OLS".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_LogRegP2.ieasps".

JB_LogRegP2 infile="%PROJECT FOLDER PATH%\DB\PIRLS2001.sav"/
	 cvar=IDCNTRY /
	 convar=ASDGAGE /
	 catvar=ASDGSATR ASBGSEX /
	 contrast=Indicator Indicator/
	 refcats=Default Default/
	 interact=/
	 interwpv=/
	 PVRoots = /
	 PVTails = /
	 rootpv = ASRREA0 /
	 tailpv = /
	 cutpoint=550/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=75 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=HALF/
	 stratvar=JKZONE/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut=Y/
	 viewcod=N/
	 viewprgs=Y/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 viewlbl=Y/
	 qcstats=Y/
	 report=Y/
	 newout=Y/
	 intavg = Y/
	 onegrp=N/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="PIRLS2001_LOGIT".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_LogRegP2.ieasps".

JB_LogRegP2 infile="%PROJECT FOLDER PATH%\DB\PIRLS2016.sav"/
	 cvar=IDCNTRY /
	 convar=ASDAGE /
	 catvar=ASDGSLR ASBG01 /
	 contrast=Indicator Indicator/
	 refcats=Default Default/
	 interact=/
	 interwpv=/
	 PVRoots = /
	 PVTails = /
	 rootpv = ASRREA0 /
	 tailpv = /
	 cutpoint=550/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=150 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 stratvar=JKZONE/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 viewprgs=Y/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 viewlbl=Y/
	 qcstats=Y/
	 report=Y/
	 newout=Y/
	 intavg = Y/
	 onegrp=N/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="PIRLS2016_LOGIT".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_LogRegP2.ieasps".

JB_LogRegP2 infile="%PROJECT FOLDER PATH%\DB\TIMSS_4_2003.sav"/
	 cvar=IDCNTRY /
	 convar=ASDAGE /
	 catvar=ASDMSCL ASBGSEX /
	 contrast=Indicator Indicator/
	 refcats=Default Default/
	 interact=/
	 interwpv=/
	 PVRoots = /
	 PVTails = /
	 rootpv = ASMMAT0 /
	 tailpv = /
	 cutpoint=550/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=75 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=HALF/
	 stratvar=JKZONE/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut=Y/
	 viewcod=N/
	 viewprgs=Y/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 viewlbl=Y/
	 qcstats=Y/
	 report=Y/
	 newout=Y/
	 intavg = Y/
	 onegrp=N/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_4_2003_LOGIT".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_LogRegP2.ieasps".

JB_LogRegP2 infile="%PROJECT FOLDER PATH%\DB\TIMSS_8_2015.sav"/
	 cvar=IDCNTRY /
	 convar=BSDAGE /
	 catvar=BSDGSLM BSBG01 /
	 contrast=Indicator Indicator/
	 refcats=Default Default/
	 interact=/
	 interwpv=/
	 PVRoots = /
	 PVTails = /
	 rootpv = BSMMAT0 /
	 tailpv = /
	 cutpoint=550/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=150 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 stratvar=JKZONE/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 viewprgs=Y/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 viewlbl=Y/
	 qcstats=Y/
	 report=Y/
	 newout=Y/
	 intavg = Y/
	 onegrp=N/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_8_2015_LOGIT".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_LogRegP2.ieasps".

JB_LogRegP2 infile="%PROJECT FOLDER PATH%\DB\ICCS2009.sav"/
	 cvar=IDCNTRY /
	 convar=SAGE OPDISC /
	 catvar=HISCED SGENDER /
	 contrast=Indicator Indicator/
	 refcats=Default Default/
	 interact=/
	 interwpv=/
	 PVRoots = /
	 PVTails = /
	 rootpv = PV /
	 tailpv = CIV/
	 cutpoint=550/
	 npv=5/
	 wgt=TOTWGTS/
	 nrwgt=75 /
	 rwgt=/
	 jkz=JKZONES/
	 jkr=JKREPS/
	 jk2type=HALF/
	 stratvar=JKZONES/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 viewprgs=Y/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 viewlbl=Y/
	 qcstats=Y/
	 report=Y/
	 newout=Y/
	 intavg = Y/
	 onegrp=N/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="ICCS2009_LOGIT".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_LogRegP2.ieasps".

JB_LogRegP2 infile="%PROJECT FOLDER PATH%\DB\ICILS2018.sav"/
	 cvar=IDCNTRY /
	 convar=S_AGE S_GENEFF /
	 catvar=S_HISCED S_SEX /
	 contrast=Indicator Indicator/
	 refcats=Default Default/
	 interact=/
	 interwpv=/
	 PVRoots = /
	 PVTails = /
	 rootpv = PV /
	 tailpv = CIL/
	 cutpoint=550/
	 npv=5/
	 wgt=TOTWGTS/
	 nrwgt=75 /
	 rwgt=/
	 jkz=JKZONES/
	 jkr=JKREPS/
	 jk2type=HALF/
	 stratvar=JKZONES/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 viewprgs=Y/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 viewlbl=Y/
	 qcstats=Y/
	 report=Y/
	 newout=Y/
	 intavg = Y/
	 onegrp=N/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="ICILS2018_LOGIT".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 



include file = "%MACROS PATH%\JB_LogRegP2.ieasps".

JB_LogRegP2 infile="%PROJECT FOLDER PATH%\DB\TIMSS_8_2023.sav"/
	 cvar=IDCNTRY /
	 convar=BSDAGE /
	 catvar=BSDGSLM BSBG01 /
	 contrast=Indicator Indicator/
	 refcats=Default Default/
	 interact=/
	 interwpv=/
	 PVRoots = /
	 PVTails = /
	 rootpv = BSMMAT0 /
	 tailpv = /
	 cutpoint=550/
	 npv=5/
	 wgt=TOTWGT/
	 nrwgt=250 /
	 rwgt=/
	 jkz=JKZONE/
	 jkr=JKREP/
	 jk2type=FULL/
	 stratvar=JKZONE/
	 nomiss=Y/
	 method=JRR/
	 kfac=0/
	 shrtcut=N/
	 viewcod=N/
	 viewprgs=Y/
	 ndec=2/
	 clean = Y/
	 strctry = N/
	 viewlbl=Y/
	 qcstats=Y/
	 report=Y/
	 newout=Y/
	 intavg = Y/
	 onegrp=N/
	 selcrit = /
	 selvar = /
	 outdir="%PROJECT FOLDER PATH%\output"/
	 outfile="TIMSS_8_2023_LOGIT".

 * --- CLEANUP ---.
DATASET CLOSE ALL.
OUTPUT CLOSE ALL.
OUTPUT NEW.
CACHE. 


