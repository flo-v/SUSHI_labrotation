# SUSHI_labrotation

Table of Contents
=================

* [26 Apr\. 2022, Kick\-off meeting, Florian \+ Masa](#26-apr-2022-kick-off-meeting-florian--masa)
* [27\-29 Apr\. 2022, get sushi test instance working for Flo](#27-29-apr-2022-get-sushi-test-instance-working-for-flo)
* [04 May 2022, ezRun explanation meeting, Florian \+ Masa](#04-may-2022-ezrun-explanation-meeting-florian--masa)
* [05 May 2022, ezRun install test, Masa](#05-may-2022-ezrun-install-test-masa)
* [06-current May 2022, testing FastQC & Minimal app and ezrun install test Flo](#06-current-may-2022testing-fastqc--minimal-app-and-ezrun-install-test-flo)  

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc.go)

## 26 Apr. 2022, Kick-off meeting, Florian + Masa

ToDo/Done
1. ~~Making a git repository~~
2. ~~Fork SUSHI repository~~
3. ~~Fork ezRun repository~~
4. ~~Demo local SUSHI instance on fgcz-c-047.uzh.ch~~
5. ~~Test local instance access, job submission~~

Log
```
22-04-26 14:26 masaomi@fgcz-c-047: mkdir /srv/kenlab/flo
22-04-26 14:29 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426
$ cp masa_test_sushi_20220414.tgz ./flo_sushi_20220426.tgz
$ tar zxvf flo_sushi_20220426.tgz
$ cd flo_sushi_20220426/master/
$ source /usr/local/ngseq/etc/lmod_profile
$ module load Dev/Ruby/3.0.3
$ bundle exec rails s -e production -b fgcz-c-047.uzh.ch -p 5000
```
Note
* The SUSHI instance source code: /srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220426.tgz

To check the process
```
$ ps aux |grep rails
masaomi  16798 20.6  0.0 321176 125024 pts/58  Sl+  14:49   0:04 /misc/ngseq10/packages/Dev/Ruby/3.0.3/bin/ruby script/rails s -e production -b fgcz-c-047.uzh.ch -p 5000
$ kill -9 16798
```
Then
* start VPN
* access http://fgcz-c-047.uzh.ch:5000
 * Login by BFabric account/password

Setup test dataset in p1535
1. Select project 1535
2. gStore-ventricles_100k-test_masa_dataset.tsv (download)
3. Import-Browse-test_masa_dataset.tsv-DataSet Name:xxxx-load dataset
4. Confirm by clickin DataSet in menu
5. Click test_dataset (Applications - refresh if you cannot see the application buttons)
6. Select FastQCApp, and submit
7. Wait for a minute, and check the result
8. Test making a new SUSHI app

Then next
* Masa will give you how to make ezRun application with SUSHI


## 27-29 Apr. 2022, get sushi test instance working for Flo

ToDo/Done
1. ~~Get windows subsystem running for linux commands~~
2. ~~Get Github to work with access tokens~~

Log
```
fvetsc@fgcz-c-047:/srv/kenlab/flo
$ cp /srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220426.tgz .
$ rm /srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220426.tgz
$ tar zxvf flo_sushi_20220426.tgz
$ cd flo_sushi_20220426/master/
$ source /usr/local/ngseq/etc/lmod_profile
$ module load Dev/Ruby/3.0.3
$ bundle exec rails s -e production -b fgcz-c-047.uzh.ch -p 5000
```
### FGCZ website steps
Start VPN and accessed http://fgcz-c-047.uzh.ch:5000: (5000 or whatever number defined in rails execution)   
Logging in with username  
Run analysis on data:
1. Select project 1535
2. gStore-ventricles_100k-test_masa_dataset.tsv (or other data; download, if not already done)
3. Import-Browse-test_masa_dataset.tsv-DataSet (or use other data), define Name:xxxx-load dataset
4. Confirm by clickin DataSet in menu
5. Click test_dataset with given name xxxx (Applications - refresh if you cannot see the application buttons)
6. Select whatever application you want (here FastQCApp), and submit
7. Wait for some minutes, and check the result (by clicking on DataSets once again)


Make new sushi app
Log
```
$ ps aux |grep rails
$ fvetsc  16798 20.6  0.0 321176 125024 pts/58  Sl+  14:49   0:04 /misc/ngseq10/packages/Dev/Ruby/3.0.3/bin/ruby script/rails s -e production -b fgcz-c-047.uzh.ch -p 5000
$ kill -9 16798
$ exit
local: ssh fvetsc@fgcz-c-047.uzh.ch
$ vim /srv/kenlab/flo/flo_sushi_20220426/master/lib/MinimalApp.rb # created a minimal app
$ cd /srv/kenlab/flo/flo_sushi_20220426/master/
$ source /usr/local/ngseq/etc/lmod_profile
$ module load Dev/Ruby/3.0.3
$ bundle exec rails s -e production -b fgcz-c-047.uzh.ch -p 5000
```
error: uninitialized constant ApplicationController::MinimalApp_flo
MinimalApp_flo cannot be imported

### Questions/problems:
* ~~what is the adress for the ssh connection to the server again? maybe I got somthing wrong?~~

* ~~when starting the VPN access to http://fgcz-c-047.uzh.ch:5000 doesn't work~~
* ~~after having done everything in the log above and started VPN to access http://fgcz-c-047.uzh.ch:5000 : page loads but login to BFabric account doesn't work. Error message: "We're sorry, but something went wrong."~~
* Newly created sushi app is not listed under stats category when chosing apps for analysis on http://fgcz-c-047.uzh.ch:5000

## 04 May 2022, ezRun explanation meeting, Florian \+ Masa

Cheat Sheet
* https://docs.google.com/document/d/1wTNdJgTzK7J54p90yH-djF5L_4VUwl64JknVmSCNxCE

ToDo (by Florian)
```
22-05-04 10:10 masaomi@fgcz-c-047:/srv/kenlab/flo
$ cp -r /srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220504.tgz .
$ tar zxvf flo_sushi_20220504.tgz
```

Log
1. Start VPN
2. test run SUSHI

```
22-05-04 10:15 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220504/master
$ bundle exec rails s -e production -b fgcz-c-047.uzh.ch -p 4001
```

Access
* http://fgcz-c-047.uzh.ch:4001/
* Job submission test

Note
* Florian could use port:5000

Next
* Minimal SUSHI App test

Log
```
22-05-04 10:32 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220504/master
$ git add lib/MinimalApp.rb

22-05-04 10:33 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220504/master
$ git commit -m "Added MinimalApp.rb"
[master 820e59d1] Added MinimalApp.rb
 1 file changed, 32 insertions(+)
 create mode 100644 master/lib/MinimalApp.rb

22-05-04 10:33 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220504/master
$ git push
Enumerating objects: 8, done.
Counting objects: 100% (8/8), done.
Delta compression using up to 32 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 793 bytes | 793.00 KiB/s, done.
Total 5 (delta 3), reused 0 (delta 0)
remote: Resolving deltas: 100% (3/3), completed with 3 local objects.
To github.com:flo-v/sushi.git
 ! [remote rejected]   master -> master (permission denied)
error: failed to push some refs to 'git@github.com:flo-v/sushi.git'
```

Note
* I do not know why this failed, but Florian should be able to do git push.
* I may not be a collaborator of sushi.git

You are right, it worked
```
22-05-04 10:36 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220504/master
$ git push
Enumerating objects: 8, done.
Counting objects: 100% (8/8), done.
Delta compression using up to 32 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 793 bytes | 793.00 KiB/s, done.
Total 5 (delta 3), reused 0 (delta 0)
remote: Resolving deltas: 100% (3/3), completed with 3 local objects.
To github.com:flo-v/sushi.git
   4450a47f..820e59d1  master -> master
```
* Done

Next
* ezRun installation and run test

Log
```
22-05-04 10:39 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426
$ which R
/usr/local/ngseq/bin/R
22-05-04 10:40 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426
$ R --version
R version 4.1.2 (2021-11-01) -- "Bird Hippie"

22-05-04 10:41 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426
$ R

> .libPaths()
[1] "/home/masaomi/R/x86_64-pc-linux-gnu-library/4.1"
[2] "/misc/ngseq10/packages/Dev/R/4.1.2/lib/R/library"

22-05-04 10:42 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426
$ vim ~/.Rprofile
.libPaths("/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/RLIBS")

22-05-04 10:38 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426
$ git clone git@github.com:flo-v/ezRun.git

$ vim ~/.bashrc
alias ezins='R CMD INSTALL /srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/ezRun/'
```

Error
```
22-05-04 10:48 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426
$ R CMD INSTALL /srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/ezRun/
* installing to library ‘/export/kenlab/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/RLIBS’
* installing *source* package ‘ezRun’ ...
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error : package or namespace load failed for ‘celda’ in dyn.load(file, DLLpath = DLLpath, ...):
 unable to load shared object '/misc/ngseq10/packages/Dev/R/4.1.2/lib/R/library/magick/libs/magick.so':
  libMagick++-6.Q16.so.8: cannot open shared object file: No such file or directory
Error: unable to load R code in package ‘ezRun’
Execution halted
ERROR: lazy loading failed for package ‘ezRun’
* removing ‘/export/kenlab/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/RLIBS/ezRun’

```
* fgcz-c-047 needs libMagic

Next
* test run VcfStatsApp
* ezRun R code structure

After you update ezRun code
```
22-05-04 11:26 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/ezRun
$ git add inst/templates/VcfStats.Rmd
22-05-04 11:26 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/ezRun
$ git commit -m "Test VcfStats.Rmd"
[master 99021ed2] Test VcfStats.Rmd
 1 file changed, 2 insertions(+)
22-05-04 11:27 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/ezRun
$ git push
Enumerating objects: 9, done.
Counting objects: 100% (9/9), done.
Delta compression using up to 32 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 463 bytes | 463.00 KiB/s, done.
Total 5 (delta 3), reused 0 (delta 0)
remote: Resolving deltas: 100% (3/3), completed with 3 local objects.
To github.com:flo-v/ezRun.git
   7d9799aa..99021ed2  master -> master

22-05-04 11:28 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426
$ ezins

22-05-04 11:29 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426
$ bundle exec rails s -e production -b fgcz-c-047.uzh.ch -p 4001

```
* Then, test job submission

Goal
* Various types of phylogenetic trees, clusterings using a vcf file
* SNPRelate SUSHI App by plotting phylogenetics tree

Masa, ToDo
1. Install some lack libraries for installing ezRun in fgcz-c-047

Florian, ToDo
1. SUSHI instance run test again with new files
2. test run MinimalApp
3. test run VcfStatsApp
4. test updating something in VcfStatsApp
5. test SNPRelate tutorial and make a PCA plot in RStudio
6. try SUSHI application for PCA plot as an example
7. and meeting again

Note
* Masa will be teaching on 18-20, Bio334, practical bioinformatics, R, Python coding

## 05 May 2022, ezRun install test, Masa

Log
```
# 22-05-05 13:27 masaomi@fgcz-h-176:/srv/GT/analysis/masaomi/2022/FGCZ/test_install_ezrun_on_c47_20220505
$ git clone git@github.com:flo-v/ezRun.git ezRun_flo
$ mkdir R_LIBS
$ vim ~/.Rprofile
# .libPaths("/srv/GT/analysis/masaomi/2022/FGCZ/test_install_ezrun_on_c47_20220505/R_LIBS")

$ R -q -e ".libPaths()"
# > .libPaths()
# [1] "/misc/GT/analysis/masaomi/2022/FGCZ/test_install_ezrun_on_c47_20220505/R_LIBS"
# [2] "/misc/ngseq10/packages/Dev/R/4.1.2/lib/R/library"

$ R CMD INSTALL /srv/GT/analysis/masaomi/2022/FGCZ/test_install_ezrun_on_c47_20220505/ezRun_flo/
# * installing to library ‘/misc/GT/analysis/masaomi/2022/FGCZ/test_install_ezrun_on_c47_20220505/R_LIBS’
# * installing *source* package ‘ezRun’ ...
# ** using staged installation
# ** R
# ** inst
# ** byte-compile and prepare package for lazy loading
# loading EZ_GLOBAL_VARIABLES  from: /misc/GT/analysis/masaomi/2022/FGCZ/test_install_ezrun_on_c47_20220505/R_LIBS/00LOCK-ezRun_flo/00new/ezRun/extdata/EZ_GLOBAL_VARIABLES.txt
# ** help
# *** installing help indices
# ** building package indices
# ** installing vignettes
# ** testing if installed package can be loaded from temporary location
# ** testing if installed package can be loaded from final location
# ** testing if installed package keeps a record of temporary installation path
# * DONE (ezRun)
```

To Florian
* Pleaase copy **@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220505.tgz** again to your working directory
* I modified the ezRun installed path as follows

```
22-05-05 13:53 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220505/master
$ grep 'flo' lib/global_variables.rb
    command<<  "library(ezRun, lib.loc='/srv/GT/analysis/florian/R_LIBS/')\n"
```

* Please use **/srv/GT/analysis/florian/R_LIBS/** for installing ezRun, which means you should write the following line in your ~/.Rprofile

~/.Rrofile
```
.libPaths("/srv/GT/analysis/florian/R_LIBS")
```

* Please use **fgcz-genomics.uzh.ch**, not *fgcz-c-047.uzh.ch*, when you install ezRun

Note
* */srv/kenlab* directory is mounted (accessible) only on *fgcz-c-047*, but */srv/GT/analysis/florian/R_LIBS/* is shared by all cluster nodes and a SUSHI job can access the installed ezRun library
* SUSHI instance should run on *fgcz-c-047*, but ezRun installation should be done on *fgcz-genomics.uzh.ch* because some libraries are missing on *fgcz-c-047* for the ezRun installation, in other words, the command, *R CMD INSTALL xxx*, should run on *fgcz-genomics.uzh.ch* (it is shown as **fgcz-h-176** in command prompt after you login fgcz-genomics.uzh.ch, see the command log above).
* You can do *git clone* and edit your ezRun code on either *fgcz-c-047.uzh.ch* or *fgcz-genomics.uzh.ch*.

Sorry for complication. If you have a quesiton, please feel free to ask me.


## 06-current May 2022,testing FastQC & Minimal App and ezRun install test, Flo

Log
```
22-05-04 10:10 masaomi@fgcz-c-047:/srv/kenlab/flo
$ rm -rf flo_sushi_20220*
$ cp -r /srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220505.tgz .
$ tar zxvf flo_sushi_20220505.tgz
$ cd flo_sushi_20220505/master/
$ source /usr/local/ngseq/etc/lmod_profile
$ module load Dev/Ruby/3.0.3
$ bundle exec rails s -e production -b fgcz-c-047.uzh.ch -p 5000
```
Testing FastQCApp:
[FGCZ website steps](#fgcz-website-steps)

### Problem:
* After submitting the FastQC analysis the job doesn't finish (takes more than 1 hour)
* MinimalApp.rb is not listed under stats category when chosing apps for analysis on http://fgcz-c-047.uzh.ch:5000 (I clicked refresh as well), even though I can see the app in /srv/kenlab/flo/flo_sushi_20220505/master/lib (testdata used: ventricles_100k)



Making & testing MinimalApp:







